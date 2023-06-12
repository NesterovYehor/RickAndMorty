//
//  LocationPageRM.swift
//  RickAndMorty
//
//  Created by Yehor Nesterov on 26.05.2023.
//

import SwiftUI

struct LocationPageRM: View {
    @StateObject var vm = LocationViewModelRM()
    var body: some View {
        NavigationView {
            List(){
                ForEach(vm.allLocations) { location in
                    Text(location.name)
                }
            }
            .navigationTitle("Locations")
        }
    }
}

struct LocationPageRM_Previews: PreviewProvider {
    static var previews: some View {
        LocationPageRM()
    }
}
