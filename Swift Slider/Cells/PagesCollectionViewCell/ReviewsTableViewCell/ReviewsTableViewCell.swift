//
//  PopularPropertiesTableViewCell.swift
//  Yahuda
//
//  Created by Faisal Shehzad on 5/28/21.
//

import UIKit
//import Cosmos

class ReviewsTableViewCell: UITableViewCell {
    
    //MARK: IBOutlets
    @IBOutlet weak var reviewerImage: UIImageView!
    @IBOutlet weak var outerReviewerImage: UIView!
//    @IBOutlet weak var reviewerRating: CosmosView!
    @IBOutlet weak var reviewerName: UILabel!
    @IBOutlet weak var dateTimeValue: UILabel!
    @IBOutlet weak var reviewDescription: UILabel!
    
    
    //MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
//        reviewerImage.applyshadowWithCorner(containerView: outerReviewerImage, cornerRadious: 10)
    }
    
    //MARK: Functions
    
//    func config(data: ArtisanReviewsDoc?){
//        reviewerImage.setImageURLElsePlaceHolder(url: data?.source?.adderInfo?.attributes?.profileImage ?? "", placeholder: UIImage.userPlaceholder)
//        reviewerName.text = "\(data?.source?.adderInfo?.firstName ?? "") \(data?.source?.adderInfo?.lastName ?? "")"
////        reviewerRating.rating = data?.source?.score ?? 0.0
//        dateTimeValue.text = data?.source?.createdAt?.getDateFromDateTime("dd-MM-yyyy")
//        reviewDescription.text = data?.source?.review?.comment
//    }
    
//    func configure(data: jobDetail) {
//        reviewerImage.setImageURLElsePlaceHolder(url: data.guest?.attributes?.profileImage ?? "", placeholder: UIImage.userPlaceholder)
////        reviewerRating.rating = data.reviews?.score ?? 0.0
//        reviewerName.text = "\(data.guest?.firstName ?? "") \(data.guest?.lastName ?? "")"
//        dateTimeValue.text = data.reviews?.createdAt?.getFormattedDateTime("dd-MM-yyyy")
//        reviewDescription.text = data.reviews?.review?.comment ?? ""
//  }
    
//    func setup(data: jobDoc) {
    //
    //        jobTitle.text = data.source?.title
        //        jobTitle.text! += "\(data)"
        
    //        addressLabel.text = data.source?.skill?.name
        //        jobImage.setImagesNotRefresh(url: data.source?.images?.first?.thumbnailImageForMobile ?? "")
    //        dateTimeValue.text = data.source?.createdAt?.getFormattedDateTime()
        //    }
    
    }


