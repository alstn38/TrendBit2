//
//  CoinDetailDTO.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import Foundation

struct CoinDetailDTO: Decodable {
    let id: String
    let symbol: String
    let name: String
    let image: String
    let currentPrice: Double
    let marketCap: Double
    let marketCapRank: Int
    let fullyDilutedValuation: Double?
    let totalVolume: Double
    let high24H: Double?
    let low24H: Double?
    let priceChange24H: Double?
    let priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply: Double?
    let totalSupply: Double?
    let maxSupply: Double?
    let ath: Double
    let athChangePercentage: Double
    let athDate: String
    let atl: Double
    let atlChangePercentage: Double
    let atlDate: String
    let lastUpdated: String
    let sparklineIn7D: SparklineIn7D

    enum CodingKeys: String, CodingKey {
        case id
        case symbol
        case name
        case image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
    }
}

struct SparklineIn7D: Decodable {
    let price: [Double]
}

// MARK: - To Entity Method
extension CoinDetailDTO {
    
    func toFavoriteEntity() -> FavoriteCoinEntity {
        return FavoriteCoinEntity(
            id: id,
            name: name,
            ticker: symbol.uppercased(),
            price: NumberFormatterManager.shared.pointNumberString(from: currentPrice),
            change: priceChangePercentage24H ?? 0.0,
            iconName: image
        )
    }
    
    func toCoinDetailEntity() -> CoinDetailEntity {
        return CoinDetailEntity(
            id: id,
            name: name,
            iconName: image,
            price: formattedPrice(currentPrice),
            change: priceChangePercentage24H ?? 0.0,
            high: formattedPrice(high24H),
            low: formattedPrice(low24H),
            recordHigh: formattedPrice(ath),
            recordLow: formattedPrice(atl),
            changePrices: sparklineIn7D.price,
            lastUpdated: detailAllTheTimeString(dateString: lastUpdated),
            isFavorite: FavoriteCoinStorage.shared.isFavorite(coinID: id)
        )
    }
    
    private func formattedPrice(_ value: Double?) -> String {
        guard let value else { return "정보 없음" }
        return "₩" + NumberFormatterManager.shared.pointNumberString(from: value)
    }
    
    private func detailAllTheTimeString(dateString: String) -> String {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

        guard let date = isoFormatter.date(from: dateString) else {
            return "업데이트 시간 알 수 없음"
        }

        let displayFormatter = DateFormatter()
        displayFormatter.dateFormat = "M/d HH:mm:ss"
        displayFormatter.locale = Locale(identifier: "ko_KR")

        return displayFormatter.string(from: date) + " 업데이트"
    }
}
