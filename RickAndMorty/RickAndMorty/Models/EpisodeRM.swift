//
//  EpisodeModelRM.swift
//  RickAndMorty
//
//  Created by Yehor Nesterov on 26.05.2023.
//

import Foundation

struct EpisodeRM: Identifiable, Decodable {
    let id: Int
    let name, airDate, episode: String
    let characters: [String]
    let url: String
    let created: String
}

//MARK: - EPISODE DATA RESPONSE
struct EpisodeResponse: Decodable{
    let episodes: [EpisodeRM]
    enum CodingKeys: String, CodingKey{
        case results
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.episodes = try container.decode([EpisodeRM].self, forKey: .results)
    }
}
