//
//  CityCell.swift
//  JefitTakeHome
//
//  Created by Gabriel Del VIllar De Santiago on 1/31/20.
//  Copyright © 2020 Gabriel Del VIllar De Santiago. All rights reserved.
//

import UIKit


class CityCell: CityCellBaseCell {
    
    static let cellReuseID = "CityCell"
    
    let titleLabel = JFTitleLabel(title: "Los Angeles, CA", textAlignment: .left, numberOfLines: 1, fontSize: 32, textColor: .white)
    
    let backgrounImageView = JFImageView(image: #imageLiteral(resourceName: "losangeles"))
    
    // MARK: Initiazlizers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Fileprivate methods
    
    fileprivate func setupViews() {
        backgroundColor = .systemBackground
        layer.cornerRadius = 16
        clipsToBounds = true
        
        backgrounImageView.clipsToBounds = true
        
        addSubview(backgrounImageView)
        addSubview(titleLabel)
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            backgrounImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgrounImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgrounImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgrounImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    
    
    
}
