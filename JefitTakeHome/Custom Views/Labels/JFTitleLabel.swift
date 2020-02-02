//
//  JFTitleLabel.swift
//  JefitTakeHome
//
//  Created by Gabriel Del VIllar De Santiago on 2/1/20.
//  Copyright © 2020 Gabriel Del VIllar De Santiago. All rights reserved.
//

import UIKit

class JFTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String, textAlignment: NSTextAlignment, numberOfLines: Int, fontSize: CGFloat, textColor: UIColor){
        super.init(frame: .zero)
        self.text = title
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        self.textColor = textColor
        
        configure()
    }
    
    fileprivate func configure(){
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.9
        self.lineBreakMode = .byTruncatingTail
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
