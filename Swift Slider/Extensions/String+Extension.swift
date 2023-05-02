//
//  String+Extension.swift
//  Swift Slider
//
//  Created by Rizwan Walayat on 02/05/2023.
//

import Foundation
import UIKit

extension String {
    func estimatedFrame(font: UIFont) -> CGRect {
        let size = CGSize(width: 200, height: 1000) // temporary size
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        return NSString(string: self).boundingRect(with: size,
                                                   options: options,
                                                   attributes: [NSAttributedString.Key.font: font],
                                                   context: nil)
    }
}
