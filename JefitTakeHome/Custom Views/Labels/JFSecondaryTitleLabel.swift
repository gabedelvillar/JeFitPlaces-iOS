//
//  JFSecondaryTitleLabel.swift
//  JefitTakeHome
//
//  Created by Gabriel Del VIllar De Santiago on 2/1/20.
//  Copyright © 2020 Gabriel Del VIllar De Santiago. All rights reserved.
//

import UIKit

class JFSecondaryTitleLabel: UILabel {
    
    // MARK: Initialziers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    init(title: String, textAlignment: NSTextAlignment, numberOfLines: Int, fontSize: CGFloat){
        super.init(frame: .zero)
        self.text = title
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Fileprivate Methods
    fileprivate func configure(){
        self.textColor = .secondaryLabel
        self.font = UIFont.preferredFont(forTextStyle: .body)
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.90
        self.lineBreakMode = .byTruncatingTail
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
