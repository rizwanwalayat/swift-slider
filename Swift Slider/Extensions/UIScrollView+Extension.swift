//
//  UIScrollView+Extension.swift
//  Swift Slider
//
//  Created by Rizwan Walayat on 02/05/2023.
//

import Foundation
import UIKit

extension UIScrollView {
    var currentPage:Int{
        return Int((self.contentOffset.x+(0.5*self.frame.size.width))/self.frame.width)
    }

}
