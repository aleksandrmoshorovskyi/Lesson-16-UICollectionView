//
//  CartViewController.swift
//  Lesson-16-UICollectionView
//
//  Created by Aleksandr Moroshovskyi on 12.04.2024.
//

import UIKit

class DataSource {
    
}

class Section {
    
}

class Row {
    
}

class CartItem {
    
    var titleText: String = ""
    var photos: [String] = []
    
    init(titleText: String) {
        self.titleText = titleText
        
        let rnd = Int.random(in: 1...10)
        for _ in 0..<rnd {
            photos.append("nonameItem")
        }
    }
}

class CartViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cart: [CartItem] = [
        CartItem(titleText: "Milk"),
        CartItem(titleText: "Camera"),
        CartItem(titleText: "Tomato")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "CartTableCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CartTableCell")
    }
}

// MARK: - UITableViewDataSource
extension CartViewController: UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableCell", for: indexPath) as? CartTableCell
        else {
            assertionFailure()
            return UITableViewCell()
        }
        
        cell.titleLable.text = cart[indexPath.row].titleText
        cell.setupPhotos(with: cart[indexPath.row].photos)
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension CartViewController: UITableViewDelegate {
    
}
