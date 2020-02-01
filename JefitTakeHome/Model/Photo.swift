//
//  Photo.swift
//  JefitTakeHome
//
//  Created by Gabriel Del VIllar De Santiago on 1/31/20.
//  Copyright © 2020 Gabriel Del VIllar De Santiago. All rights reserved.
//

import Foundation

struct PhotoSearchResult: Codable {
    var response: PhotoResponse?
}

struct PhotoResponse: Codable {
    var items: [Photo]?
}

struct Photo: Codable {
    let prefix: String
    let suffix: String
    let width: Int
    let height: Int
}
