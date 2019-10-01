//
//  UINavigationbar_Extension.swift
//  nanujang
//
//  Created by 박지수 on 27/08/2019.
//  Copyright © 2019 nanujang. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationBar {
    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 51)
    }
}
