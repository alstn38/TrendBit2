//
//  CoingeckoEndPoint.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import Foundation

enum CoingeckoEndPoint: Router {
    case trendInfo
    case search(query: String)
    case detail(ids: [String])
}

extension CoingeckoEndPoint {
    typealias ErrorType = CoingeckoAPIError
    
    var url: URL? {
        return URL(string: baseURL + path)
    }
    
    var baseURL: String {
        return Secret.coingeckoBaseURL
    }
    
    var path: String {
        switch self {
        case .trendInfo:
            return "/search/trending"
        case .search:
            return "/search"
        case .detail:
            return "/coins/markets"
        }
    }
    
    var method: String {
        switch self {
        case .trendInfo:
            return "GET"
        case .search:
            return "GET"
        case .detail:
            return "GET"
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .trendInfo:
            return nil
        case .search(let query):
            return [
                "query": query
            ]
        case .detail(let ids):
            return [
                "vs_currency": "krw",
                "locale": "ko",
                "ids": ids.joined(separator: ","),
                "sparkline": "true",
            ]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        guard let url else {
            throw ErrorType.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = method

        headers?.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }

        if let parameters = parameters, method == "GET" {
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
            components?.queryItems = parameters.map { key, value in
                URLQueryItem(name: key, value: String(describing: value))
            }
            if let finalURL = components?.url {
                request.url = finalURL
            }
        }

        return request
    }
    
    func throwError(_ error: Error, statusCode: Int?) -> ErrorType {
        if error is DecodingError {
            return .decodeError
        }
        
        if let statusCode {
            switch statusCode {
            case 400:
                return .badRequest
            case 401:
                return .unauthorized
            case 403:
                return .forbidden
            case 429:
                return .tooManyRequest
            case 500:
                return .serverError
            case 503:
                return .serviceUnavailable
            case 1020:
                return .accessDenied
            case 10002:
                return .missingAPIKey
            case 10005:
                return .limitedProAPI
            default:
                return .unownedError
            }
        }
        
        return .unownedError
    }
}
