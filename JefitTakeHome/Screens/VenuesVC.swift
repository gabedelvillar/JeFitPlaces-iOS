//
//  VenuesVC.swift
//  JefitTakeHome
//
//  Created by Gabriel Del VIllar De Santiago on 1/31/20.
//  Copyright © 2020 Gabriel Del VIllar De Santiago. All rights reserved.
//

import UIKit

class VenuesVC: UIViewController {
    
    var city: City
    var venues: [Venue] = []
    var bookmarkedVenues: [Venue] = []
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(VenueCell.self, forCellWithReuseIdentifier: VenueCell.cellReuseID)
        
        return collectionView
    }()
    
    
    // MARK: Initializers
    
    init(city: City){
        self.city = city
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecylce methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPurple
        title = city.name
        view.addSubview(collectionView)
        getVenues()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
        
        PersistenceManager.retrieveBookmarked {[weak self] (result) in
            
            guard let self = self else {return}
            switch result{
            case .success(let venues):
                self.bookmarkedVenues = venues
                self.collectionView.reloadData()
                print("VENUES: ", venues)
            case .failure:
                self.presentJFAlertOnMainThread(title: "Bookmarked Venues", message: "Could not retreive bookmarked venues", buttonTitle: "Ok")
            }
        }
    }
    
    // MARK: Fileprvate methods
    
    fileprivate func getVenues(){
        NetworkManager.shared.getVenues(for: city) {[weak self] result in
            guard let self = self else { return }
            
            switch result{
            case .success(let searchResult):
                guard let venues = searchResult.response?.venues else {return}
                
                self.venues = venues
                self.getPhotosOfVenues()
                self.downloadVenueThumbnail()
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
            case .failure(let error):
                self.presentJFAlertOnMainThread(title: "Bad Stuff Happened", message: error.rawValue, buttonTitle: "Ok")
                print("bad Stuff happended: ", error)
            }
        }
    }
    
    
    fileprivate func getPhotosOfVenues(){
        venues.forEach { (venue) in
            NetworkManager.shared.getVenuePhotos(for: venue.id) { (result) in
                switch result {
                case .success(let searchResult):
                    NetworkManager.shared.venueImagesCache.setObject(searchResult.response?.items as NSArray? ?? [], forKey: venue.id as NSString)
                case .failure(let error):
                    print("bad stuff happenened", error)
                }
            }
        }
    }
    
    
    fileprivate func downloadVenueThumbnail(){
        venues.forEach { (venue) in
            let cacheKey = NSString(string: venue.id)
            
            if let image = (NetworkManager.shared.venueImagesCache.object(forKey: cacheKey) as? [Photo])?.first {
                let imageUrl = "\(image.prefix)/300x500/\(image.suffix)"
                NetworkManager.shared.downloadImage(from: imageUrl) { (image) in
                }
            }
        }
    }
    
}

    // MARK: CollectionView methods

extension VenuesVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return venues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VenueCell.cellReuseID, for: indexPath) as! VenueCell
        
        
        var venue = venues[indexPath.item]
        
        if bookmarkedVenues.contains(venue){
            if let bookmarkedVenue = bookmarkedVenues.first(where: {$0.id == venue.id}){
                venue = bookmarkedVenue
            }
        }
        
        
        cell.nameLabel.text = venue.name
        cell.locationLabel.text = (venue.location.address != nil) ? venue.location.address : "Not Available"
        let hasBookmarked = venue.hasBookmarked ?? false
        let imageSystemName = hasBookmarked ? SFSymbols.bookmarkFilled : SFSymbols.bookmark
        cell.bookmarkImageView.image = UIImage(systemName: imageSystemName)
        
        cell.catgoryLabel.text = venue.categories?.first?.pluralName
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var venue = venues[indexPath.item]
        
        
        if bookmarkedVenues.contains(venue){
            if let bookmarkedVenue = bookmarkedVenues.first(where: {$0.id == venue.id}){
                venue = bookmarkedVenue
            }
        }
        
        
        let photosVC = PhotosVC(venue: venue)
        
        navigationController?.pushViewController(photosVC, animated: true)
        
    }
}
