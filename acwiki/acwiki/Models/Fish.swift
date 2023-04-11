//
//  Fish.swift
//  acwiki
//
//  Created by Abby on 27/3/23.
//

import Foundation

struct Fish: Identifiable, Codable, Comparable, ItemCatchable {
    static func == (lhs: Fish, rhs: Fish) -> Bool {
        return lhs.id == rhs.id
    }

    static func < (lhs: Fish, rhs: Fish) -> Bool {
        return lhs.id < rhs.id
    }
    
    let id: Int
    let fileName: String
    let name: Name
    let availability: Availability
    let shadow: String
    let price, priceCj: Int
    let catchPhrase, museumPhrase: String
    let imageURI, iconURI: String

    enum CodingKeys: String, CodingKey {
        case id
        case fileName = "file-name"
        case name, availability, shadow, price
        case priceCj = "price-cj"
        case catchPhrase = "catch-phrase"
        case museumPhrase = "museum-phrase"
        case imageURI = "image_uri"
        case iconURI = "icon_uri"
    }
}

// MARK: - Availability
struct Availability: Codable {
    let monthNorthern, monthSouthern, time: String
    let isAllDay, isAllYear: Bool
    let location, rarity: String
    let monthArrayNorthern, monthArraySouthern, timeArray: [Int]

    enum CodingKeys: String, CodingKey {
        case monthNorthern = "month-northern"
        case monthSouthern = "month-southern"
        case time, isAllDay, isAllYear, location, rarity
        case monthArrayNorthern = "month-array-northern"
        case monthArraySouthern = "month-array-southern"
        case timeArray = "time-array"
    }
}

// MARK: - Name
struct Name: Codable {
    let nameUSen, nameEUen, nameEUde, nameEUes: String
    let nameUSes, nameEUfr, nameUSfr, nameEUit: String
    let nameEUnl, nameCNzh, nameTWzh, nameJPja: String
    let nameKRko, nameEUru: String

    enum CodingKeys: String, CodingKey {
        case nameUSen = "name-USen"
        case nameEUen = "name-EUen"
        case nameEUde = "name-EUde"
        case nameEUes = "name-EUes"
        case nameUSes = "name-USes"
        case nameEUfr = "name-EUfr"
        case nameUSfr = "name-USfr"
        case nameEUit = "name-EUit"
        case nameEUnl = "name-EUnl"
        case nameCNzh = "name-CNzh"
        case nameTWzh = "name-TWzh"
        case nameJPja = "name-JPja"
        case nameKRko = "name-KRko"
        case nameEUru = "name-EUru"
    }
}
