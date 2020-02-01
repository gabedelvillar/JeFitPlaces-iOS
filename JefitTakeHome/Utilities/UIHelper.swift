//
//  UIHelper.swift
//  JefitTakeHome
//
//  Created by Gabriel Del VIllar on 2/1/20.
//  Copyright © 2020 Gabriel Del VIllar De Santiago. All rights reserved.
//

import UIKit

struct UIHelper {
  
  static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
    let width = view.bounds.width
    let padding: CGFloat = 12
    let minimumLineSpacing: CGFloat = 10
    let availableWidth = width - (padding * 2) - (minimumLineSpacing * 2)
    let itemWidth = availableWidth / 2
    
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
    return flowLayout
  }
  
  
}
