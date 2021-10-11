//
//  SeasonAppearanceView.swift
//  BreakingBad
//
//  Created by Brandon Levasseur on 10/11/21.
//

import SwiftUI

struct SeasonAppearanceView: View {
    let character: Character
    let rows = [
        GridItem(.fixed(50))
    ]
    
    var body: some View {
        VStack {
            Text("Season Appearances:")
                .padding()
                .font(.headline)
            LazyHGrid(rows: rows, alignment: .center) {
                ForEach(character.seasonAppearances, id: \.self) { season in
                    Text("\(season)")
                }
            }
        }
    }
}

struct SeasonAppearanceView_Previews: PreviewProvider {
    static var previews: some View {
        SeasonAppearanceView(character: .mock)
    }
}
