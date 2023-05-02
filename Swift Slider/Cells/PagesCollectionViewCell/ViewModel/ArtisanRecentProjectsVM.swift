//
//  JobsListingVM.swift
//  yahuda-artisan-ios
//
//  Created by Rizwan Walayat on 28/04/2022.
//

import Foundation

class ArtisanRecentProjectsVM: NSObject {
//    var data: ArtisanRecentProjectsModel?
    
    var artisanId: String
    var limit: Int = 10

    
    init(artisanId: String) {
        self.artisanId = artisanId
    }
    
    
//    func getRecentProjectsAPI(onComplete: @escaping (ArtisanRecentProjectsModel?, AnyObject?) -> Void){
//
//        let apiOperation = BaseAPIService()
//        let params = [
//            "offset": (data?.offset ?? 0 * limit).toString,
//            "limit": limit.toString
//        ] as [String : Any]
//        apiOperation.startFetchingOperation(url: .kArtisanRecentProjects,  requestType: .GET, appendUrl: self.artisanId, params: params, object: ArtisanRecentProjectsModel.self)
//        apiOperation.didFinishSuccessfullyCallback = { response in
//
//            guard let data = response as? ArtisanRecentProjectsModel else { return }
//            onComplete(data, nil)
//        }
//
//        apiOperation.didFinishWithErrorCallback = { error in
//            onComplete(nil, error)
//        }
//        NetworkOperationQueue.sharedInstance.addOperation(apiOperation)
//    }
  
}
