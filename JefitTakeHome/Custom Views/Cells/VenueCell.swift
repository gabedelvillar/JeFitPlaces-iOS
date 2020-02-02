//
//  VenueCell.swift
//  JefitTakeHome
//
//  Created by Gabriel Del VIllar De Santiago on 1/31/20.
//  Copyright © 2020 Gabriel Del VIllar De Santiago. All rights reserved.
//

import UIKit

class VenueCell: UICollectionViewCell {
    
    let nameLabel = JFTitleLabel(title: "Grill'em All", textAlignment: .left, numberOfLines: 2, fontSize: 20, textColor: .label)
    
    let locationImageView = JFImageView(image: UIImage(systemName: SFSymbols.location) ?? UIImage())
    
    let locationLabel = JFSecondaryTitleLabel(title: "17 North San Pedro Street", textAlignment: .left, numberOfLines: 2, fontSize: 14)
    let thumbnailImageView = JFImageView(image: #imageLiteral(resourceName: "losangeles"))
    
    let catgoryLabel = JFSecondaryTitleLabel(title: "Mexican Restaurant", textAlignment: .left, numberOfLines: 2, fontSize: 14)
    
    let bookmarkImageView = JFImageView(image: UIImage(systemName: SFSymbols.bookmark) ?? UIImage())
    
    static let cellReuseID = "VenueCell"
    
    // MARK: Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Fileprivate Methods
    
    fileprivate func setupViews() {
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
}
