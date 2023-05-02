//
//  CertificateCollectionViewCell.swift
//  yahuda-artisan-ios
//
//  Created by Faisal Shahzad on 14/06/2022.
//

import UIKit

class CertificateCollectionViewCell: UICollectionViewCell {
    
    //MARK: OUTLETS
//    @IBOutlet weak var parentView: DashedBorderView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var crossButton: UIButton!

    //MARK: PROPERTIES
    var didTapCross:(() -> ())?
    
    
    //MARK: LIFECYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: IBACTIONS
    @IBAction func didTapCrossBtn(_ sender: UIButton) {
        self.didTapCross?()
    }
    
//    //MARK: HELPERS
//    func configure(imgURL: String?, showCross: Bool = true) {
//        if let img = imgURL {
////            parentView.spacing = 0
//            imageView.image = UIImage(named: "")
//            imageView.setImages(url: img) { [weak self] in
//                self?.crossButton.isHidden = showCross ? false : true
//                self?.imageView.contentMode = .scaleAspectFill
//            }
//        } else {
//            parentView.spacing = 6
//            imageView.image = UIImage(named: "ic_plus_24x24")
//            crossButton.isHidden = true
//            imageView.contentMode = .center
//        }
//    }
    
    func configureViewOnly(imgUrl: String?){
        
        crossButton.isHidden = true
        
        if let img = imgUrl {
//            parentView.spacing = 0
            imageView.image = nil
//            imageView.setImages(url: img) {
//                self.imageView.contentMode = .scaleAspectFill
//            }
        }
    }

}
