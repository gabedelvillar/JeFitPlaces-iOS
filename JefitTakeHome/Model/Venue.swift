//
//  Venue.swift
//  JefitTakeHome
//
//  Created by Gabriel Del VIllar De Santiago on 1/28/20.
//  Copyright © 2020 Gabriel Del VIllar De Santiago. All rights reserved.
//

import Foundation

struct SearchResult: Codable {
    var response: Response?
}

struct Response: Codable {
    var venues: [Venue]?
}

struct Venue: Codable {
    let id: String
    let name: String
    let location: Location
    var categories: [Categories]?
    
}

struct Location: Codable{
    var address: String?
}

struct Categories: Codable {
    let pluralName: String
}
