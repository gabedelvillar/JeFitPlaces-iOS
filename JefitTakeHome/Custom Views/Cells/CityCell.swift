//
//  CityCell.swift
//  JefitTakeHome
//
//  Created by Gabriel Del VIllar De Santiago on 1/31/20.
//  Copyright © 2020 Gabriel Del VIllar De Santiago. All rights reserved.
//

import UIKit


class CityCell: UICollectionViewCell {
    
    static let cellReuseID = "CityCell"
    
    let titleLabel: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Los Angeles, CA"
        return label
    }()
    
    let backgrounImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.image = #imageLiteral(resourceName: "losangeles")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        
        self.backgroundView = UIView()
        self.backgroundView?.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(self.backgroundView!)
        
        
        NSLayoutConstraint.activate([
            (self.backgroundView?.leadingAnchor.constraint(equalTo: contentView.leadingAnchor))!,
            (self.backgroundView?.trailingAnchor.constraint(equalTo: contentView.trailingAnchor))!,
            (self.backgroundView?.topAnchor.constraint(equalTo: contentView.topAnchor))!,
            (self.backgroundView?.bottomAnchor.constraint(equalTo: contentView.bottomAnchor))!
        ])
       
        self.backgroundView?.backgroundColor = .systemBackground
        self.backgroundView?.layer.cornerRadius = 16
        
        self.backgroundView?.layer.shadowOpacity = 0.1
        self.backgroundView?.layer.shadowRadius = 10
        self.backgroundView?.layer.shadowOffset = .init(width: 0, height: 10)
        self.backgroundView?.layer.shouldRasterize = true
        
        backgroundColor = .systemBackground
        layer.cornerRadius = 16
        
        addSubview(backgrounImageView)
        
        addSubview(titleLabel)
        titleLabel.textColor = .systemBackground
        titleLabel.font = .systemFont(ofSize: 32, weight: .bold)
        
        clipsToBounds = true
        
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
