//
//  YouMayLikeVC.swift
//  App
//
//  Created by Phycom Mac Pro on 23/12/23.
//  Copyright © 2023 RADICAL START. All rights reserved.
//
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
import FlexiblePageControl
import SKPhotoBrowser
import RangeSeekSlider

class YouMayLikeVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout, searchPlaceProtocol,SkeletonCollectionViewDataSource, ListVCProtocol, RangeSeekSliderDelegate{

    var PageIndex : Int = 1
    var arrGetHosted = [PTProAPI.GetHostSuggestedQuery.Data.GetHostSuggested.Result]()
    var filteredImageArray = NSMutableArray()

    @IBOutlet var cvLinkSearch: UICollectionView!
    var selectedFilter:FilterType = .latest
    @IBOutlet var lblLocation: UILabel!

    @IBOutlet weak var priceRangeLabel: UILabel!
    @IBOutlet var sliderView: RangeSeekSlider!
    
    @IBOutlet weak var NoresultView: UIView!
    @IBOutlet weak var NoListingFoundImage: UIImageView!
    @IBOutlet weak var NoViewNoresult: UILabel!
    @IBOutlet weak var noViewFirstText: UILabel!
    @IBOutlet weak var noViewSecondText: UILabel!
    @IBOutlet weak var NoViewthirdText: UILabel!
    
    @IBOutlet weak var offlineView: UIView!
    @IBOutlet weak var retry_button: UIButton!
    @IBOutlet weak var error_label: UILabel!

    
    @IBOutlet weak var btnFiveStar: UIButton!
    @IBOutlet weak var btnFourStar: UIButton!
    @IBOutlet weak var btnThreeStar: UIButton!
    @IBOutlet weak var btnTwoStar: UIButton!
    @IBOutlet weak var btnOneStar: UIButton!
    
    @IBOutlet weak var viewFilter: UIView!
    @IBOutlet weak var viewFilterBG: UIView!
    
    var minvalue = Int()
    var maxValue = Int()
    var selectedRating = "0"

    //MARK: - VIEW LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        Utility.shared.searchlocationfromAffiliateSearch = ""
        Utility.shared.searchAddressfromAffiliateSearch = ""

        // Do any additional setup after loading the view.
        setUpdatedView()
      
        self.lblLocation.text = ""
        self.lblLocation.textColor =  .lightGray
        self.initializeRangeView()
        
        self.viewFilter.isHidden = true
        self.viewFilterBG.isHidden = true

        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        viewFilterBG.addGestureRecognizer(tap)
    }
    
    func initializeRangeView(){
        self.sliderView.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        self.priceRangeLabel.textColor = UIColor(named: "searchPlaces_TextColor")

        if(Utility.shared.getPreferredCurrency() != nil && Utility.shared.getPreferredCurrency() != "")
        {
            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!)
            let from_currency = Utility.shared.getPreferredCurrency()!
            let currency_amount = Double(0)
            let max_currency_amount = Double(10000)
            let price_value = Utility.shared.getCurrencyRate(basecurrency:Utility.shared.currencyvalue_from_API_base, fromCurrency:from_currency, toCurrency:Utility.shared.getPreferredCurrency()!, CurrencyRate:Utility.shared.currency_Dict, amount:Double(currency_amount))
            
            let price_value1 = Utility.shared.getCurrencyRate(basecurrency:Utility.shared.currencyvalue_from_API_base, fromCurrency:from_currency, toCurrency:Utility.shared.getPreferredCurrency()!, CurrencyRate:Utility.shared.currency_Dict, amount:Double(max_currency_amount))
            let restricted_price =  Double(String(format: "%.2f",price_value))
            self.sliderView.minValue = CGFloat(restricted_price!)
            self.sliderView.maxValue = CGFloat(price_value1)
            self.minvalue = Int(restricted_price!)
            self.maxValue = Int(price_value1)
            
            self.sliderView.selectedMinValue = Utility.shared.priceRangeArray[0] as! CGFloat
            self.sliderView.selectedMaxValue = Utility.shared.priceRangeArray[1] as! CGFloat
            self.priceRangeLabel.text = "\(currencysymbol!)\(Utility.shared.priceRangeArray[0] as! Int) - \(currencysymbol!)\(Utility.shared.priceRangeArray[1] as! Int)"
            
        }else{
            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode:Utility.shared.currencyvalue_from_API_base)
            let currency = Utility.shared.currencyvalue_from_API_base
            
            let restricted_price =  0
            var price_value1 = 10000
            
            self.sliderView.minValue = CGFloat(restricted_price)
            self.sliderView.maxValue = CGFloat(price_value1)
            self.minvalue = Int(restricted_price)
            self.maxValue = Int(price_value1)
            self.sliderView.selectedMinValue = CGFloat(restricted_price)
            self.sliderView.selectedMaxValue = CGFloat(price_value1)
            self.priceRangeLabel.text = "\(currencysymbol ?? "$")\(Int(restricted_price)) - \(currencysymbol ?? "$")\(Int(price_value1))"
            
            
            self.sliderView.numberFormatter.positivePrefix = Utility.shared.getSymbol(forCurrencyCode: (Utility.shared.currencyvalue_from_API_base))
            
        }
        self.sliderView.delegate = self
        
        self.sliderView.numberFormatter.maximumFractionDigits = 2
        self.sliderView.numberFormatter.numberStyle = .currency
        self.sliderView.minLabelFont = UIFont.boldSystemFont(ofSize:14)
        self.sliderView.maxLabelFont = UIFont.boldSystemFont(ofSize:14)
    }
    
    @objc func sliderValueChanged(_ sender: Any) {
    }
    
    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {
        var symbol = ""
        if(Utility.shared.getPreferredCurrency() != nil && Utility.shared.getPreferredCurrency() != "")
        {
            symbol = Utility.shared.getSymbol(forCurrencyCode: (Utility.shared.getPreferredCurrency()!))!
        }else{
            symbol = Utility.shared.getSymbol(forCurrencyCode: (Utility.shared.currencyvalue_from_API_base))!
        }
        self.minvalue = Int(minValue)
        self.maxValue = Int(maxValue)

        self.priceRangeLabel.text = "\(symbol)\(self.minvalue) - \(symbol)\(self.maxValue)"
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        self.viewFilter.isHidden = true
        self.viewFilterBG.isHidden = true
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
        
        apiCallGetHosted(priceRange:[], review: "0")
        //affiliateSearchLinkListAPICall(address: "", filter: selectedFilter.rawValue)
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
        self.viewFilter.isHidden = false
        self.viewFilterBG.isHidden = false
    }
    
    //MARK: - Actions
    @IBAction func onClickStar(_ sender: UIButton) {
        btnOneStar.setImage(UIImage(named: "circleUnCheck"), for: .normal)
        btnTwoStar.setImage(UIImage(named: "circleUnCheck"), for: .normal)
        btnThreeStar.setImage(UIImage(named: "circleUnCheck"), for: .normal)
        btnFourStar.setImage(UIImage(named: "circleUnCheck"), for: .normal)
        btnFiveStar.setImage(UIImage(named: "circleUnCheck"), for: .normal)

        switch sender.tag{
        case 1:
            selectedRating = "1"
            btnOneStar.setImage(UIImage(named: "purpleCheck"), for: .normal)
        case 2:
            selectedRating = "2"
            btnTwoStar.setImage(UIImage(named: "purpleCheck"), for: .normal)
        case 3:
            selectedRating = "3"
            btnThreeStar.setImage(UIImage(named: "purpleCheck"), for: .normal)
        case 4:
            selectedRating = "4"
            btnFourStar.setImage(UIImage(named: "purpleCheck"), for: .normal)
        case 5:
            selectedRating = "5"
            btnFiveStar.setImage(UIImage(named: "purpleCheck"), for: .normal)
            break
        default: break
        }
    }
    
    @IBAction func onClickCancel(_ sender: UIButton) {
        self.viewFilter.isHidden = false
        self.viewFilterBG.isHidden = false
    }
    
    @IBAction func onClickApply(_ sender: UIButton) {
        var priceRange:[Int] = []
        if minvalue == 0 && maxValue == 10000{
            priceRange = []
        }else{
            priceRange = [minvalue , maxValue]
        }
        self.apiCallGetHosted(priceRange:priceRange , review: selectedRating)
    }

    @IBAction func onFilter(_ sender: UIButton) {

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

    }
    
    
    @objc func onClickGetLink(sender:UIButton){

    }
    
    //MARK: - UICollectionView delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrGetHosted.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "YouMayLikeCVC", for: indexPath)as! YouMayLikeCVC
                
                var listTypeString = ""
                
                
                if(Utility.shared.isRTLLanguage()) {
                    
                
                if ((self.arrGetHosted[indexPath.row].beds ?? 0) > 1){
                    listTypeString =  "\(self.arrGetHosted[indexPath.row].beds ?? 0)" + " beds"
                }else if ((self.arrGetHosted[indexPath.row].beds ?? 0) == 1){
                    listTypeString = "\(self.arrGetHosted[indexPath.row].beds ?? 0)" + " bed"
                }
                    
                    listTypeString = listTypeString + " / " + "\(self.arrGetHosted[indexPath.row].roomType ?? "")"
                }
                else {
                    listTypeString = "\(self.arrGetHosted[indexPath.row].roomType ?? "")"
                    if ((self.arrGetHosted[indexPath.row].beds ?? 0) > 1){
                        listTypeString = listTypeString + " / " + "\(self.arrGetHosted[indexPath.row].beds ?? 0)" + " beds"
                    }else if ((self.arrGetHosted[indexPath.row].beds ?? 0) == 1){
                        listTypeString = listTypeString + " / " + "\(self.arrGetHosted[indexPath.row].beds ?? 0)" + " bed"
                    }
                    
                }
                cell.listTypeLabel.text = listTypeString
                cell.listTypeLabel.textColor = UIColor(named: "searchPlaces_TextColor")
                                
                cell.listTitleLabel.text = self.arrGetHosted[indexPath.row].title ?? ""
                
//                cell.lightImg.isHidden = self.arrGetHosted[indexPath.row].bookingType != "instant"
//                
//                if Utility.shared.isRTLLanguage(){
//                  cell.thunderTop.constant = 19
//                }
//                else {
//                    cell.thunderTop.constant = 23
//                }
                
        let array = arrGetHosted[indexPath.row].listPhotos
        self.filteredImageArray.removeAllObjects()
        for j in array!
        {
            self.filteredImageArray.add("\(IMAGE_LISTING_MEDIUM)\(j?.name ?? "0")" as Any)
        }
    
                cell.imgScrollerView.setupScrollerWithImages(images:self.filteredImageArray as! [String])
                let config = FlexiblePageControl.Config(
                    displayCount: self.filteredImageArray.count,
                    dotSize: 10,
                    dotSpace: 6,
                    smallDotSizeRatio: 0.5,
                    mediumDotSizeRatio: 0.7
                )

                cell.pageControllView.setConfig(config)
                cell.pageControllView.numberOfPages = self.filteredImageArray.count
                
                cell.pageControllView.numberOfPages = self.filteredImageArray.count
                cell.pageControllView.tag = indexPath.item
                cell.imgScrollerView.tag = indexPath.row
           

            cell.tag = indexPath.row + 2000
                    let tap = UITapGestureRecognizer(target: self, action: #selector(imageScrollerTapped))
                    tap.numberOfTapsRequired = 1
                    tap.view?.tag = indexPath.row
                    cell.imgScrollerView.addGestureRecognizer(tap)
        
            if(Utility.shared.getPreferredCurrency() != nil &&  Utility.shared.getPreferredCurrency() != "")
            {
            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!)
            let from_currency = self.arrGetHosted[indexPath.row].listingData?.currency
                let currency_amount = self.arrGetHosted[indexPath.row].listingData?.basePrice != nil ? self.arrGetHosted[indexPath.row].listingData?.basePrice : 0
            
            let price_value = Utility.shared.getCurrencyRate(basecurrency:Utility.shared.currencyvalue_from_API_base, fromCurrency:from_currency!, toCurrency:Utility.shared.getPreferredCurrency()!, CurrencyRate:Utility.shared.currency_Dict, amount:currency_amount!)
            let restricted_price =  Double(String(format: "%.2f",price_value))
                
                let attributes = [
                    NSAttributedString.Key.font: UIFont(name: APP_FONT_SEMIBOLD, size: 22),
                    NSAttributedString.Key.foregroundColor: UIColor(named: "viewList_Title")
                ]
                let attributes2 = [
                    NSAttributedString.Key.font: UIFont(name: APP_FONT_MEDIUM, size: 12),
                    NSAttributedString.Key.foregroundColor: UIColor(named: "viewList_Title")
                ]
                if(Utility.shared.isRTLLanguage()) {
                    
                    
                    let attributedString2 = NSMutableAttributedString(string: "/ \(currencysymbol!)\(restricted_price!.clean)" , attributes: attributes as [NSAttributedString.Key : Any])
                    let attributedString = NSMutableAttributedString(string: "\(Utility.shared.getLanguage()?.value(forKey:"night") ?? "Night")", attributes: attributes2 as [NSAttributedString.Key : Any])
                    
                    attributedString.append(attributedString2)
                    
                    cell.listPriceLabel.attributedText = attributedString
                    
                }
                else {
                let attributedString = NSMutableAttributedString(string: "\(currencysymbol!)\(restricted_price!.clean)" , attributes: attributes as [NSAttributedString.Key : Any])
                
                let attributedString2 = NSMutableAttributedString(string: "/ \(Utility.shared.getLanguage()?.value(forKey:"night") ?? "Night")", attributes: attributes2 as [NSAttributedString.Key : Any])
                
                attributedString.append(attributedString2)
                
                cell.listPriceLabel.attributedText = attributedString
                }
                cell.listPriceLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
                
           
        }
        else
        {
            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode:Utility.shared.currencyvalue_from_API_base)
            let from_currency = self.arrGetHosted[indexPath.row].listingData?.currency
            let currency_amount = self.arrGetHosted[indexPath.row].listingData?.basePrice != nil ? self.arrGetHosted[indexPath.row].listingData?.basePrice! : 0
            let price_value = Utility.shared.getCurrencyRate(basecurrency:Utility.shared.currencyvalue_from_API_base, fromCurrency:from_currency!, toCurrency:Utility.shared.currencyvalue_from_API_base, CurrencyRate:Utility.shared.currency_Dict, amount:currency_amount!)
            let restricted_price =  Double(String(format: "%.2f",price_value))
            
            
            
            let attributes = [
                NSAttributedString.Key.font: UIFont(name: APP_FONT_SEMIBOLD, size: 22),
                NSAttributedString.Key.foregroundColor: UIColor(named: "viewList_Title")
            ]
                
          
            let attributes2 = [
                NSAttributedString.Key.font: UIFont(name: APP_FONT_MEDIUM, size: 12),
                NSAttributedString.Key.foregroundColor: UIColor(named: "viewList_Title")
            ]
            
            if(Utility.shared.isRTLLanguage()) {
                
                let attributes2 = [
                    NSAttributedString.Key.font: UIFont(name: APP_FONT_MEDIUM, size: 12),
                    NSAttributedString.Key.foregroundColor: UIColor(named: "viewList_Title")
                ]
                let attributedString2 = NSMutableAttributedString(string: "/ \(currencysymbol!)\(restricted_price!.clean)" , attributes: attributes as [NSAttributedString.Key : Any])
                let attributedString = NSMutableAttributedString(string: "\(Utility.shared.getLanguage()?.value(forKey:"night") ?? "Night")", attributes: attributes2 as [NSAttributedString.Key : Any])
                
                attributedString.append(attributedString2)
                
                cell.listPriceLabel.attributedText = attributedString
                
            }
            else {
            let attributedString = NSMutableAttributedString(string: "\(currencysymbol!)\(restricted_price!.clean)" , attributes: attributes as [NSAttributedString.Key : Any])
            let attributes2 = [
                NSAttributedString.Key.font: UIFont(name: APP_FONT_MEDIUM, size: 12),
                NSAttributedString.Key.foregroundColor: UIColor(named: "viewList_Title")
            ]
            let attributedString2 = NSMutableAttributedString(string: "/ \(Utility.shared.getLanguage()?.value(forKey:"night") ?? "Night")", attributes: attributes2 as [NSAttributedString.Key : Any])
            
            attributedString.append(attributedString2)
            
            cell.listPriceLabel.attributedText = attributedString
            }
            
           
            cell.listPriceLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        }
        //Review Count
                let value1 = Float(arrGetHosted[indexPath.row].reviewsCount ?? 0)
                let value2 = Float(arrGetHosted[indexPath.row].reviewsStarRating ?? 0)
                if(value2 != 0.0){
                    let dividedValue = value2/value1
                    cell.ratingCount.text = "\(Int(dividedValue.rounded()))"
                    cell.ratingView.isHidden = false
                }else{
                    cell.ratingCount.text = "0.0"
                    cell.ratingView.isHidden = true
                }
        
            return cell
            }
    
    @objc func imageScrollerTapped(_ sender: UITapGestureRecognizer) {
       if(arrGetHosted.count > 0)
       {
           let viewListing = UpdatedViewListing()
           Utility.shared.unpublish_preview_check = false
           viewListing.listID = arrGetHosted[sender.view!.tag].id ?? 0
           viewListing.delegate = self
           if let imageCell = self.cvLinkSearch.cellForItem(at: IndexPath(row: sender.view?.tag ?? 0, section: 0)) as? YouMayLikeCVC {
//                imageCell.contentView.backgroundColor = UIColor.white
               viewListing.cc_setZoomTransition(originalView:imageCell.contentView)
           }
           self.present(viewListing, animated: true, completion: nil)
       }
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
    func apiCallGetHosted(priceRange: [Int], review:String){
        let getHostSuggestedQuery = PTProAPI.GetHostSuggestedQuery(userId: Utility.shared.ProfileAPIArray?.userId ?? "" , currentPage: 1 , priceRange: priceRange, review: review)
        Network.shared.apollo_headerClient.fetch(query: getHostSuggestedQuery, cachePolicy: .fetchIgnoringCacheData) { response in
            switch response{
            case .success(let result):
                if let status = result.data?.getHostSuggested?.status,status == 200 {
                    if let list =  result.data?.getHostSuggested, let results = list.results{
                        self.arrGetHosted = results as! [PTProAPI.GetHostSuggestedQuery.Data.GetHostSuggested.Result]
                        self.NoresultView.isHidden = true
                        self.lblLocation.text = list.aaddress
                    }else{
                        self.arrGetHosted.removeAll()
                        self.NoresultView.isHidden = false
                    }
                    self.cvLinkSearch.setContentOffset(.zero, animated: true)
                    self.cvLinkSearch.reloadData()
                } else {
                    self.view.makeToast(result.data?.getHostSuggested?.errorMessage)
                }
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
                break
            }
            self.cvLinkSearch?.isSkeletonable = false
            self.cvLinkSearch?.hideSkeleton()
        }
    }
    
    func UpdateWhishlistCall(listId: Int, status: Bool) {
        
    }

    func searchLinkAPICall(address: String) {
        if Utility.shared.searchAddressfromAffiliateSearch == ""{
            self.lblLocation.text = "\(Utility.shared.getLanguage()?.value(forKey:"TypeCityNameHere") ?? "Type City Name Here")"
            self.lblLocation.textColor =  .lightGray
        }else{
            self.lblLocation.text = Utility.shared.searchAddressfromAffiliateSearch
            self.lblLocation.textColor =  UIColor(named: "Title_Header")
        }
     //   self.affiliateSearchLinkListAPICall(address: address, filter: selectedFilter.rawValue)
    }
    
    //MARK: - collectionSkeletonView

    func numSections(in collectionSkeletonView: UICollectionView) -> Int  {
        return 1
    }
   func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "YouMayLikeCVC"
    }

    func collectionSkeletonView(_ skeletonView: UICollectionView, skeletonCellForItemAt indexPath: IndexPath) -> UICollectionViewCell?
    {
        print(skeletonView)
        let cell = skeletonView.dequeueReusableCell(withReuseIdentifier: "YouMayLikeCVC", for: indexPath)as! YouMayLikeCVC
        
        return cell
        
    }
}
