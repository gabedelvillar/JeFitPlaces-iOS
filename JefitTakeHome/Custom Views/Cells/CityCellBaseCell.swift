//
//  CityCellBaseCell.swift
//  JefitTakeHome
//
//  Created by Gabriel Del VIllar De Santiago on 2/1/20.
//  Copyright © 2020 Gabriel Del VIllar De Santiago. All rights reserved.
//

import UIKit

class CityCellBaseCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
