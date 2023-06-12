//
//  EpisodesViewModelRM.swift
//  RickAndMorty
//
//  Created by Yehor Nesterov on 28.05.2023.
//

import Foundation

class EpisodesViewModelRM: ObservableObject{
    @Published var allEpisodes: [EpisodeRM] = []
    
    //MARK: LIST OF SYSTEM ERRORS
    enum SystemErrors{
        case incorectURL
        case nodata
    }
    init() {
        getEposodeAPI()
    }
    func getEposodeAPI() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/episode") else{print(SystemErrors.incorectURL); return}
        downloadEposodeAPI(fromURL: url) { returnedData in
                if let data = returnedData{
                    guard let newEpisodes = try? JSONDecoder().decode(EpisodeResponse.self, from: data) else{return}
                    DispatchQueue.main.async { [weak self] in
                        self?.allEpisodes = newEpisodes.episodes
                    }
                }
                else{
                    print(SystemErrors.nodata)
                }
            }
    }
    func downloadEposodeAPI(fromURL url: URL, complishenHandler: @escaping (_ data: Data?) -> ()){
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

