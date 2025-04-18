//
//  FavoriteCoinStorage.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import Foundation

final class FavoriteCoinStorage {
    
    static let shared = FavoriteCoinStorage()
    
    @UserDefault(key: "favoriteCoinIDs", defaultValue: [:])
    private var favorites: [String: Bool]
    
    private init() {}

    func isFavorite(coinID: String) -> Bool {
        return favorites[coinID] != nil
    }

    func setFavorite(_ isFavorite: Bool, for coinID: String) {
        if isFavorite {
            favorites[coinID] = true
        } else {
            favorites.removeValue(forKey: coinID)
        }
    }

    func toggleFavorite(for coinID: String) {
        if favorites[coinID] != nil {
            favorites.removeValue(forKey: coinID)
        } else {
            favorites[coinID] = true
        }
    }

    func allFavorites() -> [String] {
        return Array(favorites.keys)
    }
}
