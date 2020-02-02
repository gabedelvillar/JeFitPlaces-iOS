//
//  ErrorMessage.swift
//  JefitTakeHome
//
//  Created by Gabriel Del VIllar De Santiago on 1/31/20.
//  Copyright © 2020 Gabriel Del VIllar De Santiago. All rights reserved.
//

import Foundation

enum JFError: String, Error {
    case unableToComplete = "Unable to complete your request. Please check your interner connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "the data received from the server was invlaid. Please try again."
    case unableToBookmark = "There was an error bookmarking this venue. Please try again."
    case alreadyBookmarked = "You have already bookmarked this venue."
    case invalidVenueRequest = "The endpoint request to get venues is invalid."
    case invalidPhotoRequest = "The endpoint request to get photos is invalid"
}
