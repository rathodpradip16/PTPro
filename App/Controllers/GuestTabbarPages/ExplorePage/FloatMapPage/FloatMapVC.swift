//
//  FloatMapVC.swift
//  App
//
//  Created by RADICAL START on 01/04/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit
import JJFloatingActionButton
import GoogleMaps
import GooglePlaces
import MaterialComponents
import Lottie

class FloatMapVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,CLLocationManagerDelegate,GMSMapViewDelegate,UIScrollViewDelegate, WhishlistPageVCProtocol{
   
    
        
    var homeImageArray = NSMutableArray()
    var homeTitleArray = NSMutableArray()
    var homePriceArray = NSMutableArray()
    var mosthomeImageArray = NSMutableArray()
    var mosthomeTitleArray = NSMutableArray()
    var mosthomePriceArray = NSMutableArray()
    var latArray = NSArray()
    var lonArray = NSArray()
    
    var locationManager = CLLocationManager()
    var locationDetailArray = NSMutableArray()
    var markerPriceLblArray = NSMutableArray()
    var highlightLabelArray = NSMutableArray()
    var markerImageArray = NSMutableArray()
    var imageArray = [#imageLiteral(resourceName: "maps_location"),#imageLiteral(resourceName: "fb_logo"),#imageLiteral(resourceName: "settings")]
    var markergms = GMSMarker()
    var layout = UICollectionViewFlowLayout()
    var lottieView: LottieAnimationView!
    var FloatSearchArray = [PTProAPI.SearchListingQuery.Data.SearchListing.Result]()
    var didscroll:Bool = false
    var currencyvalue_from_API_base = String()
    var currency_Dict = NSDictionary()
    @IBOutlet weak var FloatingMap: GMSMapView!
    @IBOutlet weak var settingImg: UIImageView!
    @IBOutlet weak var floatingFilterBtn: UIButton!
    @IBOutlet weak var mapBackview:UIImageView!
    var getsearchPriceArray : PTProAPI.GetDefaultSettingQuery.Data.GetSearchSettings.Results?
    var RoomsFilterArray = [PTProAPI.GetDefaultSettingQuery.Data.GetListingSettingsCommon.Result]()
    var indexforScroll = IndexPath()
    var markerArray = [GMSMarker]()
    var Latitude: Double = 0.0
    var longitude: Double = 0.0
    var wishlist_index: Int = -1
    var delegate: ExplorePageVC?
    @IBOutlet weak var filterBtnView: UIView!
    @IBOutlet weak var dotView: UIView!
    struct State {
        let name: String
        let long: CLLocationDegrees
        let lat: CLLocationDegrees
    }
    
    
    var markerDict: [String: GMSMarker] = [:]
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var mapCollection: UICollectionView!
    @IBOutlet weak var filterTitleLabel: UILabel!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var lineView: UIView!
    
    @IBOutlet weak var bottomViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture: )))
        bottomView.addGestureRecognizer(swipeRight)
           swipeRight.direction = .up
        
        self.view.backgroundColor = UIColor(named: "colorController")
        FloatingMap.backgroundColor = UIColor(named: "colorController")
       
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture: )))
           swipeDown.direction = .down
        bottomView.addGestureRecognizer(swipeDown)
        
        
        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleAboutYouProfileTap(sender:)))
//
//        bottomView.addGestureRecognizer(tapGesture)
        
        
        self.initialSetup()
        self.lottieAnimation()
        DispatchQueue.main.async {
            self.addMapFunctionality()
        }
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.bottomView.halfroundedCorners(corners: [.topLeft, .topRight], radius: 20.0)
    }
    @IBAction func onClickBackBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if( Utility.shared.TotalFilterCount > 0)
        {
            self.filterTitleLabel.text = "  \(Utility.shared.getLanguage()?.value(forKey:"filter") ?? "  Filter")  "
            dotView.isHidden = false
        }
        else
        {
            self.filterTitleLabel.text = "  \(Utility.shared.getLanguage()?.value(forKey:"filter") ?? "  Filter")  "
            dotView.isHidden = true
        }
    }
    
    
    @objc func handleAboutYouProfileTap(sender: UITapGestureRecognizer)
    {
        if(!mapCollection.isHidden) {
        UIView.animate(withDuration: 0.5, animations: { [self] () -> Void in
            bottomViewHeightConstraint.constant = 40
          
        }, completion: { [self]_ in
            mapCollection.isHidden = true
             self.view.layoutIfNeeded()
        })
        }
        else {
            view.layoutIfNeeded() // force any pending operations to finish

            UIView.animate(withDuration: 0.5, animations: { [self] () -> Void in
              
                
                bottomViewHeightConstraint.constant = 315.67
               mapCollection.isHidden = false
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {

        if let swipeGesture = gesture as? UISwipeGestureRecognizer {

            switch swipeGesture.direction {
           
            case .down:
               // view.layoutIfNeeded() // force any pending operations to finish

                UIView.animate(withDuration: 0.5, animations: { [self] () -> Void in
                    bottomViewHeightConstraint.constant = 40
                  
                }, completion: { [self]_ in
                    mapCollection.isHidden = true
                     self.view.layoutIfNeeded()
                })
                print("Swiped down")
          
            case .up:
                view.layoutIfNeeded() // force any pending operations to finish

                UIView.animate(withDuration: 0.5, animations: { [self] () -> Void in
                  
                    
                    bottomViewHeightConstraint.constant = 315.67
                   mapCollection.isHidden = false
                    self.view.layoutIfNeeded()
                })
                print("Swiped up")
            default:
                break
            }
        }
    }
    
    
    func lottieAnimation() {
        lottieView = LottieAnimationView.init(name:"animation")
        lottieView.isHidden = false
        self.lottieView.frame = CGRect(x:FULLWIDTH/2-40, y:FULLHEIGHT/2-150, width:100, height:100)
        self.FloatingMap.addSubview(self.lottieView)
        self.lottieView.backgroundColor = UIColor.clear
        self.lottieView.layer.cornerRadius = 6.0
        self.lottieView.clipsToBounds = true
        self.lottieView.play()
    }
    
    func initialSetup(){
        
        self.bottomView.backgroundColor = UIColor(named: "colorController")
        
        mapCollection.collectionViewLayout = layout
        mapCollection.showsHorizontalScrollIndicator = false
        filterBtnView.backgroundColor = Theme.PRIMARY_COLOR
        filterBtnView.layer.cornerRadius = filterBtnView.frame.size.height/2
        filterBtnView.clipsToBounds = true
        
        dotView.backgroundColor = .white
        dotView.layer.cornerRadius = dotView.frame.size.height/2
        dotView.clipsToBounds = true
        
//        let longGesture = UITapGestureRecognizer(target: self, action: #selector(mapTaphideView))
//        longGesture.cancelsTouchesInView = false
//        FloatingMap.addGestureRecognizer(longGesture)
        
        layout.scrollDirection = .horizontal
        mapCollection.decelerationRate = UIScrollView.DecelerationRate.fast
        mapCollection.dataSource = self
        mapCollection.delegate = self
        mapCollection.backgroundColor = UIColor.clear
        
        
        mapCollection.register(UINib(nibName: "customUpdatedCell", bundle: nil), forCellWithReuseIdentifier: "CellcustomUpdated")
        let layoutRecommended = UICollectionViewFlowLayout()
        layoutRecommended.scrollDirection = .horizontal
        layoutRecommended.minimumLineSpacing = 25
        layoutRecommended.minimumInteritemSpacing = 25
        
        self.mapCollection.collectionViewLayout = layoutRecommended
        self.mapCollection.reloadData()
        
        if( Utility.shared.TotalFilterCount > 0)
        {
            self.filterTitleLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"filter") ?? "Filter")"
            dotView.isHidden = false
        }
        else
        {
            self.filterTitleLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"filter") ?? "Filter")"
            dotView.isHidden = true
        }
        floatingFilterBtn.addTarget(self, action: #selector(floatingBtnTapped), for: .touchUpInside)
        floatingFilterBtn.backgroundColor = UIColor.clear
        
        self.mapCollection.reloadData()
        
        self.backBtn.setImage(UIImage(named: "left_arrow"), for: .normal)
        self.backBtn.setTitle("", for: .normal)
        self.backBtn.backgroundColor = Theme.ButtonBack_BG
        self.backBtn.layer.cornerRadius = self.backBtn.frame.size.height/2
        self.backBtn.clipsToBounds = true
        self.backBtn.elevationEffect()
        
        if(Utility.shared.isRTLLanguage()){
            backBtn.rotateImageViewofBtn()
        }
        
        
        self.filterTitleLabel.textColor = UIColor.white
        self.filterTitleLabel.font = UIFont(name: APP_FONT, size: 14.0)
        
        self.floatingFilterBtn.setTitle("", for: .normal)
        
        self.filterBtnView.elevationEffect()
        
        self.lineView.backgroundColor = Theme.mapview_BG
        self.lineView.layer.cornerRadius = self.lineView.frame.size.height/2
        self.lineView.clipsToBounds = true
    }
    
    @objc func mapTaphideView()
    {
        
        
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .default
        }
    }
    @objc func floatingBtnTapped()
    {
        let filterObj = MoreFilterVC()
        filterObj.getsearchPriceArray = getsearchPriceArray
        filterObj.RoomsFilterArray = RoomsFilterArray
        filterObj.delegate = self.delegate
        Utility.shared.isfromfloatmap_Page = true
        filterObj.modalPresentationStyle = .fullScreen
        self.present(filterObj, animated: true, completion: nil)
    }
    
    func addMapFunctionality()
    {
        var selectedIndex : Int = 0
        
        
        for state in FloatSearchArray {
            let state_marker = GMSMarker()
            if(state.lat != nil && state.lng != nil){
                state_marker.position = CLLocationCoordinate2D(latitude: state.lat!, longitude: state.lng!)
            }
            var price = String()
            var currency = String()
            if(Utility.shared.getPreferredCurrency() != nil && Utility.shared.getPreferredCurrency() != "")
            {
                let currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!)
                let from_currency = state.listingData?.currency!
                let currency_amount = state.listingData?.basePrice != nil ? state.listingData?.basePrice! : 0
                let price_value = Utility.shared.getCurrencyRate(basecurrency:currencyvalue_from_API_base, fromCurrency:from_currency!, toCurrency:Utility.shared.getPreferredCurrency()!, CurrencyRate: self.currency_Dict, amount:currency_amount!)
                currency = "\(currencysymbol!)"
                //                let price = "\(String(format: "%.2f",price_value))"
                let restricted_price =  Double(String(format: "%.2f",price_value))
                price = (restricted_price!.clean)
                
            }
            else
            {
                let currencysymbol = Utility.shared.getSymbol(forCurrencyCode:self.currencyvalue_from_API_base)
                let from_currency = state.listingData?.currency!
                let currency_amount = state.listingData?.basePrice != nil ? state.listingData?.basePrice! : 0
                let price_value = Utility.shared.getCurrencyRate(basecurrency:currencyvalue_from_API_base, fromCurrency:from_currency!, toCurrency:currencyvalue_from_API_base, CurrencyRate: self.currency_Dict, amount:currency_amount!)
                
                currency = "\(currencysymbol!)"
                let restricted_price =  Double(String(format: "%.2f",price_value))
                price = (restricted_price!.clean)
            }
            
            markerDict["\(String(describing: currency))\(String(describing: price))"] = state_marker
            state_marker.userData = selectedIndex
            let customImage = #imageLiteral(resourceName: "price_tag")
            
            let nameLbl = UILabel()
            homeTitleArray.add(state.title!)
            nameLbl.textAlignment = .center
            nameLbl.textColor = Theme.TextDarkColor
            nameLbl.text = "\(String(describing: currency))\(String(describing: price))"
            let width = nameLbl.intrinsicContentSize.width+25
            nameLbl.frame = CGRect(x: 0, y: 21, width: (width <= 100) ? 120  : nameLbl.intrinsicContentSize.width+25, height: 20)
            nameLbl.textAlignment = .center
            
            nameLbl.backgroundColor = UIColor.clear
            
            
            let markerImage = UIImageView()
            markerImage.frame = CGRect(x: 0, y: 0, width: (width <= 100) ? 120  : nameLbl.intrinsicContentSize.width+25, height: 70)
            markerImage.image = customImage
            
            let customView = UIView()
           
            customView.frame = CGRect(x: 0, y: 0, width: (width <= 100) ? 120  : nameLbl.intrinsicContentSize.width+25, height: 70)
            customView.backgroundColor = UIColor.clear
            customView.addSubview(markerImage)
            customView.addSubview(nameLbl)
            state_marker.iconView = customView
            
            markerPriceLblArray.add(nameLbl as UILabel)
            markerImageArray.add(markerImage as UIImageView)
            markerArray.append(state_marker as GMSMarker)
                        
            Latitude = state.lat!
            longitude = state.lng!
            
            if Utility.shared.getAppTheme() == "dark" {
            
                do {
                      // Set the map style by passing the URL of the local file.
                   
                      if let styleURL = Bundle.main.url(forResource:"mapstyle", withExtension:"json") {
                        FloatingMap.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
                      } else {
                        NSLog("Unable to find style.json")
                      }
                    } catch {
                      NSLog("One or more of the map styles failed to load. \(error)")
                    }
                
            }
            else if Utility.shared.getAppTheme() == nil || Utility.shared.getAppTheme() == "auto"{
                if #available(iOS 13.0, *) {
                    if UITraitCollection.current.userInterfaceStyle == .dark {
                        do {
                              // Set the map style by passing the URL of the local file.
                              if let styleURL = Bundle.main.url(forResource:"mapstyle", withExtension:"json") {
                                  FloatingMap.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
                              } else {
                                NSLog("Unable to find style.json")
                              }
                            } catch {
                              NSLog("One or more of the map styles failed to load. \(error)")
                            }
                    } else {
                        
                    }
                } else {
                   
                }
            }
            
            state_marker.map = FloatingMap
            state_marker.zIndex = Int32(0.1)
            selectedIndex += 1
            if(state.lat != nil && state.lng != nil){
                let camera = GMSCameraPosition.camera(withLatitude: state.lat!, longitude: state.lng!, zoom:18.0)
                
                self.FloatingMap.animate(to: camera)
            }
            
        }
        self.mapCollection.reloadData()
        self.lottieView.isHidden = true
        
    }
    
    //MARK:********************************************** COLLECTIONVIEW DELEGATE & DATASOURCE ******************************************************************>
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let visibleRect = CGRect(origin: mapCollection.contentOffset, size: mapCollection.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        guard let visibleIndexpath = mapCollection.indexPathForItem(at: visiblePoint) else{
            return
        }
        indexforScroll = visibleIndexpath
        mapCollection.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(FloatSearchArray.count > 0)
        {
            return FloatSearchArray.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellcustomUpdated", for: indexPath)as! customUpdatedCell
        cell.leftConstant.constant = 0
        cell.heartBtnTrailing.constant = 12
        cell.heightConstant.constant = 170
        cell.imgTop.constant = 10
        cell.heartTop.constant = 22
        cell.thunderTop.constant = 19.5
        
        
        if Utility.shared.isRTLLanguage(){
            cell.thunderTop.constant = 17.5
        }
        else {
            cell.thunderTop.constant = 19.5
        }
        
        var listTypeString = ""
        listTypeString = "\(self.FloatSearchArray[indexPath.row].roomType ?? "")"
        if ((self.FloatSearchArray[indexPath.row].beds ?? 0) > 1){
            listTypeString = listTypeString + " / " + "\(self.FloatSearchArray[indexPath.row].beds ?? 0)" + " Beds"
        }else if ((self.FloatSearchArray[indexPath.row].beds ?? 0) == 1){
            listTypeString = listTypeString + " / " + "\(self.FloatSearchArray[indexPath.row].beds ?? 0)" + " Bed"
        }
        cell.listTypeLabel.text = listTypeString
        cell.listTypeLabel.textColor = UIColor(named: "searchPlaces_TextColor")
        
        if let image = FloatSearchArray[indexPath.row].listPhotoName {
            cell.imageView.sd_setImage(with: URL(string: "\(IMAGE_LISTING_MEDIUM)\(image)"), placeholderImage: #imageLiteral(resourceName: "placeholderimg"))
            cell.imageView.contentMode = .scaleAspectFill
        }else{
            cell.imageView.image = #imageLiteral(resourceName: "placeholderimg")
        }
        
        
        cell.listTitleLabel.text = self.FloatSearchArray[indexPath.row].title ?? ""
        
        cell.lightningImageView.isHidden = self.FloatSearchArray[indexPath.row].bookingType != "instant"
        
    
                if(self.FloatSearchArray[indexPath.row].wishListStatus == false){
                    cell.heartBtn.setImage(#imageLiteral(resourceName: "Heart"), for: .normal)
                }else{
                    cell.heartBtn.setImage(#imageLiteral(resourceName: "like"), for: .normal)
                }
                cell.heartBtn.isHidden = false
                cell.heartBtn.tag = indexPath.row
                cell.heartBtn.addTarget(self, action: #selector(likeBtnTapped), for: .touchUpInside)
            
        
        if(Utility.shared.getPreferredCurrency() != nil && Utility.shared.getPreferredCurrency() != "")
        {
            
            
            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!)
            let from_currency = self.FloatSearchArray[indexPath.row].listingData?.currency
            let currency_amount = self.FloatSearchArray[indexPath.row].listingData?.basePrice != nil ? self.FloatSearchArray[indexPath.row].listingData?.basePrice : 0
            let price_value = Utility.shared.getCurrencyRate(basecurrency:currencyvalue_from_API_base, fromCurrency:from_currency!, toCurrency:Utility.shared.getPreferredCurrency()!, CurrencyRate: self.currency_Dict, amount:currency_amount!)
            
            let restricted_price =  Double(String(format: "%.2f",price_value))
            cell.listPriceLabel.text =  "\(currencysymbol!)\(restricted_price!.clean) / \(Utility.shared.getLanguage()?.value(forKey:"night") ?? "Night")"
            let attributes = [
                NSAttributedString.Key.font: UIFont(name: APP_FONT_SEMIBOLD, size: 18),
                NSAttributedString.Key.foregroundColor: UIColor(named: "viewList_Title")
            ]
                
            let attributedString = NSMutableAttributedString(string: "\(currencysymbol!)\(restricted_price!.clean)" , attributes: attributes as [NSAttributedString.Key : Any])
            let attributes2 = [
                NSAttributedString.Key.font: UIFont(name: APP_FONT_MEDIUM, size: 12),
                NSAttributedString.Key.foregroundColor: UIColor(named: "viewList_Title")
            ]
            let attributedString2 = NSMutableAttributedString(string: "/ \(Utility.shared.getLanguage()?.value(forKey:"night") ?? "Night")", attributes: attributes2 as [NSAttributedString.Key : Any])
            
            attributedString.append(attributedString2)
            
            cell.listPriceLabel.attributedText = attributedString
        }
        else
        {
            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode:self.currencyvalue_from_API_base)
            let from_currency = self.FloatSearchArray[indexPath.row].listingData?.currency
            let currency_amount = self.FloatSearchArray[indexPath.row].listingData?.basePrice != nil ? self.FloatSearchArray[indexPath.row].listingData?.basePrice! : 0
            let price_value = Utility.shared.getCurrencyRate(basecurrency:currencyvalue_from_API_base, fromCurrency:from_currency!, toCurrency:currencyvalue_from_API_base, CurrencyRate: self.currency_Dict, amount:currency_amount!)
            
            let restricted_price =  Double(String(format: "%.2f",price_value))
            cell.listPriceLabel.text = "\(currencysymbol!)\(restricted_price!.clean) / \(Utility.shared.getLanguage()?.value(forKey:"night") ?? "Night")"
            let attributes = [
                NSAttributedString.Key.font: UIFont(name: APP_FONT_SEMIBOLD, size: 18),
                NSAttributedString.Key.foregroundColor: UIColor(named: "viewList_Title")
            ]
                
            let attributedString = NSMutableAttributedString(string: "\(currencysymbol!)\(restricted_price!.clean)" , attributes: attributes as [NSAttributedString.Key : Any])
            let attributes2 = [
                NSAttributedString.Key.font: UIFont(name: APP_FONT_MEDIUM, size: 12),
                NSAttributedString.Key.foregroundColor: UIColor(named: "viewList_Title")
            ]
            let attributedString2 = NSMutableAttributedString(string: "/ \(Utility.shared.getLanguage()?.value(forKey:"night") ?? "Night")", attributes: attributes2 as [NSAttributedString.Key : Any])
            
            attributedString.append(attributedString2)
            
            cell.listPriceLabel.attributedText = attributedString
        }
        
        let value1 = Float(FloatSearchArray[indexPath.row].reviewsCount ?? 0)
        let value2 = Float(FloatSearchArray[indexPath.row].reviewsStarRating ?? 0)
        if(value2 != 0.0){
            let divideValue = value2/value1
            cell.ratingLabel.text = "\(Int(divideValue.rounded()))"
            cell.ratingView.isHidden = false
            
        }else{
            cell.ratingLabel.text = "0.0"
            cell.ratingView.isHidden = true
        }
            
            if (indexforScroll.isEmpty){
                if let backgroundindex = collectionView.indexPathsForVisibleItems.first{
                    if indexPath.row == backgroundindex.row{
                        cell.lineView.isHidden = false
                    }else{
                        cell.lineView.isHidden = true
                        
                    }
                }
            }else {
                if indexPath.row == indexforScroll.row{
                    cell.lineView.isHidden = false
                }else{
                    cell.lineView.isHidden = true
                }
            }
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:FULLWIDTH/2+40, height:collectionView.frame.size.height - 20)
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if(FloatSearchArray[indexPath.row].id != nil) {
            let viewListing = UpdatedViewListing()
            viewListing.listID = FloatSearchArray[indexPath.row].id ?? 0
            Utility.shared.unpublish_preview_check = false
            viewListing.modalPresentationStyle = .fullScreen
            self.present(viewListing, animated: true, completion: nil)
        }
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        var latArr: Double = 0
        var lonArr: Double = 0
        
        
        if  FloatSearchArray.count > indexPath.row {
            if FloatSearchArray.count == 1{
                latArr = FloatSearchArray[indexPath.row].lat!
                lonArr = FloatSearchArray[indexPath.row].lng!
                for i in 0 ..< FloatSearchArray.count{
                    let dummyMarkerImage  = markerImageArray.object(at: i) as! UIImageView
                    let dummyPriceLbl = markerPriceLblArray.object(at: i) as! UILabel
                    let marker = markerArray[i] as! GMSMarker

                    var markImage =  #imageLiteral(resourceName: "price_tag")
                    dummyPriceLbl.font = UIFont(name: APP_FONT_MEDIUM, size: 12.0)
                    dummyPriceLbl.textColor = Theme.TextDarkColor

                    marker.zIndex = Int32(0.5)
                    if i == indexPath.row
                    {
                        markImage = #imageLiteral(resourceName: "price_tag_color")
                        dummyPriceLbl.textColor = UIColor.white
                        marker.zIndex = 1
                        
                        
                    }
                    dummyMarkerImage.image = markImage
                }
            }
            if indexforScroll.isEmpty{
                if let mapindex = collectionView.indexPathsForVisibleItems.max(){
                    latArr = FloatSearchArray[mapindex.row].lat!
                    lonArr = FloatSearchArray[mapindex.row].lng!
                    for i in 0..<self.FloatSearchArray.count
                    {
                        if(markerImageArray.count > 0 && markerPriceLblArray.count > 0)
                        {
                            
                            let dummyMarkerImage  = markerImageArray.object(at: i) as! UIImageView
                            let dummyPriceLbl = markerPriceLblArray.object(at: i) as! UILabel
                            let marker = markerArray[i] as! GMSMarker

                            var markImage = #imageLiteral(resourceName: "price_tag")
                            dummyPriceLbl.font = UIFont(name: APP_FONT_MEDIUM, size: 12.0)
                            dummyPriceLbl.textColor = Theme.TextDarkColor

                            marker.zIndex = Int32(0.5)
                            if i == mapindex.row
                            {
                                markImage = #imageLiteral(resourceName: "price_tag_color")
                                dummyPriceLbl.textColor = UIColor.white
                                marker.zIndex = 1
                            }
                            dummyMarkerImage.image = markImage
                            
                        }
                        
                    }
                }
                
            }else{
                latArr = FloatSearchArray[indexforScroll.row].lat!
                lonArr = FloatSearchArray[indexforScroll.row].lng!
                for i in 0..<self.FloatSearchArray.count
                {
                    if(markerImageArray.count > 0 && markerPriceLblArray.count > 0)
                    {
                        let dummyMarkerImage  = markerImageArray.object(at: i) as! UIImageView
                        let dummyPriceLbl = markerPriceLblArray.object(at: i) as! UILabel
                        let marker = markerArray[i] as! GMSMarker
                        var markImage =  #imageLiteral(resourceName: "price_tag")
                        dummyPriceLbl.font = UIFont(name: APP_FONT_MEDIUM, size: 12.0)
                        dummyPriceLbl.textColor = Theme.TextDarkColor
                        marker.zIndex = Int32(0.2)
                        if i == indexforScroll.row
                        {
                            markImage = #imageLiteral(resourceName: "price_tag_color")
                            dummyPriceLbl.textColor = UIColor.white
                            marker.zIndex = 1
                            
                        }
                        dummyMarkerImage.image = markImage
                    }
                }
            }
            
            let camera = GMSCameraPosition.camera(withLatitude:latArr as CLLocationDegrees, longitude:lonArr as CLLocationDegrees, zoom:18.0)
            self.FloatingMap.animate(to: camera)
            
        }
        
        
    }
    
    //MARK:************************************************* MAPVIEW DELEGATE & DATASOURCE METHODS *******************************************>
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        var point = mapView.projection.point(for: marker.position)
        point.y = point.y - 150
        let markerIndex :Int = marker.userData as! Int
        let count = self.FloatSearchArray.count
        for i in 0..<count
        {
            let dummyMarkerImage  = markerImageArray.object(at: i) as! UIImageView
            let dummyPriceLbl = markerPriceLblArray.object(at: i) as! UILabel
            let dummymarker = markerArray[i] as GMSMarker
            dummyPriceLbl.font = UIFont(name: APP_FONT_MEDIUM, size: 12.0)
            dummyPriceLbl.textColor = Theme.TextDarkColor
            
            var customImage = #imageLiteral(resourceName: "price_tag")
            dummymarker.zIndex = Int32(0.2)
            if i == markerIndex
            {
                customImage = #imageLiteral(resourceName: "price_tag_color")
                dummyPriceLbl.textColor = UIColor.white
                dummymarker.zIndex = Int32(1)
            }
            dummyMarkerImage.image = customImage
        }
        let camera = GMSCameraUpdate.setTarget(mapView.projection.coordinate(for: point))
        FloatingMap.animate(with: camera)
        FloatingMap.selectedMarker = marker
        
        self.mapCollection.scrollToItem(at: IndexPath(item: markerIndex, section: 0), at: .centeredHorizontally, animated: false)
        return true
    }
    @objc func likeBtnTapped(_ sender: UIButton!)
    {
        if Utility.shared.isConnectedToNetwork(){
            if((Utility.shared.getCurrentUserToken()) == nil || (Utility.shared.getCurrentUserToken()) == "")
            {
                let welcomeObj = WelcomePageVC()
                welcomeObj.modalPresentationStyle = .fullScreen
                self.present(welcomeObj, animated:false, completion: nil)
            }
            else
            {
                if ((self.FloatSearchArray.count) > 0) {
                    wishlist_index = sender.tag
                    let headerView = WhishlistPageVC()
                    headerView.listID = self.FloatSearchArray[sender.tag].id ?? 0
                    headerView.listimage = self.FloatSearchArray[sender.tag].listPhotoName ?? "-"
                    headerView.senderID = sender.tag
                    headerView.delegate = self
                    headerView.modalPresentationStyle = .overFullScreen
                    self.present(headerView, animated: false, completion: nil)
                }
            }
        }else{
           
        }
    }

    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        //Write your code here...

//        if(!mapCollection.isHidden) {
//        UIView.animate(withDuration: 0.5, animations: { [self] () -> Void in
//            bottomViewHeightConstraint.constant = 40
//
//        }, completion: { [self]_ in
//            mapCollection.isHidden = true
//             self.view.layoutIfNeeded()
//        })
//        }
//        else {
//            view.layoutIfNeeded() // force any pending operations to finish
//
//            UIView.animate(withDuration: 0.5, animations: { [self] () -> Void in
//
//
//                bottomViewHeightConstraint.constant = 315.67
//               mapCollection.isHidden = false
//                self.view.layoutIfNeeded()
//            })
//        }
//
    }
    //MARK***************************************************** CURRENCY CONVERSION FUNCTION *******************************************************************>
    func APIMethodCall(listId:Int, status:Bool) {
        
    }
    
    func didupdateWhishlistStatus(status: Bool) {
        let indexPath = IndexPath(row: wishlist_index, section: 0)
       
       //     self.FloatSearchArray[wishlist_index].wishListStatus = status
     
        mapCollection.reloadItems(at:[indexPath])
    }
    
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if #available(iOS 13.0, *) {
            if self.traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
                if traitCollection.userInterfaceStyle == .dark {
                    do {
                          // Set the map style by passing the URL of the local file.
                          if let styleURL = Bundle.main.url(forResource: "mapstyle", withExtension: "json") {
                              FloatingMap.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
                          } else {
                            NSLog("Unable to find style.json")
                          }
                        } catch {
                          NSLog("One or more of the map styles failed to load. \(error)")
                        }
                }
                else {
                   
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

