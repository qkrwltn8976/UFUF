//
//  ItemCollectionViewCell2.swift
//  UFUF
//
//  Created by 박지수 on 08/10/2019.
//  Copyright © 2019 박지수. All rights reserved.
//

import UIKit

class ItemCollectionViewCell2: UICollectionViewCell {

    @IBOutlet weak var itemImg: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemCnt: UILabel!
    @IBOutlet weak var itemAmount: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
