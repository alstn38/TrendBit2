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

    func setFavorite(_ isFavorite: Bool, for coinID: String) -> FavoriteState {
        if isFavorite {
            if favorites.count < 10 {
                favorites[coinID] = true
                ToastManager.shared.show(message: FavoriteState.successFavorite.message)
                return .successFavorite
            } else {
                ToastManager.shared.show(message: FavoriteState.failFavorite.message)
                return .failFavorite
            }
        } else {
            favorites.removeValue(forKey: coinID)
            ToastManager.shared.show(message: FavoriteState.deleteFavorite.message)
            return .deleteFavorite
        }
    }

    func toggleFavorite(for coinID: String) -> FavoriteState {
        if favorites[coinID] != nil {
            favorites.removeValue(forKey: coinID)
            ToastManager.shared.show(message: FavoriteState.deleteFavorite.message)
            return .deleteFavorite
        } else {
            if favorites.count < 10 {
                favorites[coinID] = true
                ToastManager.shared.show(message: FavoriteState.successFavorite.message)
                return .successFavorite
            } else {
                ToastManager.shared.show(message: FavoriteState.failFavorite.message)
                return .failFavorite
            }
        }
    }

    func allFavorites() -> [String] {
        return Array(favorites.keys)
    }
    
    enum FavoriteState {
        case successFavorite
        case failFavorite
        case deleteFavorite
        
        var message: String {
            switch self {
            case .successFavorite:
                return "즐겨찾기에 성공적으로 추가되었습니다."
            case .failFavorite:
                return "즐겨찾기는 최대 10개까지만 가능합니다."
            case .deleteFavorite:
                return "즐겨찾기에서 제거되었습니다."
            }
        }
    }
}
