//
//  ViewController.swift
//  Swift Slider
//
//  Created by Rizwan Walayat on 01/05/2023.
//


import UIKit

enum ArtisanDetailTab: CaseIterable {
    case recentProjects
    case reviews
    case about
    
    init?(id: Int){
        switch id {
        case 0: self = .recentProjects
        case 1: self = .reviews
        case 2: self = .about
        default: return nil
        }
    }
}

class SliderViewController: UIViewController {

//    var coordinator: ArtisansCoordinator?
//    var viewModel: ArtisanDetailsVM?
    
    @IBOutlet weak var artisanImage: UIImageView!
    @IBOutlet weak var artisanType: UILabel!
    @IBOutlet weak var artisanName: UILabel!
    @IBOutlet weak var artisanJoinedOn: UILabel!
    
    @IBOutlet weak var tabsCollectionView: UICollectionView!
    @IBOutlet weak var pagesCollectionView: UICollectionView!
    @IBOutlet weak var artisanDetailView: UIView!
    @IBOutlet weak var artisanDetailViewHeightConstraint: NSLayoutConstraint!
    
    var artisanDetailTabsData = ArtisanDetailTabsData.getData()
    var artisanDetailViewHeightVisible: CGFloat = 107
    var currentPageVisible = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
//        getArtisanDetailsData()
    }

    func configureViews(){
        tabsCollectionView.register(TabsCollectionViewCell.self, forCellWithReuseIdentifier: "TabsCollectionViewCell")
        pagesCollectionView.register(PagesCollectionViewCell.self, forCellWithReuseIdentifier: "PagesCollectionViewCell")
        pagesCollectionView.contentInsetAdjustmentBehavior = .never
    }
   
    @MainActor
    func updateTabsCells(index: Int) {
        print("updateTabsCells", index)
        for (i, _) in artisanDetailTabsData.enumerated() {
            self.artisanDetailTabsData[i].isChecked = false
        }
        
        self.artisanDetailTabsData[index].isChecked = true
        self.tabsCollectionView.reloadData()
    }
    
    func updatePagesCells(page: Int) {
        pagesCollectionView.scrollToPage(page: page, animated: true)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let collectionView = scrollView as? UICollectionView, collectionView == pagesCollectionView, pagesCollectionView.currentPage != currentPageVisible {
            currentPageVisible = pagesCollectionView.currentPage
            updateTabsCells(index: currentPageVisible)
        }
    }
    
    func toggleViewVisibility(hide: Bool, animated: Bool = true) {
        if hide && artisanDetailViewHeightConstraint.constant != 0 {
            artisanDetailViewHeightConstraint.constant = 0
            artisanDetailView.isHidden = true
            UIView.animate(withDuration: 0.2, animations: {
                  () -> Void in
                   self.view.layoutIfNeeded()
             }, completion: nil)
            
        } else if !hide && artisanDetailViewHeightConstraint.constant != artisanDetailViewHeightVisible {
            artisanDetailViewHeightConstraint.constant = artisanDetailViewHeightVisible
            artisanDetailView.isHidden = false
            UIView.animate(withDuration: 0.2, animations: {
                  () -> Void in
                   self.view.layoutIfNeeded()
             }, completion: nil)
        }
    }
    
    @MainActor
//    func populateArtisanDetailsData(){
//        self.artisanImage.setImageURLElsePlaceHolder(url: viewModel?.artisanDetailsData?.attributes?.profileImage, placeholder: UIImage.userPlaceholder)
//        self.artisanName.text = "\(viewModel?.artisanDetailsData?.firstName ?? "") \(viewModel?.artisanDetailsData?.lastName ?? "")"
//        self.artisanType.text = viewModel?.artisanDetailsData?.attributes?.userType?.capitalized ?? "Artisan"
//        self.artisanJoinedOn.text = viewModel?.artisanDetailsData?.createdAt?.getDateFromDateTime("MMM d, yyyy")
//    }
//
//    func getArtisanDetailsData(){
//        self.startActivity()
//        viewModel?.getArtisanDetailsAPI(onComplete: { responseObject, error in
//            self.stopActivity()
//            if error == nil && responseObject?.error == nil {
//                self.populateArtisanDetailsData()
//            } else {
//                self.alert(message: responseObject?.error ?? responseObject?.message ?? "Error Fetching Artisan Details")
//            }
//        })
//    }
//
    @IBAction func didTapHireButton(_ sender: UIButton) {
//        coordinator?.goToHireArtisan(id: viewModel?.artisanId ?? "")
    }
    
    @IBAction func viewDetailButtonPressed(_ sender: UIButton) {
//        coordinator?.goToArtisanStats(viewModel: viewModel!)
    }
}


extension SliderViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case tabsCollectionView:
            let tabsWidth = fontSize(index: indexPath.row).width + 24 + 5 + 15 + 15
            return CGSize(width: tabsWidth, height: 35)
        case pagesCollectionView:
            return CGSize(width: collectionView.frame.width - 10 , height: collectionView.frame.height)
        default:
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
    }
    
    func fontSize(index: Int) -> CGRect{
        var text:String?
        switch index {
        case 0:
            text = Localization.TabBar.recentProjects
        case 1:
            text = Localization.TabBar.reviews
        case 2:
            text = Localization.TabBar.about
        default:
            text = ""
        }
        return text!.estimatedFrame(font: .systemFont(ofSize: 13))
    }
    
}

extension SliderViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 3
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case tabsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabsCollectionViewCell", for: indexPath) as! TabsCollectionViewCell
//            cell.configure(artisanDetailTabsData[indexPath.row])
            return cell
        case pagesCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PagesCollectionViewCell", for: indexPath) as! PagesCollectionViewCell
            cell.delegate = self
//            cell.configure(selectedTab: ArtisanDetailTab(id: indexPath.row) ?? .recentProjects, viewModel: viewModel ?? nil)
            return cell
        default:
           return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case tabsCollectionView:
            updatePagesCells(page: indexPath.row)
        case pagesCollectionView:
            updateTabsCells(index: indexPath.row)
        default:
            print("Uknown Selected")
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
}

extension SliderViewController: ArtisanScrollDelegate {
    func scrolledUp() {
        toggleViewVisibility(hide: false)
    }
    
    func scrolledDown() {
        toggleViewVisibility(hide: true)
    }
    
}

