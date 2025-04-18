//
//  Secret.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import Foundation

enum Secret {
    
    static let coingeckoBaseURL: String = {
        guard let urlString = Bundle.main.infoDictionary?["COINGECKO_BASE_URL"] as? String else {
            fatalError("COINGECKO_BASE_URL ERROR")
        }
        
        return urlString
    }()
}
