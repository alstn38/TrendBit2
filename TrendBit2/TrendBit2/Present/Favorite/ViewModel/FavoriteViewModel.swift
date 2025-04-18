//
//  FavoriteViewModel.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import Combine
import Foundation

final class FavoriteViewModel: ViewModelType {

    // MARK: - Input / Output
    struct Input {
        let onAppear = PassthroughSubject<Void, Never>()
    }

    struct Output {
        var favoriteCoins: [FavoriteCoinEntity] = []
    }

    @Published var input = Input()
    @Published var output = Output()

    var cancellables = Set<AnyCancellable>()

    init() {
        transform()
    }

    func transform() {
        input.onAppear
            .sink { [weak self] in
                self?.fetchFavoriteCoins()
            }
            .store(in: &cancellables)
    }

    private func fetchFavoriteCoins() {
        let ids = FavoriteCoinStorage.shared.allFavorites()
        guard !ids.isEmpty else {
            output.favoriteCoins = []
            return
        }

        NetworkManager.shared
            .request(
                router: CoingeckoEndPoint.detail(ids: ids),
                responseType: [CoinDetailDTO].self
            )
            .map { $0.map { $0.toFavoriteEntity() } }
            .receive(on: DispatchQueue.main)
            .replaceError(with: [])
            .sink { [weak self] entities in
                self?.output.favoriteCoins = entities
            }
            .store(in: &cancellables)
    }
}

