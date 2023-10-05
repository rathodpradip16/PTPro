//
//  AffiliateSearchLinkVC.swift
//  App
//
//  Created by Phycom Mac Pro on 02/10/23.
//  Copyright © 2023 RADICAL START. All rights reserved.
//

import UIKit
import GooglePlaces

class AffiliateSearchLinkVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{

    var PageIndex : Int = 1
    var arrLinkSearchList = [PTProAPI.AffiliateSearchListingQuery.Data.AffiliateSearchListing.Result]()
    
    @IBOutlet var cvLinkSearch: UICollectionView!
    var selectedFilter:FilterType = .latest

    //MARK: - VIEW LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        affiliateSearchLinkList(address: "", filter: "")
        // Do any additional setup after loading the view.
        
        self.cvLinkSearch.delegate = self
        self.cvLinkSearch.dataSource = self
        
        let layoutMostViewed = UICollectionViewFlowLayout()
        layoutMostViewed.scrollDirection = .vertical
        layoutMostViewed.minimumLineSpacing = 10
        layoutMostViewed.minimumInteritemSpacing = 0
        
        self.cvLinkSearch.collectionViewLayout = layoutMostViewed

        cvLinkSearch?.prepareSkeleton(completion: { done in
                    self.view.showAnimatedSkeleton()
                })
        cvLinkSearch?.isSkeletonable = true

        
        cvLinkSearch?.prepareSkeleton(completion: { [self] done in
            self.cvLinkSearch?.isSkeletonable = true
            self.cvLinkSearch.showAnimatedGradientSkeleton()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.cvLinkSearch.hideSkeleton()
        self.cvLinkSearch.isSkeletonable = false
    }
    
    //MARK: - CUSTOM METHOD
    func selectFilterType(){
        let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        
        let latest = UIAlertAction(title: "Latest", style: .default) { action in
            
        }
        
        let lowToHight = UIAlertAction(title: "Price(Low to high)", style: .default) { action in
            
        }
        
        let hightToLow = UIAlertAction(title: "Price(High to low)", style: .default) { action in
            
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive)

        alert.addAction(latest)
        alert.addAction(lowToHight)
        alert.addAction(hightToLow)
        alert.addAction(cancel)
        
        self.present(alert, animated: true)
    }
    
    //MARK: - Actions
    @IBAction func onFilter(_ sender: UIButton) {
        
    }

    @IBAction func onClickPlaceSelection(_ sender: UIButton) {
        let autocompleteController = GMSAutocompleteViewController()
          autocompleteController.delegate = self

          // Specify the place data types to return.
        let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt64(UInt(GMSPlaceField.name.rawValue) |
                                                                   UInt(GMSPlaceField.placeID.rawValue)))
          autocompleteController.placeFields = fields

          // Specify a filter.
          let filter = GMSAutocompleteFilter()
          filter.types = ["address"]
          autocompleteController.autocompleteFilter = filter

          // Display the autocomplete view controller.
          present(autocompleteController, animated: true, completion: nil)
    }
    
    //MARK: - UICollectionView delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrLinkSearchList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AffiliateSearchLinkCVC", for: indexPath) as! AffiliateSearchLinkCVC
        cell.lblTitle.text = arrLinkSearchList[indexPath.row].title
        cell.lblCity.text = arrLinkSearchList[indexPath.row].city
        cell.lblDescription.text = arrLinkSearchList[indexPath.row].description
        cell.lblPrice.text =  arrLinkSearchList[indexPath.row].description

        if let imgList = arrLinkSearchList[indexPath.row].listPhotos,imgList.count > 0{
            cell.img.sd_setImage(with: URL(string: "\(IMAGE_LISTING_MEDIUM)\(imgList[0]!.name ?? "")"), placeholderImage: #imageLiteral(resourceName: "placeholderimg"))
        }else{
            cell.img.sd_setImage(with: URL(string: "\(IMAGE_LISTING_MEDIUM)"), placeholderImage: #imageLiteral(resourceName: "placeholderimg"))
        }

        if(Utility.shared.getPreferredCurrency() != nil &&  Utility.shared.getPreferredCurrency() != "")
        {
            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!)
            let from_currency = self.arrLinkSearchList[indexPath.row].listingData?.currency
            let currency_amount = self.arrLinkSearchList[indexPath.row].listingData?.basePrice != nil ? self.arrLinkSearchList[indexPath.row].listingData?.basePrice : 0
            let price_value = Utility.shared.getCurrencyRate(basecurrency: Utility.shared.currencyvalue_from_API_base , fromCurrency:from_currency!, toCurrency:Utility.shared.getPreferredCurrency()!, CurrencyRate:Utility.shared.currency_Dict, amount:currency_amount!)
            let restricted_price =  Double(String(format: "%.2f",price_value))
            cell.lblPrice.text =  "\(currencysymbol!)\(restricted_price!.clean)"
        }else{
            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode: self.arrLinkSearchList[indexPath.row].listingData?.currency ?? "")
            let from_currency = self.arrLinkSearchList[indexPath.row].listingData?.currency
            let currency_amount = self.arrLinkSearchList[indexPath.row].listingData?.basePrice != nil ? self.arrLinkSearchList[indexPath.row].listingData?.basePrice : 0
            let price_value = Utility.shared.getCurrencyRate(basecurrency:self.arrLinkSearchList[indexPath.row].listingData?.currency ?? "", fromCurrency:from_currency!, toCurrency:self.arrLinkSearchList[indexPath.row].listingData?.currency ?? "", CurrencyRate:Utility.shared.currency_Dict, amount:currency_amount!)
            let restricted_price =  Double(String(format: "%.2f",price_value))
            cell.lblPrice.text = "\(currencysymbol!)\(restricted_price!.clean)"
        }
        return cell
    }
    
    //MARK: - API CALL
    func affiliateSearchLinkList(address:String, filter:String){
        let affiliateSearchListingQuery = PTProAPI.AffiliateSearchListingQuery(userId: .some(Utility.shared.ProfileAPIArray?.userId ?? ""), address: .some(address), orderBy: .some((filter != "") ? filter : "LATEST"))
        Network.shared.apollo_headerClient.fetch(query: affiliateSearchListingQuery, cachePolicy: .fetchIgnoringCacheData) { response in
            switch response{
            case .success(let result):
                if let data = result.data?.affiliateSearchListing?.status,data == 200 {
                    if let list =  result.data?.affiliateSearchListing, let results = list.results{
                        self.arrLinkSearchList = results as! [PTProAPI.AffiliateSearchListingQuery.Data.AffiliateSearchListing.Result]
                    }else{
                        self.arrLinkSearchList.removeAll()
                    }
                    self.cvLinkSearch.reloadData()
                } else {
                    self.view.makeToast(result.data?.affiliateSearchListing?.errorMessage)
                }
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
                break
            }
        }
    }
}

extension AffiliateSearchLinkVC: GMSAutocompleteViewControllerDelegate {

  // Handle the user's selection.
  func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
      affiliateSearchLinkList(address: place.name ?? "", filter: selectedFilter.rawValue)
      dismiss(animated: true, completion: nil)
  }

  func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
    // TODO: handle the error.
    print("Error: ", error.localizedDescription)
  }

  // User canceled the operation.
  func wasCancelled(_ viewController: GMSAutocompleteViewController) {
    dismiss(animated: true, completion: nil)
  }

  // Turn the network activity indicator on and off again.
  func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
  }

  func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
    UIApplication.shared.isNetworkActivityIndicatorVisible = false
  }

}



enum FilterType:String{
    case latest = "LATEST"
    case LowToHigh = "LowToHigh"
    case HighToLow = "HighToLow"
}
