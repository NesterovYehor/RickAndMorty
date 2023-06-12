//
//  SettingsPage.swift
//  RickAndMorty
//
//  Created by Yehor Nesterov on 26.05.2023.
//

import SwiftUI

struct SettingsPageRM: View {
    var body: some View {
        NavigationView {
            ScrollView{
                Text("Rick")
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPageRM()
    }
}
