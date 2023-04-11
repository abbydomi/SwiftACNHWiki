//
//  Item.swift
//  acwiki
//
//  Created by Abby on 27/3/23.
//

import Foundation

protocol ItemCatchable: Identifiable{
    var id: Int { get }
    var name: Name { get }
    var availability: Availability { get }
    var imageURI: String { get }
    var iconURI: String { get }
    var catchPhrase: String { get }
}

extension Item: Identifiable {
    var id: Int {
        switch self {
        case .bug(let bug):
            return bug.id
        case .fish(let fish):
            return fish.id
        }
    }
}


enum Item {
    case fish(Fish)
    case bug(Bug)
}
