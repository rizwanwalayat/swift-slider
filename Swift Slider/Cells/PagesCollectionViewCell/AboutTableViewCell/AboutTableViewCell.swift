//
//  PopularPropertiesTableViewCell.swift
//  Yahuda
//
//  Created by Faisal Shehzad on 5/28/21.
//

import UIKit

class AboutTableViewCell: UITableViewCell {
    
    //MARK: IBOutlets
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionValue: UILabel!
    @IBOutlet weak var certificateLabel: UILabel!
    @IBOutlet weak var labelStack: UIStackView!
    @IBOutlet weak var certificatesCollectionView: UICollectionView!
    @IBOutlet weak var certificateTopConstraint: NSLayoutConstraint!
    
    var certificates: [String] = []
//    var delegate: ImageViewer?
    
    //MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        certificatesCollectionView.delegate = self
        certificatesCollectionView.dataSource = self
        certificatesCollectionView.register(CertificateCollectionViewCell.self, forCellWithReuseIdentifier: "CertificateCollectionViewCell")
    }
    
//    func prepareData(_ data: ArtisanAttributes?) {
//
//        if let about = data?.about, !about.isEmpty {
//            descriptionValue.text = about
//            descriptionLabel.isHidden = false
//            descriptionValue.isHidden = false
//        } else {
//            descriptionLabel.isHidden = true
//            descriptionValue.isHidden = true
//            labelStack.isHidden = true
//            certificateTopConstraint.constant = 0.0
//        }
//
//        if let certificates = data?.certificates, !certificates.isEmpty {
//            self.certificateLabel.isHidden = false
//            self.certificates = certificates
//        } else {
//            self.certificateLabel.isHidden = true
//        }
//
//
//    }

    
    //MARK: Functions
    
//    func config(data: ArtisanAttributes?){
//        prepareData(data)
//        if let certificates = data?.certificates, !certificates.isEmpty {
//            self.certificateLabel.isHidden = false
//            self.certificates = certificates
//        } else {
//            self.certificateLabel.isHidden = true
//        }
//        if (certificateLabel.isHidden && descriptionLabel.isHidden) {
//            certificatesCollectionView.isHidden = true
//        } else {
//            certificatesCollectionView.isHidden = false
//        }
//    }

}

extension AboutTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return certificates.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CertificateCollectionViewCell", for: indexPath) as! CertificateCollectionViewCell
        cell.configureViewOnly(imgUrl: certificates[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        self.delegate?.previewSelectedImage(imagesArray: certificates, selectedIndex: indexPath.row)
       }
}

extension AboutTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 76
        let width = (collectionView.frame.width / 2) - 5
        return CGSize(width: width, height: height)
    }
}


