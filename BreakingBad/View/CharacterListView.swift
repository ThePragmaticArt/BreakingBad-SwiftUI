//
//  ContentView.swift
//  BreakingBad
//
//  Created by Brandon Levasseur on 10/11/21.
//

import SwiftUI

struct CharacterListView: View {
    @ObservedObject var viewModel = CharacterListViewModel()
    @State var showSeasonPopover = false
    
    var body: some View {
        NavigationView {
            List(viewModel.searchedCharacters) { character in
                NavigationLink(destination: CharacterDetailsView(character: character)) {
                    CharacterRowView(character: character)
                }
            }.refreshable {
                viewModel.requestCharacters()
            }.searchable(text: $viewModel.searchText)
                .navigationTitle("Breaking Bad")
                .toolbar {
                    Button("Season") {
                        self.showSeasonPopover = true
                    }
                }
        }.onAppear {
            viewModel.requestCharacters()
        }.sheet(isPresented: $showSeasonPopover) {
            Text("Select Season")
                .font(.headline)
                .padding()
            Picker("Seasons", selection: $viewModel.searchedSeason) {
                Text("None").tag(nil as Int?)
                ForEach(viewModel.seasons, id: \.self) { season in
                    Text("\(season)").tag(season as Int?)
                }
            }.pickerStyle(.wheel)
            Button("Confirm") {
                self.showSeasonPopover = false
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
