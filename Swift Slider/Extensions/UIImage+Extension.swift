//
//  UIImage+Extension.swift
//  Swift Slider
//
//  Created by Rizwan Walayat on 02/05/2023.
//

import UIKit

extension UIImage {
    static var defaultImage: UIImage {
        return UIImage(named: "ic_default_placeholder_image") ?? UIImage()
    }
    static var about: UIImage {
        return UIImage(named: "About") ?? defaultImage
    }
    static var reviews: UIImage {
        return UIImage(named: "Reviews") ?? defaultImage
    }
    static var send: UIImage {
        return UIImage(named: "SendIcon") ?? defaultImage
    }

}
