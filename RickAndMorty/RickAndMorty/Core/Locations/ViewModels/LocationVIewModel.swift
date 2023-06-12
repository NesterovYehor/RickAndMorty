//
//  LocationViewModelRM.swift
//  RickAndMorty
//
//  Created by Yehor Nesterov on 28.05.2023.
//

import Foundation

class LocationViewModelRM: ObservableObject{
    @Published var allLocations: [LocationRM] = []
    
    //MARK: LIST OF SYSTEM ERRORS
    enum SystemErrors{
        case incorectURL
        case nodata
    }
    init() {
        getLocationAPI()

    }
    func getLocationAPI() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/location") else{print(SystemErrors.incorectURL); return}
            downloadLocationAPI(fromURL: url) { returnedData in
                if let data = returnedData{
                    guard let newLocation = try? JSONDecoder().decode(LocationResponse.self, from: data) else{return}
                    DispatchQueue.main.async { [weak self] in 
                        self?.allLocations = newLocation.location
                    }
                }
                else{
                    print(SystemErrors.nodata)
                }
            }
    }
    func downloadLocationAPI(fromURL url: URL, complishenHandler: @escaping (_ data: Data?) -> ()){
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else{
                print(SystemErrors.nodata)
                return
            }
            guard error == nil else{
                print("ERROR: \(error)")
                return
            }
            complishenHandler(data)
        }.resume()
    }
}
