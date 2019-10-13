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
    var totalAmount: Int = 0
    
    var fruitNameLists: [String] = ["사과", "배", "참외", "자몽", "애플수박", "바나나", "레몬", "귤"]
    var fruitAmountLists: [String] = ["200", "220", "100", "450", "800", "180", "120", "150"]
    var fruitPriceLists: [String] = ["700원","1000원","700원","550원","2500원","500원","300원","200원"]
    var fruitImageLists: [String] = ["apple.jpeg", "pear.jpeg", "yellowmelon.jpg", "grapefruit.jpeg", "applemelon.jpg", "banana.jpg", "lemon.jpg", "tanga.jpeg"]
    var fruitCntLists: [String] = ["0", "0", "0", "0", "0", "0", "0", "0"]
    
    var veggieNameLists: [String] = ["애호박","양파","오이","당근","감자","고구마"]
    var veggieAmountLists: [String] = ["375","100","50","450","200","100","400"]
    var veggiePriceLists: [String] = ["500원","350원","300원","450원","450원","450원"]
    var veggieImageLists: [String] = ["hobak.jpeg", "onion.jpeg", "cucum.pjg", "carrot.jpg", "potato.jpeg", "spotato.jpeg"]
    var veggieCntLists: [String] = ["0", "0", "0", "0", "0", "0", "0", "0"]
    
    var itemNameLists: [String] = []
    var itemAmountLists: [String] = []
    var itemImageLists: [String] = []
    var itemCntLists: [String] = []
    var itemPriceLists: [String] = []
    
    
    @IBOutlet weak var sumTotal: UILabel!
    @IBOutlet weak var fruitBtn: CustomButton!
    @IBOutlet weak var veggieBtn: CustomButton!
    @IBOutlet weak var itemCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemNameLists = fruitNameLists
        itemAmountLists = fruitAmountLists
        itemImageLists = fruitImageLists
        itemCntLists = fruitCntLists
        itemPriceLists = fruitPriceLists
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
        itemPriceLists = fruitPriceLists
        selectedList = 0
        itemCollectionView.reloadData()
    }
    
    @IBAction func veggieBtnClick(_ sender: Any) {
        itemNameLists = veggieNameLists
        itemAmountLists = veggieAmountLists
        itemImageLists = veggieImageLists
        itemCntLists = veggieCntLists
        itemPriceLists = veggiePriceLists
        selectedList = 1
        itemCollectionView.reloadData()
    }
    
    @IBAction func completeBtnClick(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ShoppingBasketVC") as! ShoppingBasketVC
        
        for (index, item) in fruitCntLists.enumerated() {
            if(Int(item)! > 0) {
                viewController.itemNameLists.append(fruitNameLists[index])
                viewController.itemAmountLists.append(fruitAmountLists[index])
                viewController.itemImageLists.append(fruitImageLists[index])
                viewController.itemCntLists.append(fruitCntLists[index])
                viewController.itemPriceLists.append(fruitPriceLists[index])
            }
        }
        for (index, item) in veggieCntLists.enumerated() {
            if(Int(item)! > 0) {
                viewController.itemNameLists.append(veggieNameLists[index])
                viewController.itemAmountLists.append(veggieAmountLists[index])
                viewController.itemImageLists.append(veggieImageLists[index])
                viewController.itemCntLists.append(veggieCntLists[index])
                viewController.itemPriceLists.append(veggiePriceLists[index])
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
        cell.itemAmount.text = self.itemAmountLists[indexPath.item] + "g"
        cell.itemImg.image = UIImage(named: self.itemImageLists[indexPath.item])
        cell.itemCnt.text = self.itemCntLists[indexPath.item]
        cell.itemPrice.text = self.itemPriceLists[indexPath.item]
        
        cell.stepper.tag = indexPath.row
        cell.stepper.addTarget(self, action: #selector(stepperAction(sender:)), for: .valueChanged)
        
        return cell
    }
    
    @objc func stepperAction(sender: UIStepper)  {

        itemCntLists[sender.tag] = String(Int(itemCntLists[sender.tag])!+1)
        print("Stepper \(itemNameLists[sender.tag]) clicked. Its value \(Int(sender.value))")
        
        if(selectedList == 0) {
            fruitCntLists = itemCntLists
        }
        else {
            veggieCntLists = itemCntLists
        }
        
        totalAmount += Int(itemAmountLists[sender.tag])!
        if(totalAmount > 2900) {
            let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:
                "ExceedAmountVC") as! ExceedAmountVC
            popOverVC.preferredContentSize.width = 323
            popOverVC.preferredContentSize.height = 277
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
            alert.setValue(popOverVC, forKey: "contentViewController")
            
            self.present(alert, animated: true)
        } else {
            sumTotal.text = String(totalAmount) + " / 2900g"
        }
        itemCollectionView.reloadData()
    }
}


// MARK: - UICollectionViewDelegate
extension SelectItemVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard  = UIStoryboard(name: "Main", bundle: nil)
        
        guard let vc = storyboard.instantiateViewController(withIdentifier: "SelectItemVC") as? SelectItemVC else { return }
        
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

