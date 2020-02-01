//
//  PhotosVC.swift
//  JefitTakeHome
//
//  Created by Gabriel Del VIllar on 2/1/20.
//  Copyright © 2020 Gabriel Del VIllar De Santiago. All rights reserved.
//

import UIKit

class PhotosVC: UIViewController {
  
  enum Section {case main}
  
  let venueNameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
     label.font = .boldSystemFont(ofSize: 22)
    return label
  }()
  
  lazy var collectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.backgroundColor = .systemBackground
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    print("collection View:", PhotoCell.cellReuseID)
    collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.cellReuseID)
    
   
    
    return collectionView
  }()
  
  var cities: [City] = []
  
  
  init(venueName: String){
    venueNameLabel.text = venueName
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
     
      
      view.backgroundColor = .systemBackground
      view.addSubview(venueNameLabel)
      view.addSubview(collectionView)
      title = "Photos"
      navigationController?.navigationBar.prefersLargeTitles = true
       navigationController?.setNavigationBarHidden(false, animated: true)
      
      let sanJose = City(name: "San Jose, CA", latitude: 37.3354, longitude: -121.8930, image: #imageLiteral(resourceName: "sanJose"))
             let losAngeles = City(name: "Los Angeles, CA", latitude: 34.0522, longitude: -118.2436, image: #imageLiteral(resourceName: "hollywood"))
             let sanDiego = City(name: "San Diego, CA", latitude: 32.7157, longitude: -117.1610, image: #imageLiteral(resourceName: "sandiego"))
             let sacramento = City(name: "Sacramento, CA", latitude: 38.5905, longitude: -121.4899, image: #imageLiteral(resourceName: "sacramento"))
             let sanFrancisco = City(name: "San Francisco, CA", latitude: 37.7337, longitude: -122.4467, image: #imageLiteral(resourceName: "sanfrancisco"))
             
             
      cities = [sacramento, sanFrancisco, sanJose, losAngeles, sanDiego, sacramento, sanFrancisco, sanJose, losAngeles, sanDiego, sacramento, sanFrancisco, sanJose, losAngeles, sanDiego, sacramento, sanFrancisco, sanJose, losAngeles, sanDiego]
      //configureDataSource()
      //updateData(on: cities)
      
      navigationItem.rightBarButtonItem = .init(image: UIImage(systemName: SFSymbols.bookmark), style: .plain, target: self, action: #selector(bookmarkPressed))
      
      let padding: CGFloat = 14
      
      NSLayoutConstraint.activate([
        venueNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        venueNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
        venueNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        venueNameLabel.heightAnchor.constraint(equalToConstant: 30),
        
        
        collectionView.topAnchor.constraint(equalTo: venueNameLabel.bottomAnchor),
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
      ])
       
    }
  
  
  
  @objc fileprivate func bookmarkPressed(){
    print("Bookmarked pressed")
  }
  
  
  
    

  
}


extension PhotosVC: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.cellReuseID, for: indexPath) as! PhotoCell
      return cell
    
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return cities.count
  }
  
}
