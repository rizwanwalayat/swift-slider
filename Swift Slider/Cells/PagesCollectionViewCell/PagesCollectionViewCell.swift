//
//  PropertyTypeCollectionCell.swift
//  Yahuda
//
//  Created by Abdul Kareem on 11/11/2021.
//

import UIKit

protocol ArtisanScrollDelegate {
    func scrolledUp()
    func scrolledDown()
}

class PagesCollectionViewCell: UICollectionViewCell {
    //MARK: Outlets
    @IBOutlet weak var stackViewWidth: NSLayoutConstraint!
    @IBOutlet weak var pagesTableView: UITableView!
    var pageType: ArtisanDetailTab?
    var delegate: ArtisanScrollDelegate?
    var lastContentOffset: CGFloat = 0
    var viewModel:Any? = nil //ArtisanDetailsVM?
    var isLoadingFirstTime = true
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pagesTableView.delegate = self
        pagesTableView.dataSource = self
        pagesTableView.register(JobsTableViewCell.self, forCellReuseIdentifier: "JobsTableViewCell")
        pagesTableView.register(ReviewsTableViewCell.self, forCellReuseIdentifier: "ReviewsTableViewCell")
        pagesTableView.register(AboutTableViewCell.self, forCellReuseIdentifier: "AboutTableViewCell")
        
        pagesTableView.register(EmptyListHeaderView.self, forHeaderFooterViewReuseIdentifier: "EmptyListHeaderView")
        pagesTableView.register(JobsTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: "JobsTableViewHeaderView")
        pagesTableView.register(ReviewsTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: "ReviewsTableViewHeaderView")
        
        stackViewWidth.constant = UIScreen.main.bounds.size.width - 40
        pagesTableView.estimatedRowHeight = 120
        pagesTableView.rowHeight = UITableView.automaticDimension
    }
    
    
//    func configure(selectedTab: ArtisanDetailTab, viewModel: ArtisanDetailsVM?){
//        self.pageType = selectedTab
//        self.viewModel = viewModel
//        switch selectedTab {
//        case .recentProjects:
//            getArtisanRecentProjectsData()
//        case .reviews:
//            getArtisanReviewsData()
//        case .about:
//            loadAboutData()
//        }
//
//    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        lastContentOffset = scrollView.contentOffset.y
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > lastContentOffset {             // Moved Up, Scrolled Down
            delegate?.scrolledDown()
        } else if scrollView.contentOffset.y < lastContentOffset {      // Moved Down, Scrolled Up
            delegate?.scrolledUp()
        }
    }
    
//    func getArtisanRecentProjectsData(){
//        viewModel?.getRecentProjectsAPI() { responseObject, error in
//            if error == nil && responseObject?.error == nil {
//                self.pagesTableView.reloadData()
//            } else {
//                //                self.alert(message: responseObject?.error ?? responseObject?.message ?? "Error Fetching Artisan Recent Projects")
//            }
//        }
//    }
    
//    func getArtisanReviewsData(){
//        viewModel?.getReviewsAPI() { responseObject, error in
//            if error == nil && responseObject?.error == nil {
//                self.pagesTableView.reloadData()
//            } else {
//                //                self.alert(message: responseObject?.error ?? responseObject?.message ?? "Error Fetching Artisan Recent Projects")
//            }
//        }
//    }
    
    func loadAboutData(){
        self.pagesTableView.reloadData()
    }
}


extension PagesCollectionViewCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch pageType {
        case .recentProjects:
            return 0
        case .reviews:
            return  0
        case .about:
            return 0
        case .none:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch pageType {
        case .recentProjects:
            let cell = tableView.dequeueReusableCell(withIdentifier: "JobsTableViewCell", for: indexPath) as! JobsTableViewCell
//            cell.config(data: viewModel?.recentProjectsData?.docs?[indexPath.row])
            return cell
        case .reviews:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewsTableViewCell", for: indexPath) as! ReviewsTableViewCell
//            cell.config(data: viewModel?.reviewsData?.docs?[indexPath.row])
            return cell
        case .about:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AboutTableViewCell", for: indexPath) as! AboutTableViewCell
//            if let artisanData = viewModel?.artisanDetailsData?.attributes {
//                cell.config(data: artisanData)
//            }
            return cell
        case .none:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if pageType == .recentProjects {
//            if (indexPath.row == (viewModel?.recentProjectsData?.docs?.count ?? 0) - 1 && indexPath.row > 0){
//                if let hasNextPage = viewModel?.recentProjectsData?.hasNextPage, hasNextPage == true {
//                    getArtisanRecentProjectsData()
//                }
//            }
//        }
//        else if pageType == .reviews {
//            if (indexPath.row == (viewModel?.reviewsData?.docs?.count ?? 0) - 1 && indexPath.row > 0){
//                if let hasNextPage = viewModel?.reviewsData?.hasNextPage, hasNextPage == true {
//                    getArtisanReviewsData()
//                }
//            }
//        } else {
//        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch pageType {
        case .recentProjects:
//            if ((viewModel?.recentProjectsData?.docs?.count ?? 0) <= 0) {
//                return tableView.size.height
//            } else {
                return 58
//            }
            
        case .reviews:
//            if ((viewModel?.reviewsData?.docs?.count ?? 0) <= 0) {
//                return tableView.size.height
//            } else {
                return 80
//            }
            
        case .about:
//            if let about = viewModel?.artisanDetailsData?.attributes?.about, about == "", let certificates = viewModel?.artisanDetailsData?.attributes?.certificates, certificates.isEmpty {
//                return tableView.size.height
//            } else {
                return 0
//            }
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch pageType {
        case .recentProjects:
            let headerView = tableView.dequeueReusableCell(withIdentifier: "EmptyListHeaderView") as! EmptyListHeaderView
            return headerView

//            if ((viewModel?.recentProjectsData?.docs?.count ?? 0) <= 0) {
//                headerView.configRecentProject()
//            } else {
//                let headerView = tableView.dequeueHeaderFooter(withType: JobsTableViewHeaderView.self) as! JobsTableViewHeaderView
//                return headerView
//            }
            
        case .reviews:
            let headerView = tableView.dequeueReusableCell(withIdentifier: "EmptyListHeaderView") as! EmptyListHeaderView
            return headerView
            
          
//            if ((viewModel?.reviewsData?.docs?.count ?? 0) <= 0) {
//                let headerView = tableView.dequeueHeaderFooter(withType: EmptyListHeaderView.self) as! EmptyListHeaderView
//                headerView.configRecentProject()
//                return headerView
//            } else {
//                let headerView = tableView.dequeueHeaderFooter(withType: ReviewsTableViewHeaderView.self) as! ReviewsTableViewHeaderView
//                headerView.config(data: viewModel?.artisanDetailsData?.stats)
//                return headerView
//            }
            
        case .about:
            let headerView = tableView.dequeueReusableCell(withIdentifier: "EmptyListHeaderView") as! EmptyListHeaderView
            return headerView
            
//            let headerView = tableView.dequeueHeaderFooter(withType: EmptyListHeaderView.self) as! EmptyListHeaderView
//            headerView.configRecentProject()
//            return headerView
            
        default:
            return nil
            
        }
        
    }
}
