//
//  ViewListingModel.swift
//  App
//
//  Created by RadicalStart on 21/04/22.
//  Copyright © 2022 RADICAL START. All rights reserved.
//

import Foundation
import Apollo
import SKPhotoBrowser

class viewListingModel{
    
    var listID = 0
    var currencyvalue_from_API_base = ""
    var apollo_headerClient: ApolloClient!
    var viewListingArray : ViewListingDetailsQuery.Data.ViewListing.Results?
    var reiewListingArray = [UserReviewsQuery.Data.UserReviews.Result]()
    var getreviewArray = [GetReviewsListQuery.Data.GetReviews.Result]()
    var similarlistingArray = [GetSimilarListingQuery.Data.GetSimilarListing.Result]()
    var propertyReviewArray = [GetPropertyReviewsQuery.Data.GetPropertyReviews.Result]()
    var getbillingArray : GetBillingCalculationQuery.Data.GetBillingCalculation.Result?
    var propertyReviewsCount = 0
    var images = [SKPhotoProtocol]()
    
    public var selectedStartDate: Date?
    public var selectedEndDate: Date?
    
    func createLocalPhotos() -> [SKPhotoProtocol] {
        return (0..<(viewListingArray?.listingPhotos?.count ?? 0)).map { (i: Int) -> SKPhotoProtocol in
            let photo = SKPhoto.photoWithImageURL("\(IMAGE_LISTING_MEDIUM)\(viewListingArray?.listingPhotos?[i]?.name ?? "")")
            
            return photo
        }
    }
    
    func setupTestData() {
        images = createLocalPhotos()
    }
    
    func viewDetailAPICall(listid:Int, completion: @escaping (GraphQLResult<ViewListingDetailsQuery.Data>?)->())
    {
        if Utility.shared.isConnectedToNetwork(){
            var viewListQuery = ViewListingDetailsQuery(listId:listid, preview: .none)
            if(Utility.shared.unpublish_preview_check)
            {
                viewListQuery = ViewListingDetailsQuery(listId: listid, preview: true)
            }
            else
            {
                viewListQuery = ViewListingDetailsQuery(listId:listid, preview: false)
            }
            
            Network.shared.apollo_headerClient.fetch(query: viewListQuery,cachePolicy:.fetchIgnoringCacheData){ response in
                switch response {
                case .success(let result):
                    completion(result)
                case .failure(let error):
                    completion(nil)
                }
            }
        }else{
            completion(nil)
        }
    }
    
    func reviewcountAPICall(profileid:Int, completion: @escaping (Bool)->Void)
    {
        let reviewListquery = UserReviewsQuery(ownerType: "others", currentPage: 1, profileId: .some(profileid))
        Network.shared.apollo_headerClient.fetch(query: reviewListquery){ response in
            switch response {
            case .success(let result):
                guard (result.data?.userReviews?.results) != nil else{
                    return
                }
                self.reiewListingArray = (result.data?.userReviews?.results)! as! [UserReviewsQuery.Data.UserReviews.Result]
            case .failure(_): break
            }
        }
    }
    
    func getreviewAPICall(listId:Int,hostId:String, completion: @escaping (Bool)->Void){
        let getreviewquery = GetReviewsListQuery(listId: .some(listId), currentPage: 1, hostId: hostId)
        Network.shared.apollo_headerClient.fetch(query: getreviewquery){ response in
            switch response {
            case .success(let result):
                if let data = result.data?.getReviews?.status,data == 200 {
                    self.getreviewArray = (result.data?.getReviews?.results!)! as! [GetReviewsListQuery.Data.GetReviews.Result]
                    if(self.getreviewArray.count > 0){
                        Utility.shared.convertTimeStampToString(timestamp:self.getreviewArray[0].createdAt ?? "",toFormat: "MMMM yyyy")
                    }
                }
            case .failure(_): break
            }
        }
    }
    
    func similarListingAPICall(lat:Double,lng:Double,lisId:Int,completion: @escaping (Bool)->Void)
    {
        let similarlistingquery = GetSimilarListingQuery(lat: .some(lat), lng: .some(lng), listId: .some(lisId))
        Network.shared.apollo_headerClient.fetch(query: similarlistingquery,cachePolicy:.fetchIgnoringCacheData){ response in
            switch response {
            case .success(let result):
            guard (result.data?.getSimilarListing?.results) != nil else{
                completion(false)
                return
            }
            self.similarlistingArray = ((result.data?.getSimilarListing?.results)!) as! [GetSimilarListingQuery.Data.GetSimilarListing.Result]
            completion(true)
            case .failure(let error):
                completion(false)
            }
        }
    }
    
    func getPropertyReviewsAPICall(lisId:Int, completion: @escaping (Bool)->Void){
        let propertyReviewsQuery = GetPropertyReviewsQuery(currentPage: 1, listId: listID)
        Network.shared.apollo_headerClient.fetch(query: propertyReviewsQuery,cachePolicy:.fetchIgnoringCacheData){ response in
            switch response {
            case .success(let result):
                guard (result.data?.getPropertyReviews?.results) != nil else{
                    completion(false)
                    return
                }
                self.propertyReviewsCount = result.data?.getPropertyReviews?.count ?? 0
                self.propertyReviewArray = ((result.data?.getPropertyReviews?.results)!) as! [GetPropertyReviewsQuery.Data.GetPropertyReviews.Result]
                completion(true)
            case .failure(let error):
                completion(false)
            }
        }
    }
    
    func billingListAPICall(startDate:String,endDate:String, completion: @escaping (String)->Void)
    {
        var currency = String()
        if(Utility.shared.getPreferredCurrency() != nil &&  Utility.shared.getPreferredCurrency() != "")
        {
            currency = Utility.shared.getPreferredCurrency() != nil ? Utility.shared.getPreferredCurrency()! : currencyvalue_from_API_base
        }
        else{
            currency = currencyvalue_from_API_base
        }
        
        let billingListquery = GetBillingCalculationQuery(listId:listID, startDate: startDate, endDate: endDate, guests: Utility.shared.guestCountToBeSend, convertCurrency:currency)
        Network.shared.apollo_headerClient.fetch(query: billingListquery){ response in
            switch response {
            case .success(let result):
                guard (result.data?.getBillingCalculation?.result) != nil else{
                    if(result.data?.getBillingCalculation?.errorMessage != nil)
                    {
                        completion((result.data?.getBillingCalculation?.errorMessage ?? ""))
                    }
                    return
                }
                self.getbillingArray = (result.data?.getBillingCalculation?.result)!
                Utility.shared.guestCountToBeSend = self.getbillingArray?.guests ?? Utility.shared.guestCountToBeSend
                completion("")
            case .failure(let error):
                completion(error.localizedDescription)
            }
        }
        
    }
    
}
