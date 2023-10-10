//
//  AffiliateLinkManagerVC.swift
//  App
//
//  Created by Phycom Mac Pro on 02/10/23.
//  Copyright © 2023 RADICAL START. All rights reserved.
//

import UIKit
import GooglePlaces
import SkeletonView

class AffiliateLinkManagerVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout, searchPlaceProtocol,SkeletonCollectionViewDataSource{

    var PageIndex : Int = 1
    var arrLinkManagerList = [PTProAPI.AffiliateLinkManagerQuery.Data.AffiliateLinkManager.Result]()
     
    @IBOutlet var cvLinkManager: UICollectionView!
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
        Utility.shared.searchlocationfromAffiliateLinkManager = ""
        Utility.shared.searchAddressfromAffiliateLinkManager = ""
        // Do any additional setup after loading the view.
        setUpdatedView()
      
        self.lblLocation.text = "\(Utility.shared.getLanguage()?.value(forKey:"TypeCityNameHere") ?? "Type City Name Here")"
        self.lblLocation.textColor =  .lightGray
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        self.cvLinkManager.hideSkeleton()
//        self.cvLinkManager.isSkeletonable = false
        if Utility.shared.searchlocationfromAffiliateLinkManager == ""{
            self.affiliateManagerLinkListAPICall(address: "")
        }else{
            self.affiliateManagerLinkListAPICall(address: Utility.shared.searchlocationfromAffiliateLinkManager)
        }
    }
    
    func setUpdatedView(){
        
        self.offlineView.isHidden = true
        self.NoresultView.isHidden = true
        
        cvLinkManager?.prepareSkeleton(completion: { [self] done in
            self.cvLinkManager?.isSkeletonable = true
            self.cvLinkManager?.showAnimatedGradientSkeleton()
        })
        if (Utility.shared.isRTLLanguage()){
            self.cvLinkManager.semanticContentAttribute = .forceRightToLeft
        }else{
            self.cvLinkManager.semanticContentAttribute = .forceLeftToRight
        }
        
        self.cvLinkManager.delegate = self
        self.cvLinkManager.dataSource = self
        
        
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
        
    func isFilterApplied() -> Bool{
        if lblLocation.text == "\(Utility.shared.getLanguage()?.value(forKey:"TypeCityNameHere") ?? "Type City Name Here")"{
            return false
        }else{
            return true
        }
    }
    
    //MARK: - Actions
    @IBAction func onClickPlaceSelection(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let searchPlaceVC = storyboard.instantiateViewController(withIdentifier: "SearchPlaceVC") as! SearchPlaceVC
        searchPlaceVC.delegate = self
        Utility.shared.isFromAffiliateLinkManagerPage = true
        Utility.shared.isFromAffiliateSearchPage = false
        searchPlaceVC.modalPresentationStyle = .fullScreen
        self.present(searchPlaceVC, animated: true, completion: nil)
    }
    
    @objc func onClickGetLink(sender:UIButton){
        self.shareUrl(selectedIndex: sender.tag)
    }
    
    func shareUrl(selectedIndex:Int){
        let url = URL(string: "\(SHARE_URL)\(arrLinkManagerList[selectedIndex].id ?? 0)?ref=\(arrLinkManagerList[selectedIndex].referralId ?? "")")!
        let activity = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        self.present(activity, animated: true)
    }

    @IBAction func onClickRetry(_ sender: UIButton) {
        if Utility.shared.searchlocationfromAffiliateLinkManager == ""{
            self.affiliateManagerLinkListAPICall(address: "")
        }else{
            self.affiliateManagerLinkListAPICall(address: Utility.shared.searchlocationfromAffiliateLinkManager)
        }
    }

    //MARK: - UICollectionView delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrLinkManagerList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AffiliateLinkManagerCVC", for: indexPath) as! AffiliateLinkManagerCVC
        cell.lblTitle.text = arrLinkManagerList[indexPath.row].title
        
        if let imgList = arrLinkManagerList[indexPath.row].listPhotos,imgList.count > 0{
            cell.img.sd_setImage(with: URL(string: "\(IMAGE_LISTING_MEDIUM)\(imgList[0]!.name ?? "")"), placeholderImage: #imageLiteral(resourceName: "placeholderimg"))
        }else{
            cell.img.sd_setImage(with: URL(string: "\(IMAGE_LISTING_MEDIUM)"), placeholderImage: #imageLiteral(resourceName: "placeholderimg"))
        }
        
        cell.lblEarningsValue.text = String(arrLinkManagerList[indexPath.row].earning ?? 0)
        cell.lblClickValue.text = String(arrLinkManagerList[indexPath.row].clickResult ?? 0)
        cell.lblRevenueSharingValue.text = String(arrLinkManagerList[indexPath.row].clickResult ?? 0)

        if(Utility.shared.getPreferredCurrency() != nil &&  Utility.shared.getPreferredCurrency() != "")
        {
            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!)
            let from_currency = self.arrLinkManagerList[indexPath.row].listingData?.currency
            let currency_amount = self.arrLinkManagerList[indexPath.row].listingData?.basePrice != nil ? self.arrLinkManagerList[indexPath.row].listingData?.basePrice : 0
            let price_value = Utility.shared.getCurrencyRate(basecurrency: Utility.shared.currencyvalue_from_API_base , fromCurrency:from_currency!, toCurrency:Utility.shared.getPreferredCurrency()!, CurrencyRate:Utility.shared.currency_Dict, amount:currency_amount!)
            let restricted_price =  Double(String(format: "%.2f",price_value))
            cell.lblPrice.text =  "\(currencysymbol!)\(restricted_price!.clean)"
        }else{
            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode: self.arrLinkManagerList[indexPath.row].listingData?.currency ?? "")
            let from_currency = self.arrLinkManagerList[indexPath.row].listingData?.currency
            let currency_amount = self.arrLinkManagerList[indexPath.row].listingData?.basePrice != nil ? self.arrLinkManagerList[indexPath.row].listingData?.basePrice : 0
            let price_value = Utility.shared.getCurrencyRate(basecurrency:self.arrLinkManagerList[indexPath.row].listingData?.currency ?? "", fromCurrency:from_currency!, toCurrency:self.arrLinkManagerList[indexPath.row].listingData?.currency ?? "", CurrencyRate:Utility.shared.currency_Dict, amount:currency_amount!)
            let restricted_price =  Double(String(format: "%.2f",price_value))
            cell.lblPrice.text = "\(currencysymbol!)\(restricted_price!.clean)"
        }
        cell.btnCopyLink.tag = indexPath.row
        cell.btnCopyLink.addTarget(self, action: #selector(onClickGetLink(sender:)), for: .touchUpInside)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //        let title = arrLinkManagerList[indexPath.row].title ?? ""
        //        let city = arrLinkManagerList[indexPath.row].city ?? ""
        //        let description = arrLinkManagerList[indexPath.row].description ?? ""
        //        let height = 204 + heightForView(text: title, font: UIFont(name: "Circular-Medium", size:  14.0)!, width: self.view.frame.width - 40) + heightForView(text: city, font: .systemFont(ofSize: 17.0), width: self.view.frame.width - 40) + heightForView(text: description , font: .systemFont(ofSize: 14.0), width: self.view.frame.width - 40)
        return CGSize(width: (self.view.frame.size.width - 40), height: 365)
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
    func affiliateManagerLinkListAPICall(address:String){

        if Utility.shared.isConnectedToNetwork() {
            let affiliateManagerListingQuery = PTProAPI.AffiliateLinkManagerQuery(userId: .some(Utility.shared.ProfileAPIArray?.userId ?? ""), address: .some(address))
            Network.shared.apollo_headerClient.fetch(query: affiliateManagerListingQuery, cachePolicy: .fetchIgnoringCacheData) { response in
                switch response{
                case .success(let result):
                    if let data = result.data?.affiliateLinkManager?.status,data == 200 {
                        if let list =  result.data?.affiliateLinkManager, let results = list.results{
                            self.arrLinkManagerList = results as! [PTProAPI.AffiliateLinkManagerQuery.Data.AffiliateLinkManager.Result]
                            self.NoresultView.isHidden = true
                        }else{
                            self.arrLinkManagerList.removeAll()
                            self.NoresultView.isHidden = false
                        }
                        self.cvLinkManager.reloadData()
                        self.offlineView.isHidden = true
                    } else {
                        self.view.makeToast(result.data?.affiliateLinkManager?.errorMessage)
                    }
                case .failure(let error):
                    self.view.makeToast(error.localizedDescription)
                    break
                }
                self.cvLinkManager?.isSkeletonable = false
                self.cvLinkManager?.hideSkeleton()
            }
        }else{
            self.offlineView.isHidden = false
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
        if Utility.shared.searchAddressfromAffiliateLinkManager == ""{
            self.lblLocation.text = "\(Utility.shared.getLanguage()?.value(forKey:"TypeCityNameHere") ?? "Type City Name Here")"
            self.lblLocation.textColor =  .lightGray
        }else{
            self.lblLocation.text = Utility.shared.searchAddressfromAffiliateLinkManager
            self.lblLocation.textColor =  UIColor(named: "Title_Header")
        }
        self.affiliateManagerLinkListAPICall(address: address)
    }
    
    //MARK: - collectionSkeletonView

    func numSections(in collectionSkeletonView: UICollectionView) -> Int  {
        return 1
    }
   func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "AffiliateLinkManagerCVC"
    }

    func collectionSkeletonView(_ skeletonView: UICollectionView, skeletonCellForItemAt indexPath: IndexPath) -> UICollectionViewCell?
    {
        print(skeletonView)
        let cell = skeletonView.dequeueReusableCell(withReuseIdentifier: "AffiliateLinkManagerCVC", for: indexPath)as! AffiliateLinkManagerCVC
        
        return cell
        
    }
}

