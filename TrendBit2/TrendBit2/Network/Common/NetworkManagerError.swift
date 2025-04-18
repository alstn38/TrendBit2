//
//  NetworkManagerError.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import Foundation

enum NetworkManagerError: Error {
    case invalidResponse
    case httpError(statusCode: Int)
    case decodingError
}
