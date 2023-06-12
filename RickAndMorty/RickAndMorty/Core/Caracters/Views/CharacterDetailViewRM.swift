//
//  CharacterDetailViewRM.swift
//  RickAndMorty
//
//  Created by Yehor Nesterov on 03.06.2023.
//

import SwiftUI

struct CharacterDetailViewRM: View {
    @Environment(\.presentationMode) var presentationMode
    
    var character: CharacterRM
    var body: some View {
        NavigationView {
            VStack{
                Button("〈CHARACTERS") {
                    presentationMode.wrappedValue.dismiss()
                }.frame(maxWidth: .infinity, alignment: .leading)

                if let image = IconImageViewModelRM(url: URL(string: character.image)!, characterId: character.id).image{
                    Image(uiImage: image)
                        .resizable()
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.95, maxHeight: UIScreen.main.bounds.height * 0.45)
                }
                else{
                    Image(systemName: "heart")
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.3)
                }
                HStack{
                    UnitOfDetailsRM(unitTitel: "STATUS", unitText: character.status)
                    UnitOfDetailsRM(unitTitel: "GENDER", unitText: character.gender)

                }
                HStack{
                    UnitOfDetailsRM(unitTitel: "TYPE", unitText: character.type == "" ? "None" : character.type)
                    UnitOfDetailsRM(unitTitel: "SPECIES", unitText: character.species)
                }
                HStack{
                    UnitOfDetailsRM(unitTitel: "ORIGIN", unitText: character.origin.name)
                    UnitOfDetailsRM(unitTitel: "CURRENT LOCATION", unitText: character.location.name)
                }

                Spacer()
            }
        }.navigationBarHidden(true)

    }
}

struct CharacterDetailViewRM_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailViewRM(character: CharacterRM(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", type: "", gender: "Male", origin: CaracterLocation(name: "Earth", url: "https://rickandmortyapi.com/api/location/1"), location: CaracterLocation(name: "Earth", url: "https://rickandmortyapi.com/api/location/20"), image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: ["https://rickandmortyapi.com/api/episode/1"]))
    }
}

