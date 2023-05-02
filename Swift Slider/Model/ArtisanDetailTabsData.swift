//
//  ArtisanTabsData.swift
//  yahuda-artisan-ios
//
//  Created by Rizwan Walayat on 24/06/2022.
//

import Foundation
import UIKit

struct ArtisanDetailTabsData {
    
    //MARK: Properties
    var isChecked: Bool?
    let tabName: String?
    let tabImage: UIImage?
    
    static func getData() -> [ArtisanDetailTabsData] {
        let data = [ ArtisanDetailTabsData(isChecked: true, tabName: Localization.TabBar.recentProjects, tabImage: UIImage.send),
                     ArtisanDetailTabsData(isChecked: false, tabName: Localization.TabBar.reviews, tabImage: UIImage.reviews),
                     ArtisanDetailTabsData(isChecked: false, tabName: Localization.TabBar.about, tabImage: UIImage.about)
        ]
        return data
    }
}
