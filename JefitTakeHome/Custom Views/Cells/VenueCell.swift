//
//  VenueCell.swift
//  JefitTakeHome
//
//  Created by Gabriel Del VIllar De Santiago on 1/31/20.
//  Copyright © 2020 Gabriel Del VIllar De Santiago. All rights reserved.
//

import UIKit

class VenueCell: UICollectionViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Grill'em All"
        label.numberOfLines = 2
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    let locationImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: SFSymbols.location))
         imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "17 North San Pedro Street"
        label.numberOfLines = 2
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "losangeles"))
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
         imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let catgoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Mexican Restaurant"
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bookmarkImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: SFSymbols.bookmark))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    static let cellReuseID = "VenueCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(thumbnailImageView)
        addSubview(nameLabel)
        addSubview(locationLabel)
        addSubview(locationImageView)
        addSubview(catgoryLabel)
        addSubview(bookmarkImageView)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            thumbnailImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            thumbnailImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            thumbnailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            thumbnailImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            thumbnailImageView.heightAnchor.constraint(equalToConstant: 200),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 22),
          
            
            locationImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            locationImageView.heightAnchor.constraint(equalToConstant: 15),
            locationImageView.widthAnchor.constraint(equalToConstant: 15),
            
            
            
            locationLabel.topAnchor.constraint(equalTo: locationImageView.topAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: padding),
            locationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            locationLabel.bottomAnchor.constraint(equalTo: thumbnailImageView.topAnchor, constant: -padding / 2),
            
            
            
            catgoryLabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor),
            catgoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            catgoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            catgoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            
            bookmarkImageView.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: padding),
            bookmarkImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            bookmarkImageView.heightAnchor.constraint(equalToConstant: 30),
            bookmarkImageView.widthAnchor.constraint(equalToConstant: 30)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
