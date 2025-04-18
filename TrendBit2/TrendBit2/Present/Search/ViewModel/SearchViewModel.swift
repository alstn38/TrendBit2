//
//  SearchViewModel.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import Combine
import Foundation

final class SearchViewModel: ViewModelType {
    
    // MARK: - Input / Output
    struct Input {
        var query: String = ""
        let searchSubmitted = PassthroughSubject<Void, Never>()
        let toggleFavorite = PassthroughSubject<String, Never>()
    }
    
    struct Output {
        var searchResults: [CoinSearchItem] = []
    }
    
    @Published var input = Input()
    @Published var output = Output()
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        transform()
    }
    
    func transform() {
        input.searchSubmitted
            .sink { [weak self] in
                self?.fetchSearchResults(for: self?.input.query ?? "")
            }
            .store(in: &cancellables)
        
        input.toggleFavorite
            .sink { [weak self] coinID in
                self?.toggleFavorite(for: coinID)
            }
            .store(in: &cancellables)
    }
    
    private func fetchSearchResults(for query: String) {
        NetworkManager.shared
            .request(
                router: CoingeckoEndPoint.search(query: query),
                responseType: SearchCoinDTO.self
            )
            .map { dto in
                dto.coins.map { $0.toEntity() }
            }
            .receive(on: DispatchQueue.main)
            .replaceError(with: [])
            .sink { [weak self] items in
                self?.output.searchResults = items
            }
            .store(in: &cancellables)
    }
    
    private func toggleFavorite(for id: String) {
        print(id)
        FavoriteCoinStorage.shared.toggleFavorite(for: id)
        if let index = output.searchResults.firstIndex(where: { $0.id == id }) {
            output.searchResults[index].isFavorite.toggle()
        }
    }
}
