//
//  NetworkManager.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import Combine
import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() { }

    func request<T: Router, U: Decodable>(
        router: T,
        responseType: U.Type
    ) -> AnyPublisher<U, Error> {
        do {
            let request = try router.asURLRequest()
            var capturedStatusCode: Int? = nil

            return URLSession.shared.dataTaskPublisher(for: request)
                .tryMap { data, response in
                    guard let httpResponse = response as? HTTPURLResponse else {
                        throw NetworkManagerError.invalidResponse
                    }

                    capturedStatusCode = httpResponse.statusCode

                    guard (200...299).contains(httpResponse.statusCode) else {
                        throw NetworkManagerError.httpError(statusCode: httpResponse.statusCode)
                    }

                    return data
                }
                .decode(type: U.self, decoder: JSONDecoder())
                .mapError { error -> T.ErrorType in
                    return router.throwError(error, statusCode: capturedStatusCode)
                }
                .eraseToAnyPublisher()

        } catch {
            let customError = router.throwError(error, statusCode: nil)
            return Fail(error: customError).eraseToAnyPublisher()
        }
    }
}
