//
//  CoinDetailViewModel.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import Combine
import Foundation

final class CoinDetailViewModel: ViewModelType {
    
    // MARK: - Input / Output
    struct Input {
        let onAppear = PassthroughSubject<String, Never>()
        let toggleFavorite = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        var coinDetail: CoinDetailEntity?
    }
    
    @Published var input = Input()
    @Published var output = Output()
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        transform()
    }
    
    // MARK: - Transform
    func transform() {
        input.onAppear
            .sink { [weak self] id in
                self?.fetchCoinDetail(id: id)
            }
            .store(in: &cancellables)
        
        input.toggleFavorite
            .sink { [weak self] in
                self?.toggleFavorite()
            }
            .store(in: &cancellables)
    }
    
    private func fetchCoinDetail(id: String) {
        NetworkManager.shared
            .request(
                router: CoingeckoEndPoint.detail(ids: [id]),
                responseType: [CoinDetailDTO].self
            )
            .compactMap { $0.first }
            .map { dto in
                var entity = dto.toCoinDetailEntity()
                entity.isFavorite = FavoriteCoinStorage.shared.isFavorite(coinID: dto.id)
                return entity
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("❌ 코인 상세 통신 오류:", error)
                }
            }, receiveValue: { [weak self] entity in
                self?.output.coinDetail = entity
            })
            .store(in: &cancellables)
    }
    
    private func toggleFavorite() {
        guard let coinID = output.coinDetail?.id else { return }
        FavoriteCoinStorage.shared.toggleFavorite(for: coinID)
        output.coinDetail?.isFavorite.toggle()
    }
}
