//
//  NetworkManager.swift
//  JefitTakeHome
//
//  Created by Gabriel Del VIllar De Santiago on 1/28/20.
//  Copyright © 2020 Gabriel Del VIllar De Santiago. All rights reserved.
//

import UIKit



class NetworkManager {
    static let shared = NetworkManager()
    fileprivate let baseURL = "https://api.foursquare.com/v2/venues/"
    fileprivate let clientId = "ZIKD0E2HMWNWZEJ0QLYD5RCLPNBMSPQT2UP5N0WOE33GEUC1"
    fileprivate let clientSecret = "POZ5BTUK00W42DDOLYJZLD3XBRU53RMLZD1ZSPXGQNDMBMKY"
    fileprivate let version = "20170101"
    
    let venueImagesCache = NSCache<NSString, NSArray>()
    
    let imagesCache = NSCache<NSString, UIImage>()
    
    
    private init(){
        
    }
    
    func getVenues(for city: City, completed: @escaping (Result<SearchResult, JFError>) -> Void) {
        let endpoint = baseURL + "search?&client_id=\(clientId)&client_secret=\(clientSecret)&v=\(version)&ll=\(city.latitude),\(city.longitude)&limit=3"
        print(endpoint)
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidVenueRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let venues = try decoder.decode(SearchResult.self, from: data)
                completed(.success(venues))
            } catch {
                print(error)
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func getVenuePhotos(for venueID: String, completed: @escaping (Result<PhotoSearchResult, JFError>) -> Void){
        let endpoint = baseURL + "\(venueID)/photos?client_id=\(clientId)&client_secret=\(clientSecret)&v=\(version)&limit=3"
        
        print(endpoint)
               
               guard let url = URL(string: endpoint) else {
                completed(.failure(.invalidPhotoRequest))
                   return
               }
               
               let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                   if let error = error {
                       print(error)
                       completed(.failure(.unableToComplete))
                       return
                   }
                   
                   guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                       
                       completed(.failure(.unableToComplete))
                    print("Code was not 200")
                       return
                   }
                   
                   guard let data = data else {
                       completed(.failure(.invalidResponse))
                       return
                   }
                   
                   do{
                       let decoder = JSONDecoder()
                       let photos = try decoder.decode(PhotoSearchResult.self, from: data)
                       completed(.success(photos))
                   } catch {
                       print(error)
                       completed(.failure(.invalidData))
                   }
               }
               
               task.resume()
    }
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage) -> Void){
        let cacheKey = NSString(string: urlString)
        if let image = imagesCache.object(forKey: cacheKey){
            completed(image)
            
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self else { return }
            
            if error != nil { return }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {return}
            guard let data = data else {return}
            
            guard let image = UIImage(data: data) else {return}
            self.imagesCache.setObject(image, forKey: cacheKey)
            
            completed(image)
        }
        
        task.resume()
    }
    
   
}
