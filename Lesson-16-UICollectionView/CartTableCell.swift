//
//  CartTableCell.swift
//  Lesson-16-UICollectionView
//
//  Created by Aleksandr Moroshovskyi on 12.04.2024.
//

import UIKit

class CartTableCell: UITableViewCell {
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var buyButton: UIButton!
    
    private var items: [String] = []
    private var index = 0
    
    var pageControll: UIPageControl?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.backgroundColor = .random()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(CollectionImageCell.self, forCellWithReuseIdentifier: "CollectionImageCell")
        
        let pageCtrl = UIPageControl(frame: CGRect(x: 140, y: 20, width: 360, height: 20))
        contentView.addSubview(pageCtrl)
        pageCtrl.tintColor = .white
        pageControll = pageCtrl
    }
    
    func setupPhotos(with items: [String]) {
        self.items = items
        collectionView.reloadData()
        
        pageControll?.numberOfPages = items.count
    }
    
    @IBAction func buyButtonAction(_ sender: Any) {
        index += 1
        if index > items.count - 1 {
            index = 0
        }
        
        pageControll?.currentPage = index
        
        collectionView.scrollToItem(
            at: IndexPath(row: index, section: 0),
            at: .centeredHorizontally,
            animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension CartTableCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionImageCell", for: indexPath) as? CollectionImageCell
        else {
            assertionFailure()
            return UICollectionViewCell()
        }
        
        cell.backgroundColor = .random()
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension CartTableCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        debugPrint("User did tap at row: \(indexPath.row)")
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        pageControll?.currentPage = indexPath.row
        index = indexPath.row
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CartTableCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return collectionView.bounds.size
        //return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height - 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return .zero
    }
}
