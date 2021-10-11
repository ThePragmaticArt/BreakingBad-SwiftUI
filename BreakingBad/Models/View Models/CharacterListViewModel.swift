//
//  CharacterListViewModel.swift
//  BreakingBad
//
//  Created by Brandon Levasseur on 10/11/21.
//

import Foundation
import Combine

class CharacterListViewModel: ObservableObject {
    @Published var characters = [Character]()
    @Published var searchText = ""
    @Published var searchedCharacters = [Character]()
    @Published var searchedSeason: Int?
    @Published var seasons = [Int]()
    
    init() {
        bindModels()
    }
    
    private func bindModels() {
        
        $characters.map { characters -> [Int] in
            let seasons = characters.flatMap(\.seasonAppearances)
            let uniqueSeasons = Set(seasons)
            return Array(uniqueSeasons).sorted(by: <)
        }.assign(to: &$seasons)
        
        Publishers.CombineLatest3($characters, $searchText, $searchedSeason)
            .map { characters, searchText, searchedSeason -> [Character] in
                var characters = CharacterListViewModel.filterCharacters(characters, inSeason: searchedSeason)
                characters = CharacterListViewModel.filterCharacters(characters, byName: searchText)
                return characters
            }.assign(to: &$searchedCharacters)
    }
    
    private static func filterCharacters(_ characters: [Character], byName name: String?) -> [Character] {
        guard let name = name else {
            return characters
        }
        
        guard !name.isEmpty else {
            return characters
        }
        
        return characters.filter {
            let normalizedName = $0.name.lowercased()
            let normalizedSearchText = name.lowercased()
            return normalizedName.contains(normalizedSearchText)
        }
    }
    
    private static func filterCharacters(_ characters: [Character], inSeason season: Int?) -> [Character] {
        guard let season = season else {
            return characters
        }
        
        let characters = characters.filter { $0.seasonAppearances.contains(season) }
        return characters
    }
    
    func requestCharacters() {
        Character.request()
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .assign(to: &$characters)
    }
}
