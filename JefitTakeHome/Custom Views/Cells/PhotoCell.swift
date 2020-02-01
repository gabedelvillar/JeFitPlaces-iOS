//
//  PhotoCell.swift
//  JefitTakeHome
//
//  Created by Gabriel Del VIllar on 2/1/20.
//  Copyright © 2020 Gabriel Del VIllar De Santiago. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
  
  static let cellReuseID = "JFPhotoCellID"
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .systemRed
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
