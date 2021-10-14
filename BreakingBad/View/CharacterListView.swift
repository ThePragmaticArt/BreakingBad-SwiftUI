//
//  ContentView.swift
//  BreakingBad
//
//  Created by Brandon Levasseur on 10/11/21.
//

import SwiftUI

struct CharacterListView: View {
    @ObservedObject var viewModel = CharacterListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.searchedCharacters) { character in
                NavigationLink(destination: CharacterDetailsView(character: character)) {
                    CharacterRowView(character: character)
                }
            }.searchable(text: $viewModel.searchText)
                .navigationTitle("Breaking Bad")
                .toolbar {
                    Picker("Seasons", selection: $viewModel.searchedSeason) {
                        Text("Season (All)").tag(nil as Int?)
                        ForEach(viewModel.seasons, id: \.self) { season in
                            Text("Season: \(season)").tag(season as Int?)
                        }
                    }
                }.refreshable {
                    await viewModel.requestCharacters()
                }
        }.onAppear {
            Task {
                await viewModel.requestCharacters()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
