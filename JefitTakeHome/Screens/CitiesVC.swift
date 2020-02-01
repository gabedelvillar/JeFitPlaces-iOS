//
//  ViewController.swift
//  JefitTakeHome
//
//  Created by Gabriel Del VIllar De Santiago on 1/28/20.
//  Copyright © 2020 Gabriel Del VIllar De Santiago. All rights reserved.
//

import UIKit

class CitiesVC: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(CityCell.self, forCellWithReuseIdentifier: CityCell.cellReuseID)
        
        return collectionView
    }()
    
    var cities: [City] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        
        let sanJose = City(name: "San Jose, CA", latitude: 37.3354, longitude: -121.8930, image: #imageLiteral(resourceName: "sanJose"))
        let losAngeles = City(name: "Los Angeles, CA", latitude: 34.0522, longitude: -118.2436, image: #imageLiteral(resourceName: "hollywood"))
        let sanDiego = City(name: "San Diego, CA", latitude: 32.7157, longitude: -117.1610, image: #imageLiteral(resourceName: "sandiego"))
        let sacramento = City(name: "Sacramento, CA", latitude: 38.5905, longitude: -121.4899, image: #imageLiteral(resourceName: "sacramento"))
        let sanFrancisco = City(name: "San Francisco, CA", latitude: 37.7337, longitude: -122.4467, image: #imageLiteral(resourceName: "sanfrancisco"))
        
        
        cities = [sacramento, sanFrancisco, sanJose, losAngeles, sanDiego]
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }


}

extension CitiesVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityCell.cellReuseID, for: indexPath) as! CityCell
        let city = cities[indexPath.item]
        cell.backgrounImageView.image = city.image
        cell.titleLabel.text = city.name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 64, height: 500)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let venuesVC = VenuesVC(city: cities[indexPath.item])
        
        navigationController?.pushViewController(venuesVC, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 32, left: 0, bottom: 32, right: 0)
    }
}

