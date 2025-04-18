//
//  Router.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import Foundation

protocol Router {
    associatedtype ErrorType: Error

    var url: URL? { get }
    var baseURL: String { get }
    var path: String { get }
    var method: String { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }

    func asURLRequest() throws -> URLRequest
    func throwError(_ error: Error, statusCode: Int?) -> ErrorType
}
