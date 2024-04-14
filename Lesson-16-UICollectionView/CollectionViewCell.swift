//
//  CollectionViewCell.swift
//  Lesson-16-UICollectionView
//
//  Created by Aleksandr Moroshovskyi on 12.04.2024.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.backgroundColor = .random()
    }
}
