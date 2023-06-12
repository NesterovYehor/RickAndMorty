//
//  ListIconView.swift
//  RickAndMorty
//
//  Created by Yehor Nesterov on 30.05.2023.
//

import SwiftUI

struct ListIconView: View {
    let url: String
    let name: String
    let status: String
    let characterId: Int
    var body: some View {
        HStack{
            VStack{
                IconImageViewRM(vm: IconImageViewModelRM(url: URL(string: url)!, characterId: characterId))
                Text(name)
                    .font(.title3)
                    .fontWeight(.bold)
                Text("Status: \(status)")
                    .font(.subheadline)
                    .foregroundColor(.theme.secondaryText)
            }
            .background(){
                Rectangle()
                    .fill(Color.theme.background)
                    .shadow(color: .theme.shadows, radius: 5)
            }
        }
    }
}

struct ListIconView_Previews: PreviewProvider {
    static var previews: some View {
        ListIconView(url: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", name: "Rick Sanches", status: "Status: Alive", characterId: 1)
    }
}


