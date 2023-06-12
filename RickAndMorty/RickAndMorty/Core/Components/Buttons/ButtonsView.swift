//
//  ButtonsView.swift
//  RickAndMorty
//
//  Created by Yehor Nesterov on 03.06.2023.
//

import SwiftUI

struct ButtonsView: View {
    var imageName: String
    var body: some View {
        Image(systemName: imageName)
            .font(.title3)
            .padding()
            .foregroundColor(Color.theme.accent)
            .background {
                Circle()
                    .fill(Color.theme.background)
                    .shadow(color: Color.theme.shadows, radius: 5)
            }
            .padding()
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView(imageName: "info")
    }
}
