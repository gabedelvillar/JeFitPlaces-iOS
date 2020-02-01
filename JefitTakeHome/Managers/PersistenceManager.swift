//
//  PersistenceManager.swift
//  JefitTakeHome
//
//  Created by Gabriel Del VIllar De Santiago on 1/31/20.
//  Copyright © 2020 Gabriel Del VIllar De Santiago. All rights reserved.
//

import Foundation

enum PersitenceActionType{
    case add, remove
}

class PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let bookmarked = "bookmarked"
    }
    
    
    static func updateWith(venue: Venue, actionType: PersitenceActionType, completed: @escaping (JFError) -> Void){
        retrieveBookmarked { (result) in
            switch result {
            case .success(let bookmarked):
                var retreivedBookmarked = bookmarked
                
                switch actionType {
                case .add:
                    retreivedBookmarked.append(venue)
                case .remove:
                    retreivedBookmarked.removeAll(where: {$0.id == venue.id})
                }
                
                completed(save(bookmarked: retreivedBookmarked) ?? JFError.unableToBookmark)
                
            case .failure(let error):
                completed(error)
            }
            
            
        }
    }
    
    static func retrieveBookmarked(completed: @escaping (Result<[Venue], JFError>) -> Void){
        guard let bookmarkedData = defaults.object(forKey: Keys.bookmarked) as? Data else {
            completed(.success([]))
            return
        }
        
        do{
            let decoder = JSONDecoder()
            let bookmarked = try decoder.decode([Venue].self, from: bookmarkedData)
            completed(.success(bookmarked))
        } catch {
            completed(.failure(.unableToBookmark))
        }
    }
    
    static func save(bookmarked: [Venue]) -> JFError? {
        do{
            let encoder = JSONEncoder()
            let encodedBookmarked = try encoder.encode(bookmarked)
            defaults.set(encodedBookmarked, forKey: Keys.bookmarked)
            return nil
        } catch {
            return .unableToBookmark
        }
    }
}
