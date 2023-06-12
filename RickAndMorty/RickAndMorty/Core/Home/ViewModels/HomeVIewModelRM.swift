//
//  HomeVIewModelRM.swift
//  RickAndMorty
//
//  Created by Yehor Nesterov on 28.05.2023.
//

import Foundation

class HomeViewModelRM: ObservableObject{
    @Published var allCharacters: [CharacterRM] = []
    @Published var allLocation: [LocationRM] = []
    @Published var allEpisodes: [EpisodeRM] = []
    //MARK: CONSTANTS
    private let baseURL: String = "https://rickandmortyapi.com/api"
    

    //MARK: LIST OF SYSTEM ERRORS
    enum SystemErrors{
        case incorectURL
        case nodata
    }
    init() {
        getCharacters()
        getLocations()
        getEpisodes()
    }
    func getCharacters(){
        let url = URL(string: "https://rickandmortyapi.com/api/character")
        guard let urlOfCaracter = url else {
            print(SystemErrors.incorectURL)
            return
    }
        URLSession.shared.dataTask(with: urlOfCaracter) { [self] data, response, error in
            
            guard let data = data else{
                print(SystemErrors.nodata)
                return
            }
            guard error == nil else{
                print("ERROR: \(error)")
                return
            }
            guard let newCharacter = try? JSONDecoder().decode(CharacterRM.self, from: data) else{ return }
            DispatchQueue.main.async {[weak self] in
                self?.allCharacters.append(newCharacter)
            }
            
        }.resume()
    }
    func getLocations(){
        let url = URL(string: "https://rickandmortyapi.com/api/location")
        guard let urlOfLocation = url else {
            print(SystemErrors.incorectURL)
            return
        }
        URLSession.shared.dataTask(with: urlOfLocation) { [self] data, response, error in
            
            guard let data = data else{
                print(SystemErrors.nodata)
                return
            }
            guard error == nil else{
                print("ERROR: \(error)")
                return
            }
            guard let newLocation = try? JSONDecoder().decode(LocationRM.self, from: data) else{ return }
            DispatchQueue.main.async {[weak self] in
                self?.allLocation.append(newLocation)
            }
            
        }.resume()
    }
    func getEpisodes(){
        let url = URL(string: "https://rickandmortyapi.com/api/episode")
        guard let urlOfLocation = url else {
            print(SystemErrors.incorectURL)
            return
        }
        URLSession.shared.dataTask(with: urlOfLocation) { [self] data, response, error in
            
            guard let data = data else{
                print(SystemErrors.nodata)
                return
            }
            guard error == nil else{
                print("ERROR: \(error)")
                return
            }
            guard let newEpisode = try? JSONDecoder().decode(EpisodeRM.self, from: data) else{ return }
            DispatchQueue.main.async {[weak self] in
                self?.allEpisodes.append(newEpisode)
            }
            
        }.resume()
    }

}

