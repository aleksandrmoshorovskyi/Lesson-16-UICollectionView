//
//  CollectionImageCell.swift
//  Lesson-16-UICollectionView
//
//  Created by Aleksandr Moroshovskyi on 12.04.2024.
//

import UIKit

class CollectionImageCell: UICollectionViewCell {
    
    //var pageControll: UIPageControl?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .random()
        
        /*
        let pageCtrl = UIPageControl(frame: CGRect(x: 140, y: 20, width: 360, height: 20))
        contentView.addSubview(pageCtrl)
        pageCtrl.tintColor = .white
        pageControll = pageCtrl
         */
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
