//
//  EpisodesPage.swift
//  RickAndMorty
//
//  Created by Yehor Nesterov on 26.05.2023.
//

import SwiftUI

struct EpisodesPageRM: View {
    @StateObject var vm = EpisodesViewModelRM()
    var body: some View {
        NavigationView {
            List(){
                ForEach(vm.allEpisodes) { episode in
                    Text(episode.name)
                }
            }
            .navigationTitle("Episode")
        }
    }
}

struct EpisodesPage_Previews: PreviewProvider {
    static var previews: some View {
        EpisodesPageRM()
    }
}
