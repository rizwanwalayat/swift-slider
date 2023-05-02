//
//  PopularPropertiesTableViewCell.swift
//  Yahuda
//
//  Created by Faisal Shehzad on 5/28/21.
//

import UIKit


class JobsTableViewCell: UITableViewCell {
    
    //MARK: IBOutlets
    @IBOutlet weak var jobImage: UIImageView!
    @IBOutlet weak var jobTitle: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var dateTimeValue: UILabel!
    
    
    //MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: Functions
    
//    func config(data: ArtisanRecentProjectsDoc?){
//        
//        jobTitle.text = data?.source?.title
//        addressLabel.text = data?.source?.location?.address
//        jobImage.setImageURLElsePlaceHolder(url: data?.source?.jobRequest?.images?.first?.orignalImage ?? "", placeholder: UIImage.placeholderJob)
//        dateTimeValue.text = data?.source?.createdAt?.getDateFromDateTime("dd-MM-yyyy")
//        
//    }
    
}


