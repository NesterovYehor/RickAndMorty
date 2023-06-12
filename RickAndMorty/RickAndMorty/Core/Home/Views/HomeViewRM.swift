//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Yehor Nesterov on 25.05.2023.
//

import SwiftUI

struct HomeViewRM: View {
    @StateObject var vm = HomeViewModelRM()
    let pageOfCaracters = CaractersPageRM()
    let pageOfLocations = LocationPageRM()
    let pageOfEpisodes = EpisodesPageRM()
    var body: some View {
        TabView{
                pageOfCaracters
                    .tabItem {
                        Image(systemName: "person.circle")
                        Text("Caracters")
                    }

                pageOfLocations
                .tabItem {
                    Image(systemName: "globe")
                    Text("Locations")
                }
                pageOfEpisodes
                .tabItem {
                    Image(systemName: "tv.fill")
                    Text("Episodes")
                }
        }.accentColor(.theme.accent)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            HomeViewRM()
                .preferredColorScheme(.light)
            HomeViewRM()
                .preferredColorScheme(.dark)

        }
    }
}

