//
//  CaractersPageRM.swift
//  RickAndMorty
//
//  Created by Yehor Nesterov on 26.05.2023.
//

import SwiftUI

struct CaractersPageRM: View {
    private let columns: [GridItem] = [
        GridItem(.fixed(UIScreen.main.bounds.width * 0.45)),
        GridItem(.fixed(UIScreen.main.bounds.width * 0.45))
    ]
    @StateObject var vm = CharactersViewModelRM()
    var body: some View {
        NavigationView {
            ScrollView{
                LazyVGrid(columns: columns) {
                    ForEach(vm.allCharacters) { character in
                        NavigationLink(destination: CharacterDetailViewRM(character: character)) {
                            ListIconView(url: character.image, name: character.name, status: character.status, characterId: character.id)
                        }
                    }
                }

            }.navigationTitle("Characters")
        }
    }
}

struct CaractersPageRM_Previews: PreviewProvider {
    static var previews: some View {
        CaractersPageRM()
    }
}

//
