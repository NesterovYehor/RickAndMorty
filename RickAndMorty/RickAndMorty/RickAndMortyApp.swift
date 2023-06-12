//
//  RickAndMortyApp.swift
//  RickAndMorty
//
//  Created by Yehor Nesterov on 25.05.2023.
//

import SwiftUI

@main
struct RickAndMortyApp: App {
    var body: some Scene {
        WindowGroup {
            HomeViewRM()
                .preferredColorScheme(.light)
        }
    }
}
