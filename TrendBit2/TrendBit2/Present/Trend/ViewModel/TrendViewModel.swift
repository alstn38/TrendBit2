//
//  TrendViewModel.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import Combine
import Foundation

final class TrendViewModel: ViewModelType {
    
    struct Input {
        let onAppear = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        var favoriteCoins: [FavoriteCoinEntity] = []
        var rankedCoins: [RankedCoinEntity] = []
        var rankedNFTs: [RankedCoinEntity] = []
    }
    
    @Published var output = Output()
    var input = Input()
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        transform()
    }
    
    func transform() {
        input.onAppear
            .sink { [weak self] in
                self?.loadFavoriteCoins()
                self?.loadTrendInfo()
            }
            .store(in: &cancellables)
    }
    
    private func loadFavoriteCoins() {
        let ids = FavoriteCoinStorage.shared.allFavorites()
        guard ids.count >= 2 else {
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
    
    private func loadTrendInfo() {
        NetworkManager.shared
            .request(
                router: CoingeckoEndPoint.trendInfo,
                responseType: TrendInfoDTO.self
            )
            .map { dto in
                return (
                    coins: dto.toCoinRankEntities(),
                    nfts: dto.toNFTRankEntities()
                )
            }
            .receive(on: DispatchQueue.main)
            .replaceError(with: ([], []))
            .sink { [weak self] data in
                let (coinList, nftList) = data
                self?.output.rankedCoins = coinList
                self?.output.rankedNFTs = nftList
            }
            .store(in: &cancellables)
    }
}
