//
//  UILabel_extension.swift
//  nanujang
//
//  Created by 박지수 on 27/08/2019.
//  Copyright © 2019 nanujang. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    var numberOfVisibleLines: Int {
        let maxSize = CGSize(width: 179, height: CGFloat(MAXFLOAT))
        let textHeight = sizeThatFits(maxSize).height
        let lineHeight = font.lineHeight
        return Int(ceil(textHeight / lineHeight))
    }
}
