//
//  CharacterDetailsView.swift
//  BreakingBad
//
//  Created by Brandon Levasseur on 10/11/21.
//

import SwiftUI

struct CharacterDetailsView: View {
    let character: Character
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                AsyncImage(url: character.imageURL) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                Text(character.name)
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                
            }
            
            Text("Occupations:")
                .padding()
                .font(.headline)
            ForEach(character.occupations, id: \.self) { occupation in
                Text(occupation)
            }
            Spacer()
            Text("Status:")
                .padding()
                .font(.headline)
            Text(character.status)
            Text("Nickname:")
                .padding()
                .font(.headline)
            Text(character.nickname)
            SeasonAppearanceView(character: character)
            Spacer()
        }
        .navigationTitle(character.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CharacterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailsView(character: .mock)
    }
}
