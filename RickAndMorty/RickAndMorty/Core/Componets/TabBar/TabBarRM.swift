//
//  TabBarRM.swift
//  RickAndMorty
//
//  Created by Yehor Nesterov on 26.05.2023.
//

import SwiftUI

struct TabBarRM: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct TabBarRM_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            TabBarRM()
                .preferredColorScheme(.dark)
            TabBarRM()
                .preferredColorScheme(.light)
        }
    }
}
