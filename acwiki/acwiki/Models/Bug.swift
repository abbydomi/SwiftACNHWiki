//
//  Bug.swift
//  acwiki
//
//  Created by Abby on 27/3/23.
//

import Foundation

struct Bug: Identifiable, Codable, Comparable, ItemCatchable  {
    
    static func == (lhs: Bug, rhs: Bug) -> Bool {
        return lhs.id == rhs.id
    }

    static func < (lhs: Bug, rhs: Bug) -> Bool {
        return lhs.id < rhs.id
    }
    
    let id: Int
    let fileName: String
    let name: Name
    let availability: Availability
    let price, priceFlick: Int
    let catchPhrase, museumPhrase: String
    let imageURI, iconURI: String

    enum CodingKeys: String, CodingKey {
        case id
        case fileName = "file-name"
        case name, availability, price
        case priceFlick = "price-flick"
        case catchPhrase = "catch-phrase"
        case museumPhrase = "museum-phrase"
        case imageURI = "image_uri"
        case iconURI = "icon_uri"
    }
}
