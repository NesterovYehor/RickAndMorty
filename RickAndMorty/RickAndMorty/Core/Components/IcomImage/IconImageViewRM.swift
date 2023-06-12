//
//  IconImageRM.swift
//  RickAndMorty
//
//  Created by Yehor Nesterov on 01.06.2023.
//

import SwiftUI

struct IconImageViewRM: View {
    @StateObject var vm: IconImageViewModelRM
    var body: some View {
        ZStack{
            if let image = vm.image{
                Image(uiImage: image)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.22)
            }else if vm.isloading{
                ProgressView()
            }else{
                Image(systemName: "questionmark")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.27)
            }
        }
    }
}

struct IconImageRM_Previews: PreviewProvider {
    static var previews: some View {
        IconImageViewRM(vm: IconImageViewModelRM(url: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!, characterId: 1))
    }
}
