//
//  UICollectionView+Extension.swift
//  Swift Slider
//
//  Created by Rizwan Walayat on 02/05/2023.
//

import Foundation
import UIKit

extension UICollectionView {
    func scrollToPage(page: Int, animated: Bool){
        self.setContentOffset(CGPoint(x: CGFloat(page) * self.bounds.size.width , y: 0), animated: animated)
    }
}
