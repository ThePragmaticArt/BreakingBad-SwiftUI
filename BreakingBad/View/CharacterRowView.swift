//
//  CharacterRowView.swift
//  BreakingBad
//
//  Created by Brandon Levasseur on 10/11/21.
//

import SwiftUI

struct CharacterRowView: View {
    let character: Character
    
    var body: some View {
        HStack {
            AsyncImage(url: character.imageURL, content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
            }, placeholder: {
                ProgressView()
            }).frame(width: 50, height: 50)
                .background(Color.black)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.red, lineWidth: 2))
            Text(character.name)
                .font(.headline)
            Spacer()
        }.padding()
    }
}

struct CharacterRowView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterRowView(character: .mock)
    }
}
