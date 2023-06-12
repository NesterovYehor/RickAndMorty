//
//  UnitOfDetailsRM.swift
//  RickAndMorty
//
//  Created by Yehor Nesterov on 08.06.2023.
//

import SwiftUI

struct UnitOfDetailsRM: View {
    var unitTitel: String
    var unitText: String
    var body: some View {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.theme.unitBackground)
                .shadow(color: Color.theme.shadows, radius: 5)
                .frame(maxWidth: UIScreen.main.bounds.width * 0.48, maxHeight: UIScreen.main.bounds.height * 0.15)
                .overlay {
                    Text(unitText)
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(.trailing)
                        .padding(.bottom)
                    
                }

                .overlay(alignment: .bottom) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.theme.shadows)
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.48, maxHeight: UIScreen.main.bounds.height * 0.05)
                        .overlay {
                            Text(unitTitel)
                                .font(.title3)
                                .foregroundColor(.white)
                        }
                }
                
    }
}

struct UnitOfDetailsRM_Previews: PreviewProvider {
    static var previews: some View {
        UnitOfDetailsRM(unitTitel: "STATUS", unitText: "ALIVE")
    }
}
