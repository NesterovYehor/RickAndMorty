//
//  CharactersModelRM.swift
//  RickAndMorty
//
//  Created by Yehor Nesterov on 26.05.2023.
//

import Foundation

// MARK: - CARACTER
struct CharacterRM: Identifiable, Codable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin, location: CaracterLocation
    let image: String
    let episode: [String]
}

// MARK: - CHARACTER LOCATION
struct CaracterLocation: Codable {
    let name: String
    let url: String
}
//MARK: - CHARACTER DATA RESPONSE
struct CharacterResponse: Decodable{
    let characters: [CharacterRM]
    enum CodingKeys: String, CodingKey{
        case results
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.characters = try container.decode([CharacterRM].self, forKey: .results)
    }
}

