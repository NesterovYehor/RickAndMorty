//
//  LocationModelRM.swift
//  RickAndMorty
//
//  Created by Yehor Nesterov on 26.05.2023.
//

import Foundation

struct LocationRM: Identifiable, Decodable {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
    let url: String
    let created: String
}

//MARK: - LOCATION DATA RESPONSE
struct LocationResponse: Decodable{
    let location: [LocationRM]
    enum CodingKeys: String, CodingKey{
        case results
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.location = try container.decode([LocationRM].self, forKey: .results)
    }
}
