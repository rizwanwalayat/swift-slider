//
//  EmptyListHeaderView.swift
//  yahuda-artisan-ios
//
//  Created by Faisal Shahzad on 21/07/2022.
//

import UIKit

class EmptyListHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var title:  UILabel!
    @IBOutlet weak var noteDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        config()
//        self.noteDescription.setLineHeight(lineHeight: 0.6)

    }
    
    func config() {
        picture.image = UIImage(named: "ic_artisan_about_empty")
        title.text = "Nothing to show!"
        noteDescription.text = "There's nothing that you were looking for"
    }

}
