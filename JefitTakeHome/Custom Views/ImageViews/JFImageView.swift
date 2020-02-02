//
//  JFImageView.swift
//  JefitTakeHome
//
//  Created by Gabriel Del VIllar De Santiago on 2/1/20.
//  Copyright © 2020 Gabriel Del VIllar De Santiago. All rights reserved.
//

import UIKit

class JFImageView: UIImageView {

    
    // MARK: Intializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    init(image: UIImage) {
        super.init(frame: .zero)
        self.image = image
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Fileprivate Methods
    
    fileprivate func configure(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
    }
    
}
