//
//  CharactersViewModelRM.swift
//  RickAndMorty
//
//  Created by Yehor Nesterov on 28.05.2023.
//

import Foundation

class CharactersViewModelRM: ObservableObject{
    @Published var allCharacters: [CharacterRM] = []
    
    //MARK: LIST OF SYSTEM ERRORS
    enum SystemErrors{
        case incorectURL
        case nodata
    }
    init() {
        getCharactersAPI()
    }
    func getCharactersAPI() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else{print(SystemErrors.incorectURL); return}
            downloadCharactersAPI(fromURL: url) { returnedData in
                if let data = returnedData{
                    guard let newCharacter = try? JSONDecoder().decode(CharacterResponse.self, from: data) else{return}
                    DispatchQueue.main.async {[weak self] in
                        self?.allCharacters = newCharacter.characters
                    }
                }
                else{
                    print(SystemErrors.nodata)
                }
            }
    }
    func downloadCharactersAPI(fromURL url: URL, complishenHandler: @escaping (_ data: Data?) -> ()){
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

