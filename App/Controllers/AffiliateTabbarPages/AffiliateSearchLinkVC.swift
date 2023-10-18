//
//  AffiliateSearchLinkVC.swift
//  App
//
//  Created by Phycom Mac Pro on 02/10/23.
//  Copyright © 2023 RADICAL START. All rights reserved.
//

import UIKit
import GooglePlaces
import SkeletonView

class AffiliateSearchLinkVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout, searchPlaceProtocol,SkeletonCollectionViewDataSource{

    var PageIndex : Int = 1
    var arrLinkSearchList = [PTProAPI.AffiliateSearchListingQuery.Data.AffiliateSearchListing.Result]()
    
    @IBOutlet var cvLinkSearch: UICollectionView!
    var selectedFilter:FilterType = .latest
    @IBOutlet var lblLocation: UILabel!

    
    @IBOutlet weak var NoresultView: UIView!
    @IBOutlet weak var NoListingFoundImage: UIImageView!
    @IBOutlet weak var NoViewNoresult: UILabel!
    @IBOutlet weak var noViewFirstText: UILabel!
    @IBOutlet weak var noViewSecondText: UILabel!
    @IBOutlet weak var NoViewthirdText: UILabel!
    
    @IBOutlet weak var offlineView: UIView!
    @IBOutlet weak var retry_button: UIButton!
    @IBOutlet weak var error_label: UILabel!

    
    //MARK: - VIEW LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        Utility.shared.searchlocationfromAffiliateSearch = ""
        Utility.shared.searchAddressfromAffiliateSearch = ""

        // Do any additional setup after loading the view.
        setUpdatedView()
      
        self.lblLocation.text = "\(Utility.shared.getLanguage()?.value(forKey:"TypeCityNameHere") ?? "Type City Name Here")"
        self.lblLocation.textColor =  .lightGray
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    func setUpdatedView(){
        self.offlineView.isHidden = true
        self.NoresultView.isHidden = true
        
        
        cvLinkSearch?.prepareSkeleton(completion: { [self] done in
            self.cvLinkSearch?.isSkeletonable = true
            self.cvLinkSearch?.showAnimatedGradientSkeleton()
        })
        if (Utility.shared.isRTLLanguage()){
            self.cvLinkSearch.semanticContentAttribute = .forceRightToLeft
        }else{
            self.cvLinkSearch.semanticContentAttribute = .forceLeftToRight
        }
        
        self.cvLinkSearch.delegate = self
        self.cvLinkSearch.dataSource = self
        
        affiliateSearchLinkListAPICall(address: "", filter: selectedFilter.rawValue)
    }
    
    //MARK: - CUSTOM METHOD
    func initialSetup(){
        NoViewNoresult.text = "\((Utility.shared.getLanguage()?.value(forKey:"noresults"))!)"
        NoViewNoresult.textColor = UIColor(named: "Title_Header")
       // NoListingFoundTitle.text = "\((Utility.shared.getLanguage()?.value(forKey:"NoListingFound")) ?? "No listing found")"
        noViewFirstText.text = "\((Utility.shared.getLanguage()?.value(forKey:"tryadjustingsearch"))!)"
         noViewSecondText.text = "\((Utility.shared.getLanguage()?.value(forKey:"changefiltersdates"))!)"
         NoViewthirdText.text = "\((Utility.shared.getLanguage()?.value(forKey:"specificaddresscity"))!)"
        error_label.textColor =  UIColor(named: "Title_Header")
        retry_button.setTitleColor(Theme.PRIMARY_COLOR, for: .normal)
        
        error_label.text = "\((Utility.shared.getLanguage()?.value(forKey:"error_field"))!)"
        
        retry_button.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"retry"))!)", for:.normal)
    }
    
    func selectFilterType(){
        let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        
        let latest = UIAlertAction(title: "Latest", style: .default) { action in
            if self.selectedFilter != .latest{
                self.selectedFilter = .latest
                self.cvLinkSearch?.prepareSkeleton(completion: { [self] done in
                    self.cvLinkSearch?.isSkeletonable = true
                })
                self.cvLinkSearch?.showAnimatedGradientSkeleton()
                self.affiliateSearchLinkListAPICall(address: Utility.shared.searchlocationfromAffiliateSearch , filter: FilterType.latest.rawValue)
            }
        }
        
        let lowToHight = UIAlertAction(title: "Price(Low to high)", style: .default) { action in
            if self.selectedFilter != .LowToHigh{
                self.selectedFilter = .LowToHigh
                self.cvLinkSearch?.prepareSkeleton(completion: { [self] done in
                    self.cvLinkSearch?.isSkeletonable = true
                    self.cvLinkSearch?.showAnimatedGradientSkeleton()
                })
                self.affiliateSearchLinkListAPICall(address: Utility.shared.searchlocationfromAffiliateSearch , filter: FilterType.LowToHigh.rawValue)
            }
        }
        
        let hightToLow = UIAlertAction(title: "Price(High to low)", style: .default) { action in
            if self.selectedFilter != .HighToLow{
                self.selectedFilter = .HighToLow
                self.cvLinkSearch?.prepareSkeleton(completion: { [self] done in
                    self.cvLinkSearch?.isSkeletonable = true
                    self.cvLinkSearch?.showAnimatedGradientSkeleton()
                })
                self.affiliateSearchLinkListAPICall(address: Utility.shared.searchlocationfromAffiliateSearch, filter: FilterType.HighToLow.rawValue)
            }
        }
        
        
        switch selectedFilter {
        case .latest:
            latest.setValue(true, forKey: "checked")
            lowToHight.setValue(false, forKey: "checked")
            hightToLow.setValue(false, forKey: "checked")
        case .LowToHigh:
            latest.setValue(false, forKey: "checked")
            lowToHight.setValue(true, forKey: "checked")
            hightToLow.setValue(false, forKey: "checked")
        case .HighToLow:
            latest.setValue(false, forKey: "checked")
            lowToHight.setValue(false, forKey: "checked")
            hightToLow.setValue(true, forKey: "checked")
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
        selectFilterType()
    }
    
    @IBAction func onClickPlaceSelection(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let searchPlaceVC = storyboard.instantiateViewController(withIdentifier: "SearchPlaceVC") as! SearchPlaceVC
        searchPlaceVC.delegate = self
        Utility.shared.isFromAffiliateLinkManagerPage = false
        Utility.shared.isFromAffiliateSearchPage = true
        searchPlaceVC.modalPresentationStyle = .fullScreen
        self.present(searchPlaceVC, animated: true, completion: nil)
    }
    
    @IBAction func onClickBack(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func onClickRetry(_ sender: UIButton) {
        if Utility.shared.searchlocationfromAffiliateSearch != ""{
            self.searchLinkAPICall(address: Utility.shared.searchlocationfromAffiliateSearch)
        }else{
            self.searchLinkAPICall(address:"" )
        }
    }
    @objc func onClickGetLink(sender:UIButton){
        let selectedIndex = sender.tag
        if let generated = arrLinkSearchList[selectedIndex].isGenerated,generated == 1{
            self.shareUrl(selectedIndex: selectedIndex)
        }else{
            self.createAffiliateLinkAPICALL(propertyId: arrLinkSearchList[selectedIndex].id ?? 0, affiliateId: arrLinkSearchList[selectedIndex].affiliateId ?? "", selectedIndex: selectedIndex)
        }
    }
    
    func shareUrl(selectedIndex:Int){
        let url = URL(string: "\(SHARE_URL)\(arrLinkSearchList[selectedIndex].id ?? 0)?ref=\(arrLinkSearchList[selectedIndex].referralId ?? "")")!
        let activity = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        self.present(activity, animated: true)
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
        cell.imgLocation.tintColor = .black
        
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
        cell.btnLink.tag = indexPath.row
        if(self.arrLinkSearchList[indexPath.row].isGenerated == 1){
            cell.btnLink.setTitle("COPIED", for: .normal)
        }else{
            cell.btnLink.setTitle("GET LINK", for: .normal)
        }
        cell.btnLink.addTarget(self, action: #selector(onClickGetLink(sender:)), for: .touchUpInside)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //        let title = arrLinkSearchList[indexPath.row].title ?? ""
        //        let city = arrLinkSearchList[indexPath.row].city ?? ""
        //        let description = arrLinkSearchList[indexPath.row].description ?? ""
        //        let height = 204 + heightForView(text: title, font: UIFont(name: "Circular-Medium", size:  14.0)!, width: self.view.frame.width - 40) + heightForView(text: city, font: .systemFont(ofSize: 17.0), width: self.view.frame.width - 40) + heightForView(text: description , font: .systemFont(ofSize: 14.0), width: self.view.frame.width - 40)
        return CGSize(width: (self.view.frame.size.width - 40), height: 344)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
                        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRectMake(0, 0, width, CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        
        label.sizeToFit()
        return label.frame.height
    }
    
    //MARK: - API CALL
    func affiliateSearchLinkListAPICall(address:String, filter:String){

        let affiliateSearchListingQuery = PTProAPI.AffiliateSearchListingQuery(userId: .some(Utility.shared.ProfileAPIArray?.userId ?? ""), address: .some(address), orderBy: .some(filter))
        Network.shared.apollo_headerClient.fetch(query: affiliateSearchListingQuery, cachePolicy: .fetchIgnoringCacheData) { response in
            switch response{
            case .success(let result):
                if let data = result.data?.affiliateSearchListing?.status,data == 200 {
                    if let list =  result.data?.affiliateSearchListing, let results = list.results{
                        self.arrLinkSearchList = results as! [PTProAPI.AffiliateSearchListingQuery.Data.AffiliateSearchListing.Result]
                        self.NoresultView.isHidden = true
                    }else{
                        self.arrLinkSearchList.removeAll()
                        self.NoresultView.isHidden = false
                    }
                    self.cvLinkSearch.setContentOffset(.zero, animated: true)
                    self.cvLinkSearch.reloadData()
                } else {
                    self.view.makeToast(result.data?.affiliateSearchListing?.errorMessage)
                }
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
                break
            }
            self.cvLinkSearch?.isSkeletonable = false
            self.cvLinkSearch?.hideSkeleton()
        }
    }
    
    func createAffiliateLinkAPICALL(propertyId: Int, affiliateId: String,selectedIndex:Int){
        let query = PTProAPI.CreateAffiliateLinkMutation(propertyId: .some(propertyId), affiliateId: .some(affiliateId))
        Network.shared.apollo_headerClient.perform(mutation: query){ response in
            switch response{
            case .success(let result):
                if let status = result.data?.createAffiliateLink?.status,status == 200 {
                    self.shareUrl(selectedIndex: selectedIndex)
                } else {
                    self.view.makeToast(result.data?.createAffiliateLink?.errorMessage)
                }
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
                break
            }
        }
    }
    
    func searchLinkAPICall(address: String) {
        if Utility.shared.searchAddressfromAffiliateSearch == ""{
            self.lblLocation.text = "\(Utility.shared.getLanguage()?.value(forKey:"TypeCityNameHere") ?? "Type City Name Here")"
            self.lblLocation.textColor =  .lightGray
        }else{
            self.lblLocation.text = Utility.shared.searchAddressfromAffiliateSearch
            self.lblLocation.textColor =  UIColor(named: "Title_Header")
        }
        self.affiliateSearchLinkListAPICall(address: address, filter: selectedFilter.rawValue)
    }
    
    //MARK: - collectionSkeletonView

    func numSections(in collectionSkeletonView: UICollectionView) -> Int  {
        return 1
    }
   func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "AffiliateSearchLinkCVC"
    }

    func collectionSkeletonView(_ skeletonView: UICollectionView, skeletonCellForItemAt indexPath: IndexPath) -> UICollectionViewCell?
    {
        print(skeletonView)
        let cell = skeletonView.dequeueReusableCell(withReuseIdentifier: "AffiliateSearchLinkCVC", for: indexPath)as! AffiliateSearchLinkCVC
        
        return cell
        
    }
}

enum FilterType:String{
    case latest = "LATEST"
    case LowToHigh = "ASC"
    case HighToLow = "DESC"
}

