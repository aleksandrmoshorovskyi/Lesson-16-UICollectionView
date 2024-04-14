//
//  UIColor+Ext.swift
//  Lesson-16-UICollectionView
//
//  Created by Aleksandr Moroshovskyi on 12.04.2024.
//

import UIKit

extension UIColor {
    
    static func random() -> UIColor {
        
        let red: CGFloat = CGFloat(Int.random(in: 0...255)) / 255.0
        let green: CGFloat = CGFloat(Int.random(in: 0...255)) / 255.0
        let blue: CGFloat = CGFloat(Int.random(in: 0...255)) / 255.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
