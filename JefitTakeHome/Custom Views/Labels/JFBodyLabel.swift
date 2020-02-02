//
//  JFBodyLabel.swift
//  JefitTakeHome
//
//  Created by Gabriel Del VIllar De Santiago on 2/1/20.
//  Copyright © 2020 Gabriel Del VIllar De Santiago. All rights reserved.
//

import UIKit

class JFBodyLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    init(title: String, textAlignment: NSTextAlignment, numberOfLines: Int){
        super.init(frame: .zero)
        self.text = title
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines

        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func configure(){
        self.textColor = .secondaryLabel
        self.font = UIFont.preferredFont(forTextStyle: .body)
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.75
        self.lineBreakMode = .byWordWrapping
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
