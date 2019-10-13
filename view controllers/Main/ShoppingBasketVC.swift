//
//  ShoppingBasketVC.swift
//  UFUF
//
//  Created by 박지수 on 01/10/2019.
//  Copyright © 2019 박지수. All rights reserved.
//

import UIKit

class ShoppingBasketVC: UIViewController {
    var itemNameLists: [String] = []
    var itemAmountLists: [String] = []
    var itemImageLists: [String] = []
    var itemCntLists: [String] = []
    var itemPriceLists: [String] = []
    
    @IBOutlet weak var itemCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemCollectionView.reloadData()
        itemCollectionView.delegate = self
        itemCollectionView.dataSource = self
    }

}

extension ShoppingBasketVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return itemNameLists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell2", for: indexPath) as! ItemCollectionViewCell2
        
        cell.itemName.text = self.itemNameLists[indexPath.item]
        cell.itemAmount.text = self.itemAmountLists[indexPath.item] + "g"
        cell.itemImg.image = UIImage(named: self.itemImageLists[indexPath.item])
        cell.itemCnt.text = self.itemCntLists[indexPath.item]
        cell.itemPrice.text = self.itemPriceLists[indexPath.item] + " / "
//        cell.stepper.addTarget(self, action: #selector(stepperAction(sender:)), for: .valueChanged)
//
        return cell
    }
}


// MARK: - UICollectionViewDelegate
extension ShoppingBasketVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let storyboard  = UIStoryboard(name: "Main", bundle: nil)
//
//        guard let vc = storyboard.instantiateViewController(withIdentifier: "SelectItemVC") as? SelectItemVC else { return }
//
//        self.navigationController?.show(vc, sender: nil)
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension ShoppingBasketVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = 333 // 수정할 것!
        let height: CGFloat = 70
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}




