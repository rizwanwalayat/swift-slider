//
//  PropertyTypeCollectionCell.swift
//  Yahuda
//
//  Created by Abdul Kareem on 11/11/2021.
//

import UIKit

class TabsCollectionViewCell: UICollectionViewCell {

    //MARK: Outlets
    @IBOutlet weak var TabImage: UIImageView!
    @IBOutlet weak var TabLabel: UILabel!
    @IBOutlet weak var selectedTabView: UIView!
    
    //MARK: Properties
    override var isSelected: Bool{
      didSet{
        if isSelected {
            selectedState()
        } else {
            unselectedState()
        }
      }
    }

    func configure(_ data: ArtisanDetailTabsData){
        if data.isChecked ?? false {
            selectedState()
        } else {
            unselectedState()
        }
        TabLabel.text = data.tabName
        TabImage.image = data.tabImage
    }

    func selectedState() {
        self.selectedTabView.isHidden = false
//        self.selectedTabView.backgroundColor = .appColor
        self.TabLabel.textColor = UIColor.black
        self.TabImage.tintColor = .red
    }

    func unselectedState() {
        self.selectedTabView.isHidden = true
//        self.selectedTabView.backgroundColor =  .grey11
        self.TabLabel.textColor = .gray
        self.TabImage.tintColor = .gray
    }
}
