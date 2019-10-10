//
//  SelectItemVC.swift
//  UFUF
//
//  Created by 박지수 on 01/10/2019.
//  Copyright © 2019 박지수. All rights reserved.
//

import UIKit

class SelectItemVC: UIViewController {
    
    var itemCells:[ItemCollectionViewCell] = []
    var itemLists: [Item] = []
    var selectedList: Int = 0
    
    var fruitNameLists: [String] = ["사과", "배", "참외", "밤 3개", "애플 수박", "바나나", "레몬", "감"]
    var fruitAmountLists: [String] = ["200g", "220g", "100g", "350g", "800g", "180g", "120g", "150g"]
    var fruitImageLists: [String] = ["apple.jpeg", "pear.jpeg", "yellowmelon.jpg", "bam.jpeg", "applemelon.jpg", "banana.jpg", "lemon.jpg", "gam.jpg"]
    var fruitCntLists: [String] = ["0", "0", "0", "0", "0", "0", "0", "0"]
    
    var veggieNameLists: [String] = ["파","양파","오이","당근","파프리카","감자","고구마","가지"]
    var veggieAmountLists: [String] = ["500g","100g","50g","450g","100g","200g","100g","400g"]
    var veggieImageLists: [String] = ["pa.jpeg", "onion.jpeg", "cucum.pjg", "carrot.jpg", "papri.jpeg", "potato.jpeg", "spotato.jpeg", "gaji.jpeg"]
    var veggieCntLists: [String] = ["0", "0", "0", "0", "0", "0", "0", "0"]
    
    var itemNameLists: [String] = []
    var itemAmountLists: [String] = []
    var itemImageLists: [String] = []
    var itemCntLists: [String] = []
    
    @IBOutlet weak var fruitBtn: CustomButton!
    @IBOutlet weak var veggieBtn: CustomButton!
    @IBOutlet weak var itemCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemNameLists = fruitNameLists
        itemAmountLists = fruitAmountLists
        itemImageLists = fruitImageLists
        itemCntLists = fruitCntLists
        selectedList = 0
        
        itemCollectionView.reloadData()
        itemCollectionView.delegate = self
        itemCollectionView.dataSource = self
        
//        self.navigationItem.title = "어푸어푸"
    }
    
    @IBAction func fruitBtnClick(_ sender: Any) {
        itemNameLists = fruitNameLists
        itemAmountLists = fruitAmountLists
        itemImageLists = fruitImageLists
        itemCntLists = fruitCntLists
        selectedList = 0
        itemCollectionView.reloadData()
    }
    
    @IBAction func veggieBtnClick(_ sender: Any) {
        itemNameLists = veggieNameLists
        itemAmountLists = veggieAmountLists
        itemImageLists = veggieImageLists
        itemCntLists = veggieCntLists
        selectedList = 1
        itemCollectionView.reloadData()
    }
    
    @IBAction func completeBtnClick(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ShoppingBasketVC") as! ShoppingBasketVC
        var i : Int = 0
        for (index, item) in itemCntLists.enumerated() {
            if(Int(item)! > 0) {
                print(index)
                viewController.itemNameLists.append(itemNameLists[index])
                viewController.itemAmountLists.append(itemAmountLists[index])
                viewController.itemImageLists.append(itemImageLists[index])
                viewController.itemCntLists.append(itemCntLists[index])
            }
        }
        navigationController?.show(viewController, sender: nil)
    }
}

extension SelectItemVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return itemNameLists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath) as! ItemCollectionViewCell
        
        cell.itemName.text = self.itemNameLists[indexPath.item]
        cell.itemAmount.text = self.itemAmountLists[indexPath.item]
        cell.itemImg.image = UIImage(named: self.itemImageLists[indexPath.item])
        cell.itemCnt.text = self.itemCntLists[indexPath.item]
        
        cell.stepper.tag = indexPath.row
        cell.stepper.addTarget(self, action: #selector(stepperAction(sender:)), for: .valueChanged)

        return cell
    }
    
    @objc func stepperAction(sender: UIStepper)  {
//        let stepperValue = Int(sender.value)
        itemCntLists[sender.tag] = String(Int(sender.value))
        print("Stepper \(itemNameLists[sender.tag]) clicked. Its value \(Int(sender.value))")
        
        if(selectedList == 0) {
            fruitCntLists = itemCntLists
        }
        else {
            veggieCntLists = itemCntLists
        }
        
        itemCollectionView.reloadData()
//        itemCntLists[sender.tag] = String(sender.value)
    }
}


// MARK: - UICollectionViewDelegate
extension SelectItemVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard  = UIStoryboard(name: "Main", bundle: nil)
        
        guard let vc = storyboard.instantiateViewController(withIdentifier: "SelectItemVC") as? SelectItemVC else { return }
        
        //vc.userID = self.concernInfoList?[indexPath.item].userInfo.userIdx
        //print(vc.userID)
        self.navigationController?.show(vc, sender: nil)
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension SelectItemVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = 333 // 수정할 것!
        let height: CGFloat = 150
        
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

extension UIApplication {
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController { if let selected = tab.selectedViewController { return topViewController(base: selected) } }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}

