//
//  ExplorePageVC.swift
//  App
//
//  Created by RADICAL START on 22/03/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialButtons
import Lottie
import Apollo
import Alamofire
import SwiftyJSON
import ISPageControl
import FirebaseCrashlytics
import SwiftMessages
import Shimmer
import SkeletonView
import FlexiblePageControl

class ExplorePageVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,AirbnbDatePickerDelegate,AirbnbOccupantFilterControllerDelegate,UIScrollViewDelegate,WhishlistPageVCProtocol, SkeletonCollectionViewDataSource, ListVCProtocol {
    
    func UpdateWhishlistCall(listId: Int, status: Bool) {
        self.lottieAnimation()
        if(isFilterEnable)
        {
            FilterArray.removeAll()
            PageIndex = 1
            collectionViewFilterPage?.prepareSkeleton(completion: { [self] done in
                self.collectionViewFilterPage?.isSkeletonable = true
                self.collectionViewFilterPage?.showAnimatedGradientSkeleton()
            })
            
            
            self.searchListingAPICall()
        }
        else
        {
            let whishlistQuery = PTProAPI.GetAllWishListGroupQuery(currentPage: .none)
            Network.shared.apollo_headerClient.fetch(query: whishlistQuery,cachePolicy:.fetchIgnoringCacheData){ [self]  response in
                switch response {
                case .success(let result):
                    guard (result.data?.getAllWishListGroup?.results) != nil else{
                        return
                    }
                    self.whishlistarray = ((result.data?.getAllWishListGroup?.results)!) as! [PTProAPI.GetAllWishListGroupQuery.Data.GetAllWishListGroup.Result]
                    if(self.whishlistarray.count>0)
                    {
                        if(mostListingArray.count > 0) {
                            for index in 0...mostListingArray.count - 1 {
                                if(mostListingArray[index].id == listId) {
                                    if(!mostListingArray[index].isListOwner!) {
                                        
                                        if(status != mostwishlist_Array[index] as! Bool) {
                                            for wishindex in 0...whishlistarray.count - 1 {
                                                if((whishlistarray[wishindex].wishListIds?.contains(listId))!)
                                                {
                                                    mostwishlist_Array[index] = 1
                                                    break
                                                }
                                                
                                                else {
                                                    mostwishlist_Array[index] = 0
                                                }
                                            }
                                            let indexPath = IndexPath(row: index, section: 0)
                                            self.mostViewedCOllectionView.reloadItems(at: [indexPath])
                                        }
                                        else {
                                            
                                        }
                                        
                                    }
                                }
                            }
                        }
                        
                        
                        if(recommendListingArray.count > 0) {
                            
                            for index in 0...recommendListingArray.count - 1 {
                                if(recommendListingArray[index].id == listId) {
                                    if(!recommendListingArray[index].isListOwner!) {
                                        for wishindex in 0...whishlistarray.count - 1 {
                                            if((whishlistarray[wishindex].wishListIds?.contains(listId))!)
                                            {
                                                wishlistArray[index] = 1
                                                break
                                            }
                                            
                                            else {
                                                wishlistArray[index] = 0
                                            }
                                        }
                                        
                                        let indexPath = IndexPath(row: index, section: 0)
                                        self.recommendedCollectionView.reloadItems(at: [indexPath])
                                        
                                    }
                                }
                                else {
                                    
                                }
                            }
                        }
                    }
                case .failure(let error):
                    self.view.makeToast(error.localizedDescription)
                }
            }
        }
        // self.MostViewedListingAPICall()
        
        self.scrollToBottom()
    }
    
   
    
    
    func didupdateWhishlistStatus(status: Bool) {
        
    }
    
    //MARK:*********************************** IBOUTLET CONNECTIONS **************************************>
    
    @IBOutlet weak var contentWholeView: UIView!
    @IBOutlet var exploreTV: UITableView!
    
    @IBOutlet var headerView: UIView!
    @IBOutlet weak var exploreTitleLabel: UILabel!
    
    @IBOutlet var parentView: UIView!
    
    @IBOutlet weak var searchViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var newFilterBtn: UIButton!
    var lottieView: LottieAnimationView!
    
    @IBOutlet weak var NoListingFoundImage: UIImageView!
    @IBOutlet weak var NoListingFoundTitle: UILabel!
    @IBOutlet weak var searchBackBtn: UIButton!
    @IBOutlet weak var NoresultView: UIView!
    @IBOutlet var filterView: UIView!
    @IBOutlet weak var filterViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet var searchBtn: UIButton!
    @IBOutlet var searchView: UIView!
    @IBOutlet weak var offlineView: UIView!
    @IBOutlet weak var NoViewNoresult: UILabel!
    @IBOutlet weak var noViewFirstText: UILabel!
    @IBOutlet weak var noViewSecondText: UILabel!
    @IBOutlet weak var NoViewthirdText: UILabel!
    @IBOutlet weak var retry_button: UIButton!
    @IBOutlet weak var error_label: UILabel!
    
    @IBOutlet var locationLabel: UILabel!
    
    @IBOutlet weak var collectionViewFilterPage: UICollectionView!
    
    var whishlistarray = [PTProAPI.GetAllWishListGroupQuery.Data.GetAllWishListGroup.Result]()
    
    @IBOutlet weak var scrollView: UIScrollView!
    var refreshControl = UIRefreshControl()
    var collectionRefreshControl = UIRefreshControl()
    @IBOutlet weak var popularListingTitle: UILabel!
    @IBOutlet weak var popularListTitleTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var popularCollectionHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var recommendedTitle: UILabel!
    @IBOutlet weak var recommendedTitleTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var recommendedCollectionView: UICollectionView!
    @IBOutlet weak var recommendedCollectionViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var recommendedCollectionHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var becomeAHostView: UIView!
    @IBOutlet weak var becomeAHostHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var becomeAHostTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var hostSamepleImageView: UIImageView!
    @IBOutlet weak var hostTransparentImageView: UIImageView!
    @IBOutlet weak var hostTitleLabel: UILabel!
    @IBOutlet weak var hostBtn: UIButton!
    @IBOutlet weak var hostTransparentBtn: UIButton!
    
    
    @IBOutlet weak var mostViewedTitle: UILabel!
    @IBOutlet weak var mostViewedTitleTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var mostViewedCOllectionView: UICollectionView!
    @IBOutlet weak var mostViewedCOllectionHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var mostViewedCollectionTopConstraint: NSLayoutConstraint!
    
    @IBOutlet var mostViewedPageControl: ISPageControl!
//    @IBOutlet var recommendedPageControl: ISPageControl!
    
    @IBOutlet weak var recommendedPageControl: FlexiblePageControl!
    @IBOutlet weak var floatingMapView: UIView!
    @IBOutlet weak var mapImgView: UIImageView!
    @IBOutlet weak var mapTitle: UILabel!
    @IBOutlet weak var floatingMapBtn: UIButton!
    var listID = Int()
    
     var PageIndex : Int = 1
    var recommendedTotalPage: Int = 1
    var mostViewedTotalPage: Int = 1
     var Pagecontrol:ISPageControl!
    
     //MARK:*********************************** GLOBAL VARIABLE DECLARATIONS **************************************>
    var entirehomeArray = NSMutableArray()
    var homeImageArray = NSMutableArray()
    var homeTitleArray = NSMutableArray()
    var homePriceArray = NSMutableArray()
    var reviewcount_Array = NSMutableArray()
    var reviewStart_ratingArray = NSMutableArray()
    var wishlistArray = NSMutableArray()
    var mosthomeImageArray = NSMutableArray()
    var mosthomeTitleArray = NSMutableArray()
    var mosthomePriceArray = NSMutableArray()
    var mostreviewcount_Array = NSMutableArray()
    var most_entirehomeArray = NSMutableArray()
    var mostreviewStart_ratingArray = NSMutableArray()
    var mostwishlist_Array = NSMutableArray()
    var filteredImageArray = NSMutableArray()
    var filteredTitleArray = NSMutableArray()
    var filteredPriceArray = NSMutableArray()
    var filtered_reviewcountArray = NSMutableArray()
    var filtered_reviewstartArray = NSMutableArray()
    var filtered_entirehomeArray = NSMutableArray()
    var filtered_whishlistArray = NSMutableArray()
    var bookingTypeArray = NSMutableArray()
    var mostbookingTypeArray = NSMutableArray()
     let dateBtn = UIButton()
    let guestBtn = UIButton()
    let filterBtn = UIButton()
    public var selectedStartDate: Date?
    public var selectedEndDate: Date?
    var FilterArray = [PTProAPI.SearchListingQuery.Data.SearchListing.Result]()
    var recommendListingArray = [PTProAPI.GetDefaultSettingQuery.Data.GetRecommend.Result]()
    var mostListingArray = [PTProAPI.GetDefaultSettingQuery.Data.GetMostViewedListing.Result]()
    var currencyvalue_from_API : PTProAPI.GetDefaultSettingQuery.Data.Currency.Result?
    var RoomsFilterArray = [PTProAPI.GetDefaultSettingQuery.Data.GetListingSettingsCommon.Result]()
    var getsearchPriceArray : PTProAPI.GetDefaultSettingQuery.Data.GetSearchSettings.Results?
    
    var populardestinationArray = [PTProAPI.GetPopularLocationsQuery.Data.GetPopularLocations.Result]()
    var currency_Dict = NSDictionary()
    var adultCount: Int = 1
    var childrenCount: Int = 0
    var infantCount: Int = 0
    var hasPet: Bool = false
    var isWhishlist: Bool = false
    var isFilterEnable:Bool = false
    var isAnimationCompleted:Bool = false
    var totalListcount:Int = 0
    var explorecollectionView: UICollectionView?
    
    var dateFormatter: DateFormatter {
        get {
            let f = DateFormatter()
            f.dateFormat = "MMM d"
            if(Utility.shared.getAppLanguageCode() != nil)
            {
                if(Utility.shared.isRTLLanguage()) {
                    f.locale = NSLocale(localeIdentifier:"en") as Locale
                }
                else {
                    f.locale = NSLocale(localeIdentifier:Utility.shared.getAppLanguageCode()!) as Locale
                }
            }
            return f
        }
    }
    var selectedstartDate_filter = String()
    var selectedEndDate_filter = String()
    var guest_filter = Int()
    var lastContentOffset: CGFloat = 0
    var apollo_headerClient:ApolloClient!
    var shimmeringView:FBShimmeringView!
    var _performingAnimation = false
    var _performingPopularAnimation = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        offlineView.backgroundColor =  UIColor(named: "Button_Grey_Color")
        self.collectionViewFilterPage.isHidden = true
        self.configureFilterCollectionView()
        self.checkApolloStatus()
        self.profileAPICall()
        
     
       
//       self.lottieAnimation()
        
        parentView.backgroundColor = UIColor(named: "colorController")
        self.view.backgroundColor = UIColor(named: "colorController")
         
        self.initialSetup()
        self.configFloatingBtn()
        self.floatingMapView.isHidden = true
        
        
        
        self.setUpdatedView()
        self.newFilterBtn.setImage(UIImage(named: "explore_filter"), for: .normal)
        // Do any additional setup after loading the view.
    }
    func profileAPICall()
{
    if Utility.shared.isConnectedToNetwork(){
        if(Utility.shared.getCurrentUserToken() != nil)
        {
            let profileQuery = PTProAPI.GetProfileQuery()
            Network.shared.apollo_headerClient.fetch(query:profileQuery,cachePolicy:.fetchIgnoringCacheData){ response in
                switch response {
                case .success(let result):
                    guard (result.data?.userAccount?.result) != nil else
                    {
                        print("Missing Data")
                        Utility.shared.setUserToken(userID: "")
                        return
                    }
                    
                    
                    Utility.shared.ProfileAPIArray = ((result.data?.userAccount?.result)!)
                    Utility.shared.userName  = "\(Utility.shared.ProfileAPIArray?.firstName != nil ? Utility.shared.ProfileAPIArray?.firstName! : "User")!"
                    
                    
                    if let profImage = Utility.shared.ProfileAPIArray?.picture{
                        Utility.shared.pickedimageString = "\(IMAGE_AVATAR_MEDIUM)\(profImage)"
                    }
                    else {
                        Utility.shared.pickedimageString = "avatar"
                    }
                    
                    
                    Utility.shared.setEmail(email:(result.data?.userAccount?.result?.email as AnyObject)as! NSString)
                case .failure(let error):
                    self.view.makeToast(error.localizedDescription)
                }
            }
        }
    }
}
    
    func setUpdatedView(){
        
        self.exploreTitleLabel.text = "\(Utility.shared.getLanguage()?.value(forKey: "Explore_Title") ?? "Explore the world! By Travelling")"
        self.exploreTitleLabel.numberOfLines = 0
        self.exploreTitleLabel.lineBreakMode = .byWordWrapping
        self.exploreTitleLabel.textColor =  UIColor(named: "Title_Header")
        self.exploreTitleLabel.font = UIFont(name: APP_FONT_SEMIBOLD, size: 24)
        self.exploreTitleLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        
        self.locationLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"losangeles") ?? "Where do you go?")"

        self.popularListingTitle.text = "\(Utility.shared.getLanguage()?.value(forKey: "populardest") ?? "Popular Locations")"
        self.popularListingTitle.textColor =  UIColor(named: "Title_Header")
        self.popularListingTitle.font = UIFont(name: APP_FONT_MEDIUM, size: 24)
        self.popularListingTitle.numberOfLines = 0
        self.popularListingTitle.lineBreakMode = .byWordWrapping
        
        self.popularCollectionView.delegate = self
        self.popularCollectionView.dataSource = self
       
        self.popularCollectionView.register(UINib(nibName: "popularcollectionCell", bundle: nil), forCellWithReuseIdentifier: "popularcollectionCell")
        self.popularCollectionView.showsHorizontalScrollIndicator = false
        
        self.popularCollectionView.reloadData()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        
        self.popularCollectionView.collectionViewLayout = layout
        
        
        self.recommendedTitle.text = "\(Utility.shared.getLanguage()?.value(forKey: "recommended") ?? "Recommended")"
        self.recommendedTitle.textColor =  UIColor(named: "Title_Header")
        self.recommendedTitle.font = UIFont(name: APP_FONT_MEDIUM, size: 24)
        self.recommendedTitle.numberOfLines = 0
        self.recommendedTitle.lineBreakMode = .byWordWrapping
        
        
        self.recommendedCollectionView.delegate = self
        self.recommendedCollectionView.dataSource = self
        self.recommendedCollectionView.register(UINib(nibName: "customUpdatedCell", bundle: nil), forCellWithReuseIdentifier: "CellcustomUpdated")
        self.recommendedCollectionView.showsHorizontalScrollIndicator = false
        
        let layoutRecommended = UICollectionViewFlowLayout()
        layoutRecommended.scrollDirection = .horizontal
        layoutRecommended.minimumLineSpacing = 10
        layoutRecommended.minimumInteritemSpacing = 0
        
        self.recommendedCollectionView.collectionViewLayout = layoutRecommended
        
        
        self.mostViewedTitle.text = "\(Utility.shared.getLanguage()?.value(forKey: "mostviewed") ?? "Most viewed")"
        self.mostViewedTitle.textColor =  UIColor(named: "Title_Header")
        self.mostViewedTitle.font = UIFont(name: APP_FONT_MEDIUM, size: 24)
        self.mostViewedTitle.numberOfLines = 0
        self.mostViewedTitle.lineBreakMode = .byWordWrapping
        
        
        self.mostViewedCOllectionView.delegate = self
        self.mostViewedCOllectionView.dataSource = self
        self.mostViewedCOllectionView.register(UINib(nibName: "customUpdatedCell", bundle: nil), forCellWithReuseIdentifier: "CellcustomUpdated")
        self.mostViewedCOllectionView.showsHorizontalScrollIndicator = false
        
        let layoutMostViewed = UICollectionViewFlowLayout()
        layoutMostViewed.scrollDirection = .vertical
        layoutMostViewed.minimumLineSpacing = 10
        layoutMostViewed.minimumInteritemSpacing = 0
        
        self.mostViewedCOllectionView.collectionViewLayout = layoutMostViewed
        
        
        if (Utility.shared.isRTLLanguage()){
            self.scrollView.semanticContentAttribute = .forceRightToLeft
            self.mostViewedCOllectionView.semanticContentAttribute = .forceRightToLeft
        }else{
            self.scrollView.semanticContentAttribute = .forceLeftToRight
            self.mostViewedCOllectionView.semanticContentAttribute = .forceLeftToRight
        }
        
        
        mostViewedCOllectionView?.prepareSkeleton(completion: { [self] done in
            self.mostViewedCOllectionView?.isSkeletonable = true
            self.mostViewedCOllectionView.showAnimatedGradientSkeleton()
        })
        
        recommendedCollectionView?.prepareSkeleton(completion: { [self] done in
            self.recommendedCollectionView?.isSkeletonable = true
            self.recommendedCollectionView.showAnimatedGradientSkeleton()
        })
        
        popularCollectionView?.prepareSkeleton(completion: { [self] done in
            self.popularCollectionView?.isSkeletonable = true
            self.popularCollectionView.showAnimatedGradientSkeleton()
        })
       
       
        
        
        self.configureBecomeAHostView()
        
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: #selector(refreshCalled), for: .valueChanged)
        self.scrollView.addSubview(refreshControl)
        self.popularAPICall()
        self.MostViewedListingAPICall()
    }
    
    @objc func refreshCalled()
    {
        self.popularAPICall()
        self.MostViewedListingAPICall()
        self.refreshControl.endRefreshing()
    }
    
    @objc func collectionViewRefreshControl(){
        self.PageIndex = 1
        self.FilterArray.removeAll()
        collectionViewFilterPage?.prepareSkeleton(completion: { [self] done in
            self.collectionViewFilterPage?.isSkeletonable = true
            self.collectionViewFilterPage?.showAnimatedGradientSkeleton()
        })
        self.collectionViewFilterPage.reloadData()
        self.searchListingAPICall()
        self.collectionRefreshControl.endRefreshing()
    }
    
    func configureBecomeAHostView(){
        self.becomeAHostView.layer.cornerRadius = 15
        self.becomeAHostView.clipsToBounds = true
        
        
        
        self.becomeAHostView.showAnimatedGradientSkeleton()
        
        let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .leftRight)
        let gradient = SkeletonGradient(baseColor: UIColor.lightGray)
        self.becomeAHostView.showAnimatedGradientSkeleton(usingGradient: gradient, animation: animation)
        
        self.hostSamepleImageView.layer.cornerRadius = 20
        self.hostSamepleImageView.clipsToBounds = true
        
        self.hostTransparentImageView.layer.cornerRadius = 20
        self.hostTransparentImageView.clipsToBounds = true
        
        self.hostTitleLabel.backgroundColor = .clear
        self.hostTitleLabel.textColor = UIColor.white
        self.hostTitleLabel.font = UIFont(name: APP_FONT_SEMIBOLD, size: 24.0)
        
        self.hostBtn.layer.cornerRadius = self.hostBtn.frame.size.height / 2
        self.hostBtn.clipsToBounds = true
        self.hostBtn.setTitleColor(UIColor.white, for: .normal)
        self.hostBtn.backgroundColor = Theme.Button_BG
        self.hostBtn.titleLabel?.font = UIFont(name: APP_FONT_SEMIBOLD, size: 16.0)
        self.hostTransparentBtn.setTitle("", for: .normal)
        self.hostBtn.addTarget(self, action: #selector(onClickBecomeAHostBtn), for: .touchUpInside)
    }
    
    @objc func onClickBecomeAHostBtn(sender: UIButton){
        
        if((Utility.shared.getCurrentUserToken()) == nil || (Utility.shared.getCurrentUserToken()) == "")
        {
            let welcomeObj = WelcomePageVC()
             welcomeObj.modalPresentationStyle = .fullScreen
            self.present(welcomeObj, animated:false, completion: nil)
        }else{
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            Utility.shared.isfromGuestProfile = true
            
           
            Utility.shared.host_message_isfrommessage = true
            Utility.shared.host_message_isfromHost = true
            
            let SplashObj = SwitchTravelAndHostVC()
                
                if Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification || Utility.shared.isfromBackroundBooking || Utility.shared.isfromOfflineBooking{
                    Utility.shared.isfromHost = true
                    Utility.shared.isfromNotificationHost = false
                    Utility.shared.isfromOfflineNotification = false
                    Utility.shared.isfromBackroundBooking = false
                    Utility.shared.isfromOfflineBooking = false
                    Utility.shared.isfromGuestProfile = false
                }else{
                    Utility.shared.isfromHost = false
                }
                   SplashObj.modalPresentationStyle = .fullScreen
                self.present(SplashObj, animated: false) {
                }        }

           
           
        
        }
    func configureFilterCollectionView(){
        self.collectionViewFilterPage.delegate = self
        self.collectionViewFilterPage.dataSource = self
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        self.collectionViewFilterPage.collectionViewLayout = layout
        self.collectionRefreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.collectionRefreshControl.addTarget(self, action: #selector(collectionViewRefreshControl), for: .valueChanged)
        self.collectionViewFilterPage.addSubview(collectionRefreshControl)
        self.collectionViewFilterPage.register(UINib(nibName: "UpdatedSearchCell", bundle: nil), forCellWithReuseIdentifier: "cellUpdatedSearch")
        
        self.collectionViewFilterPage.backgroundColor = UIColor(named: "colorController")
        
        collectionViewFilterPage?.prepareSkeleton(completion: { [self] done in
            self.collectionViewFilterPage?.isSkeletonable = true
            self.collectionViewFilterPage?.showAnimatedGradientSkeleton()
        })
    }
    func checkApolloStatus()
    {
        apollo_headerClient = Network.shared.apollo_headerClient
    }
    override func viewWillAppear(_ animated: Bool) {
        self.mostViewedCOllectionView.hideSkeleton()
        self.recommendedCollectionView.hideSkeleton()
        self.popularCollectionView.hideSkeleton()
        self.collectionViewFilterPage.hideSkeleton()
        self.mostViewedCOllectionView.isSkeletonable = false
        self.recommendedCollectionView.isSkeletonable = false
        self.popularCollectionView.isSkeletonable = false
        self.collectionViewFilterPage.isSkeletonable = false
        
        
        self.checkForUpdate()
        
        self.locationLabel.textColor =  UIColor(named: "Title_Header")
        
        self.filterView.isHidden = true
        self.filterViewHeightConstraint.constant = self.filterView.isHidden ? 0 : 43
        newFilterBtn.backgroundColor =  UIColor(named: "colorController")
        if(Utility.shared.TotalFilterCount == 0){
        
            newFilterBtn.setImage(#imageLiteral(resourceName: "explore_filter"), for: .normal)
        }
        else {
            self.newFilterBtn.backgroundColor = Theme.PRIMARY_COLOR
            newFilterBtn.setImage(#imageLiteral(resourceName: "filterblue"), for: .normal)
        }
        self.newFilterBtn.layer.cornerRadius = 10
        self.newFilterBtn.clipsToBounds = true
    }
    
    
func checkForUpdate(){
    
    let currentVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    let appVersionUpdate = PTProAPI.GetApplicationVersionInfoQuery(appType: "iosVersion", version: currentVersion)    
    Network.shared.apollo_headerClient.fetch(query: appVersionUpdate){ response in
        switch response {
        case .success(let result):
            if result != nil{
                if (result.data?.getApplicationVersionInfo?.status == 400){
                    
                    let deleteObj = ForceUpdateViewController()
                    deleteObj.descriptionString = result.data?.getApplicationVersionInfo?.errorMessage ?? ""
                    deleteObj.appStoreURL = result.data?.getApplicationVersionInfo?.result?.appStoreUrl ?? ""
                    deleteObj.modalPresentationStyle = .overFullScreen
                    self.present(deleteObj, animated: false, completion: nil)
                    
                    //                    let alertController = UIAlertController(title: "RentALL", message: result.data?.getApplicationVersionInfo?.errorMessage, preferredStyle: .alert)
                    //                    alertController.addAction(UIAlertAction(title: "\(Utility.shared.getLanguage()?.value(forKey:"Update") ?? "Update")", style: .default, handler: { action in
                    //
                    
                    //
                    //                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    //                    appDelegate.window?.rootViewController?.present(alertController, animated: true, completion: nil)
                }
            }
        case .failure(let error):
            self.view.makeToast(error.localizedDescription)
        }
        
    }
}
    
    @IBAction func onClickFilterBtn(_ sender: UIButton) {
        let morefilterObj = MoreFilterVC()
        morefilterObj.RoomsFilterArray = RoomsFilterArray
        morefilterObj.delegate = self
        morefilterObj.getsearchPriceArray = getsearchPriceArray
        Utility.shared.isfromfloatmap_Page = false
        morefilterObj.modalPresentationStyle = .fullScreen
        self.present(morefilterObj, animated: true, completion: nil)
    }
    
    func APIMethodCall(listId:Int, status:Bool) {
        self.lottieAnimation()
        if(isFilterEnable)
        {
            FilterArray.removeAll()
            PageIndex = 1
            collectionViewFilterPage?.prepareSkeleton(completion: { [self] done in
                self.collectionViewFilterPage?.isSkeletonable = true
                self.collectionViewFilterPage?.showAnimatedGradientSkeleton()
            })
            self.searchListingAPICall()
        }
        else
        {
            let whishlistQuery = PTProAPI.GetAllWishListGroupQuery(currentPage: .none)
            Network.shared.apollo_headerClient.fetch(query: whishlistQuery,cachePolicy:.fetchIgnoringCacheData){ [self]  response in
                switch response {
                case .success(let result):
                    guard (result.data?.getAllWishListGroup?.results) != nil else{
                        
                        
                        return
                    }
                    self.whishlistarray = ((result.data?.getAllWishListGroup?.results)!) as! [PTProAPI.GetAllWishListGroupQuery.Data.GetAllWishListGroup.Result]
                    if(self.whishlistarray.count>0)
                    {
                        if(mostListingArray.count > 0) {
                            for index in 0...mostListingArray.count - 1 {
                                if(mostListingArray[index].id == listId) {
                                    if(!mostListingArray[index].isListOwner!) {
                                        
                                        if(status != mostwishlist_Array[index] as! Bool) {
                                            for wishindex in 0...whishlistarray.count - 1 {
                                                if((whishlistarray[wishindex].wishListIds?.contains(listId))!)
                                                {
                                                    mostwishlist_Array[index] = 1
                                                    break
                                                }
                                                
                                                else {
                                                    mostwishlist_Array[index] = 0
                                                }
                                            }
                                            let indexPath = IndexPath(row: index, section: 0)
                                            self.mostViewedCOllectionView.reloadItems(at: [indexPath])
                                        }
                                        else {
                                            
                                        }
                                        
                                    }
                                }
                            }
                        }
                        
                        
                        if(recommendListingArray.count > 0) {
                            
                            for index in 0...recommendListingArray.count - 1 {
                                if(recommendListingArray[index].id == listId) {
                                    if(!recommendListingArray[index].isListOwner!) {
                                        for wishindex in 0...whishlistarray.count - 1 {
                                            if((whishlistarray[wishindex].wishListIds?.contains(listId))!)
                                            {
                                                wishlistArray[index] = 1
                                                break
                                            }
                                            
                                            else {
                                                wishlistArray[index] = 0
                                            }
                                        }
                                        
                                        let indexPath = IndexPath(row: index, section: 0)
                                        self.recommendedCollectionView.reloadItems(at: [indexPath])
                                        
                                    }
                                }
                                else {
                                    
                                }
                            }
                        }
                    }
                case .failure(let error):
                    self.view.makeToast(error.localizedDescription)
                }
                
            }
        }
        // self.MostViewedListingAPICall()
        
        self.scrollToBottom()
    }
    
    //MARK:*********************************** METHODS & FUNCTIONS *****************************************>
    
    func lottieAnimation(){
        lottieView = LottieAnimationView.init(name:"animation")
        lottieView.isHidden = true
        self.lottieView.frame = CGRect(x:FULLWIDTH/2-40, y:FULLHEIGHT/2-50, width:100, height:100)
        self.view.addSubview(self.lottieView)
        self.lottieView.backgroundColor = UIColor.clear
        self.lottieView.layer.cornerRadius = 6.0
        self.lottieView.clipsToBounds = true
        self.lottieView.play()
        Timer.scheduledTimer(timeInterval:0.5, target: self, selector: #selector(autoscroll), userInfo: nil, repeats: true)
    }
    @objc func autoscroll()
    {
        self.lottieView.play()
    }
    func initialSetup()
    {
        //Top searchView layer design
        
        self.locationLabel.textColor =  UIColor(named: "Title_Header")
        headerView.backgroundColor = UIColor(named: "becomeAHostStep_Color")
       
        locationLabel.font = UIFont(name: APP_FONT, size: 14)
         
        NoViewNoresult.font = UIFont(name: APP_FONT_BOLD, size: 18)
        NoListingFoundTitle.font = UIFont(name: APP_FONT, size: 16)
        noViewSecondText.font = UIFont(name: APP_FONT, size: 14)
        NoViewthirdText.font = UIFont(name: APP_FONT, size: 14)
        noViewFirstText.font = UIFont(name: APP_FONT, size: 14)
        error_label.font = UIFont(name: APP_FONT_MEDIUM, size: 15)
        retry_button.titleLabel?.font = UIFont(name: APP_FONT, size: 15)
        self.offlineView.isHidden = true
        self.NoresultView.isHidden = true
        self.scrollView.isHidden = false
        searchView.backgroundColor =  UIColor(named: "colorController")
        searchBtn.addTarget(self, action: #selector(searchBtnTapped), for: .touchUpInside)
        
        
       
       
        dateBtn.frame = CGRect(x:20, y: 10, width: 90, height: 33)
        dateBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"dates")) ?? "Dates")", for: .normal)
        dateBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"dates")) ?? "Dates")", for: .selected)
        dateBtn.setTitleColor(Theme.TextDarkColor, for: .normal)
        dateBtn.setTitleColor(Theme.TextDarkColor, for: .selected)
        dateBtn.titleLabel?.font = UIFont(name: APP_FONT_MEDIUM, size: 14)
       // dateBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        dateBtn.layer.borderColor = Theme.TextBorderColor.cgColor
        dateBtn.layer.borderWidth = 1
        dateBtn.layer.cornerRadius = 5.0
        dateBtn.addTarget(self, action: #selector(showDatePicker), for: .touchUpInside)
        dateBtn.layer.masksToBounds = true
        
        
        guestBtn.frame = CGRect(x:(self.dateBtn.frame.origin.x+self.dateBtn.frame.size.width + 10), y: 10, width:110, height: 33)
        guestBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"guest")) ?? "")", for: .normal)
        guestBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"guest")) ?? "")", for: .selected)
        guestBtn.setTitleColor(Theme.TextDarkColor, for: .normal)
        guestBtn.setTitleColor(Theme.TextDarkColor, for: .selected)
        guestBtn.layer.borderColor = Theme.TextBorderColor.cgColor
        guestBtn.titleLabel?.font = UIFont(name: APP_FONT_MEDIUM, size: 14)
        guestBtn.layer.borderWidth = 1
        guestBtn.layer.cornerRadius = 5.0
        guestBtn.layer.masksToBounds = true
        guestBtn.addTarget(self, action: #selector(showOccupantFilter), for: .touchUpInside)
        filterView.addSubview(dateBtn)
        filterView.addSubview(guestBtn)
        
        filterBtn.frame = CGRect(x:220, y: 10, width: 70, height: 33)
        filterBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"filter")) ?? "")", for: .normal)
        filterBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"filter")) ?? "")", for: .selected)
        filterBtn.setTitleColor(Theme.TextDarkColor, for: .normal)
        filterBtn.setTitleColor(Theme.TextDarkColor, for: .selected)
        filterBtn.layer.borderColor = Theme.TextBorderColor.cgColor
        filterBtn.titleLabel?.font = UIFont(name: APP_FONT_MEDIUM, size: 14)
        filterBtn.layer.borderWidth = 1
        filterBtn.layer.cornerRadius = 5.0
        filterBtn.layer.masksToBounds = true
        filterBtn.addTarget(self, action: #selector(moreFilter), for: .touchUpInside)
        filterView.addSubview(filterBtn)
        filterBtn.isHidden = true
        
        if Utility.shared.isRTLLanguage(){
            dateBtn.frame = CGRect(x:FULLWIDTH - (20+90), y: 10, width:90, height: 33)
            guestBtn.frame = CGRect(x: (self.dateBtn.frame.origin.x-120), y: 10, width:110, height: 33)
            filterBtn.frame = CGRect(x:(self.guestBtn.frame.origin.x-80), y: 10, width: 70, height: 33)
        }else{
            dateBtn.frame = CGRect(x:20, y: 10, width:90, height: 33)
            guestBtn.frame = CGRect(x: (self.dateBtn.frame.origin.x+self.dateBtn.frame.size.width + 10), y: 10, width:110, height: 33)
            filterBtn.frame = CGRect(x:220, y: 10, width: 70, height: 33)
        }
        
        
        if(IS_IPHONE_XR || IS_IPHONE_X)
        {
        exploreTV.frame = CGRect(x: 0, y: headerView.frame.size.height+headerView.frame.origin.y+25, width: FULLWIDTH, height:FULLHEIGHT-400)
        }
        else if(IS_IPHONE_PLUS)
        {
        exploreTV.frame = CGRect(x: 0, y: headerView.frame.size.height+headerView.frame.origin.y+25, width: FULLWIDTH, height:FULLHEIGHT-230)
        }
        else if(IS_IPHONE_XS_MAX)
        {
        exploreTV.frame = CGRect(x: 0, y: headerView.frame.size.height+headerView.frame.origin.y+25, width: FULLWIDTH, height:FULLHEIGHT-400)
        }
        else if (IS_IPHONE_5)
        {
        exploreTV.frame = CGRect(x: 0, y: headerView.frame.size.height+headerView.frame.origin.y+25, width: FULLWIDTH+55, height:FULLHEIGHT-110)
        }
            
        else
        {
           exploreTV.frame = CGRect(x: 0, y: headerView.frame.size.height+headerView.frame.origin.y+25, width: FULLWIDTH, height:FULLHEIGHT-100)
        }
//        exploreTV.register(UINib(nibName: "ExploreCell", bundle: nil), forCellReuseIdentifier: "ExploreCell")
        explorecollectionView?.register(UINib(nibName: "ExploreCollectionFilterCell", bundle: nil), forCellWithReuseIdentifier: "ExploreCollectionFilterCell")
        explorecollectionView?.register(UINib(nibName: "popularcollectionCell", bundle: nil), forCellWithReuseIdentifier: "popularcollectionCell")
         explorecollectionView?.register(UINib(nibName: "ExploreCollectioncell", bundle: nil), forCellWithReuseIdentifier: "ExploreCollectioncell")
        
        self.explorecollectionView?.backgroundColor = UIColor(named: "colorController")
        
        popularCollectionView?.prepareSkeleton(completion: { done in
                    self.view.showAnimatedSkeleton()
                })
        popularCollectionView?.isSkeletonable = true
        
        
        mostViewedCOllectionView?.prepareSkeleton(completion: { done in
                    self.view.showAnimatedSkeleton()
                })
        mostViewedCOllectionView?.isSkeletonable = true

        recommendedCollectionView?.prepareSkeleton(completion: { done in
                    self.view.showAnimatedSkeleton()
                })
        recommendedCollectionView?.isSkeletonable = true

        

        
        NoViewNoresult.text = "\((Utility.shared.getLanguage()?.value(forKey:"noresults"))!)"
        NoViewNoresult.textColor = UIColor(named: "Title_Header")
        NoListingFoundTitle.text = "\((Utility.shared.getLanguage()?.value(forKey:"NoListingFound")) ?? "No listing found")"
        noViewFirstText.text = "\((Utility.shared.getLanguage()?.value(forKey:"tryadjustingsearch"))!)"
         noViewSecondText.text = "\((Utility.shared.getLanguage()?.value(forKey:"changefiltersdates"))!)"
         NoViewthirdText.text = "\((Utility.shared.getLanguage()?.value(forKey:"specificaddresscity"))!)"
        error_label.textColor =  UIColor(named: "Title_Header")
        retry_button.setTitleColor(Theme.PRIMARY_COLOR, for: .normal)
        
        error_label.text = "\((Utility.shared.getLanguage()?.value(forKey:"error_field"))!)"
        
        retry_button.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"retry"))!)", for:.normal)
    }
    @objc func moreFilter()
    {
        let morefilterObj = MoreFilterVC()
        morefilterObj.RoomsFilterArray = RoomsFilterArray
        morefilterObj.delegate = self
        morefilterObj.getsearchPriceArray = getsearchPriceArray
        Utility.shared.isfromfloatmap_Page = false
        morefilterObj.modalPresentationStyle = .fullScreen
        self.present(morefilterObj, animated: true, completion: nil)
        //self.navigationController?.pushViewController(loginObj, animated: true)
        
    }

    
    func numSections(in collectionSkeletonView: UICollectionView) -> Int  {
        return 1
    }
   func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        if (skeletonView == popularCollectionView){
            return "popularcollectionCell"
        }
        if(skeletonView == collectionViewFilterPage) {
            return "cellUpdatedSearch"
        }
        return "CellcustomUpdated"
    }

    func collectionSkeletonView(_ skeletonView: UICollectionView, skeletonCellForItemAt indexPath: IndexPath) -> UICollectionViewCell?
    {
        print(skeletonView)
        if (skeletonView == popularCollectionView){
            let cell = skeletonView.dequeueReusableCell(withReuseIdentifier: "popularcollectionCell", for: indexPath)as! popularcollectionCell
            cell.skeletonCornerRadius = 10
            return cell
        }
        else if (skeletonView == collectionViewFilterPage) {
            let cell = skeletonView.dequeueReusableCell(withReuseIdentifier: "cellUpdatedSearch", for: indexPath)as! UpdatedSearchCell
            
            return cell
            
        }
        
            let cell = skeletonView.dequeueReusableCell(withReuseIdentifier: "CellcustomUpdated", for: indexPath)as! customUpdatedCell

            return cell
        
    }
    
    
   
    
    
    //config floating chat new btn
    func configFloatingBtn()  {
        
        self.floatingMapView.backgroundColor = Theme.PRIMARY_COLOR
        self.floatingMapView.layer.cornerRadius = self.floatingMapView.frame.size.height/2
        self.floatingMapView.clipsToBounds = true
        let shadowSize2 : CGFloat = 3.0
        let shadowPath2 = UIBezierPath(roundedRect:floatingMapView.bounds, cornerRadius:self.floatingMapView.layer.cornerRadius)
        self.floatingMapView.layer.masksToBounds = false
        self.floatingMapView.layer.shadowColor = Theme.TextLightColor.cgColor
        self.floatingMapView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.floatingMapView.layer.shadowOpacity = 0.3
        self.floatingMapView.layer.shadowPath = shadowPath2.cgPath
        
        self.mapTitle.text = "Map"
        self.mapTitle.font = UIFont(name: APP_FONT, size: 14.0)
        self.mapTitle.textColor = UIColor.white
        
        self.floatingMapBtn.setTitle("", for: .normal)
        self.floatingMapBtn.setTitleColor(UIColor.clear, for: .normal)
        self.floatingMapBtn.backgroundColor = UIColor.clear
    }
    @IBAction func onClickFloatingBtn(_ sender: UIButton) {
        if(FilterArray.count > 0)
        {
            let mapFloatObj = FloatMapVC()
            mapFloatObj.delegate = self
            mapFloatObj.getsearchPriceArray = getsearchPriceArray
            mapFloatObj.RoomsFilterArray = RoomsFilterArray
            mapFloatObj.currencyvalue_from_API_base = Utility.shared.currencyvalue_from_API_base
            mapFloatObj.currency_Dict = Utility.shared.currency_Dict
            mapFloatObj.FloatSearchArray = FilterArray
            mapFloatObj.modalPresentationStyle = .fullScreen
            self.present(mapFloatObj, animated: true, completion: nil)
//            self.view.window?.rootViewController?.present(mapFloatObj, animated: true, completion: nil)
        }
    }
   
    @IBAction func searchBackBtnTapped(_ sender: Any) {
//        self.lottieAnimation()
        if(isFilterEnable) {
        self.locationLabel.textColor =  UIColor(named: "Title_Header")
        self.searchBackBtn.backgroundColor =  UIColor(named: "viewBG")
        Utility.shared.instantBook = ""
        Utility.shared.roomtypeArray.removeAllObjects()
        Utility.shared.amenitiesArray.removeAllObjects()
        Utility.shared.priceRangeArray.removeAllObjects()
        Utility.shared.facilitiesArray.removeAllObjects()
        Utility.shared.houseRulesArray.removeAllObjects()
        Utility.shared.beds_count = 0
        Utility.shared.bedrooms_count = 0
        Utility.shared.bathroom_count = 0
        Utility.shared.filterCount = 0
            Utility.shared.showGuestCount = false
            Utility.shared.showbedRoomCount = false
        if(Utility.shared.isSwitchEnable)
        {
            Utility.shared.isSwitchEnable = false
        }
        self.floatingMapView.isHidden = true
        selectedStartDate = nil
        selectedEndDate = nil
        adultCount = 1
        AirbnbDatePickerViewController().handleClearInput()
        Utility.shared.TotalFilterCount = 0
        self.NoresultView.isHidden = true
            self.scrollView.isHidden = false
        guest_filter = 0
        PageIndex = 1
        Utility.shared.selectedstartDate_filter = ""
        Utility.shared.selectedEndDate_filter = ""
        Utility.shared.isSwitchEnable = false
        locationLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"losangeles"))!)"
        searchBackBtn.setImage(#imageLiteral(resourceName: "Magnyfy_glass"), for: .normal)
        headerView.backgroundColor = UIColor(named: "becomeAHostStep_Color")
        self.locationLabel.textColor =  UIColor(named: "Title_Header")
        self.newFilterBtn.layer.shadowOpacity = 0.3
        self.searchView.layer.shadowOpacity = 0.2
        Utility.shared.locationfromSearch = ""
        dateBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"dates")) ?? "Dates")", for: .normal)
        dateBtn.setTitleColor(Theme.TextDarkColor, for: .normal)
        dateBtn.backgroundColor = UIColor.white
        if Utility.shared.isRTLLanguage(){
            dateBtn.frame = CGRect(x:FULLWIDTH - (20+90), y: 10, width:90, height: 33)
            guestBtn.frame = CGRect(x: (self.dateBtn.frame.origin.x-120), y: 10, width:110, height: 33)
        }else{
            dateBtn.frame = CGRect(x:20, y: 10, width:90, height: 33)
            guestBtn.frame = CGRect(x: (self.dateBtn.frame.origin.x+self.dateBtn.frame.size.width + 10), y: 10, width:110, height: 33)
        }
        
//        guestBtn.frame = CGRect(x: (self.dateBtn.frame.origin.x+self.dateBtn.frame.size.width + 10), y: 5, width:110, height: 33)
        guestBtn.setTitleColor(Theme.TextDarkColor, for: .normal)
        guestBtn.backgroundColor = UIColor.white
        guestBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"guest"))!)", for: .normal)
        self.exploreTV.isHidden = true
            self.collectionViewFilterPage?.isSkeletonable = false
            self.collectionViewFilterPage?.hideSkeleton()
        self.collectionViewFilterPage.isHidden = true
        isFilterEnable = false
        filterBtn.isHidden = true
        if(Utility.shared.searchLocationDict.count > 0)
        {
        Utility.shared.searchLocationDict.setValue(nil, forKey: "lat")
        Utility.shared.searchLocationDict.setValue(nil, forKey: "lon")
        }
        
        filterBtn.backgroundColor = UIColor.white
            newFilterBtn.setImage(#imageLiteral(resourceName: "explore_filter"), for: .normal)
            self.newFilterBtn.backgroundColor = UIColor(named: "colorController")
        filterBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"filter"))!)", for: .normal)
        filterBtn.setTitleColor(Theme.TextDarkColor, for: .normal)
        Utility.shared.selectedstartDate = ""
        Utility.shared.selectedEndDate = ""
        self.popularAPICall()
        self.MostViewedListingAPICall()
        }
        else {
            let pageObj = SearchPageVC()
            PageIndex = 1
            pageObj.delegate = self
            Utility.shared.isfromExplorePage = true
            pageObj.modalPresentationStyle = .fullScreen
            self.present(pageObj, animated: true, completion: nil)
        }
    }
    
    @objc func searchBtnTapped(_ sender: UIButton!) {
        
            
        let pageObj = SearchPageVC()
        PageIndex = 1
        pageObj.delegate = self
        Utility.shared.isfromExplorePage = true
        pageObj.modalPresentationStyle = .fullScreen
        self.present(pageObj, animated: true, completion: nil)
       
        
    }
    @IBAction func retyBtnTapped(_ sender: Any) {
         if Utility.shared.isConnectedToNetwork(){
            
            if guest_filter != 0 || Utility.shared.selectedEndDate_filter != "" || Utility.shared.selectedstartDate_filter != "" || isFilterEnable == true{
                offlineView.isHidden = true
                collectionViewFilterPage?.prepareSkeleton(completion: { [self] done in
                    self.collectionViewFilterPage?.isSkeletonable = true
                    self.collectionViewFilterPage?.showAnimatedGradientSkeleton()
                })
                searchListingAPICall()
            }else{
                offlineView.isHidden = true
                self.exploreTV.isHidden = true
                isFilterEnable = false
                self.popularAPICall()
                self.MostViewedListingAPICall()
            }
            

        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ExplorePageVC:UITableViewDataSource,UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int{
        var totalSection = 0
        if(!isAnimationCompleted) {
            return 3
        }
        if (populardestinationArray.count > 0){
            totalSection = totalSection + 1
        }
        
        if (mosthomeImageArray.count > 0){
            totalSection = totalSection + 1
        }
        
        if (homeImageArray.count > 0){
            totalSection = totalSection + 1
        }
        return totalSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
        if(!isFilterEnable){
    
            if(homeImageArray.count>0 || mosthomeImageArray.count>0 || populardestinationArray.count > 0){
            return 3
        }
        return 0
        }
        else if(isFilterEnable){
            if(FilterArray.count>0){
                return 1
            }
            
        }
        return 0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UILabel()
        
        switch section{
        case 0:
            headerView.text = "Popular locations"
            break
        case 1:
            headerView.text = "Recommended"
            break
        case 2:
            headerView.text = ""
            break
        case 3:
            headerView.text = "Most Viewed"
            break
        default:
            headerView.text = ""
            break
        }
        
        
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section{
        case 0:
            return 50
        case 1:
            return 50
        case 2:
            return 20
        case 3:
            return 50
        default:
            return 20
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        
       
        
            if(indexPath.row==0){
                         if(populardestinationArray.count == 0)
                         {
                             if (homeImageArray.count == 0){
                                 return 0
                             }else{
                                 return 200 //Recommended
                             }
                          }
                          else
                         {
                          return 150 //popular
                          }
                      }
        
                  else if(indexPath.row==1){
            if(homeImageArray.count % 2 == 0){
                if(homeImageArray.count == 0){
                    return 0
                }
                return (CGFloat(220 * (homeImageArray.count/2))+80)
            }
            return (CGFloat((220 * (homeImageArray.count/2))+280))
        }
        else if(indexPath.row == 2)
        {
        if(mosthomeImageArray.count % 2 == 0){
                 return (CGFloat((220 * (mosthomeImageArray.count/2))+80))
            }
        return (CGFloat((220 * (mosthomeImageArray.count/2))+300))
        }
        
//        if(FilterArray.count > 0){
//
//        return ((CGFloat(400 * (FilterArray.count))+40))
//        }
      
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "cellIdentifier"
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        for subView in (cell?.contentView.subviews)!
        {
            subView.removeFromSuperview()
        }
        cell?.selectionStyle = UITableViewCell.SelectionStyle.none
      //  cell?.backgroundColor = UIColor.white
        let contentview = UIView()
      //  contentview.frame = CGRect(x: 0, y: 0, width:FULLWIDTH, height: 180)
        
       // contentview.backgroundColor = UIColor.white
        
        if((indexPath.row==0)) {
            if(isFilterEnable){
                contentview.frame = CGRect(x: 0, y: 0, width: Int(FULLWIDTH), height:((400 * (FilterArray.count))))
                contentview.clipsToBounds = true
            }
            else{
            contentview.frame = CGRect(x: 0, y: 0, width: FULLWIDTH, height:220)
            }
                   // contentview.backgroundColor = UIColor.white
                    let titleLabel = UILabel()
            if(!isFilterEnable)
            {
                
                    titleLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"populardest"))!)"
            }
            else
            {
             titleLabel.text = ""
             }
                    titleLabel.frame = CGRect(x:20, y: 5, width: FULLWIDTH-40, height:30)
                    titleLabel.tintColor =  UIColor(named: "Title_Header")
                    titleLabel.textColor =  UIColor(named: "Title_Header")
                    titleLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 22)
                    contentview.addSubview(titleLabel)
                    
                    let layout = UICollectionViewFlowLayout()
                if(isFilterEnable){
                    explorecollectionView = UICollectionView(frame: CGRect(x:20, y:0, width: Int(FULLWIDTH-40), height: ((400 * (FilterArray.count)))), collectionViewLayout: layout)
                }
                else
                {
                    explorecollectionView = UICollectionView(frame: CGRect(x:20, y:50, width: FULLWIDTH-30, height:150), collectionViewLayout: layout)
                        }
                
                    explorecollectionView?.tag = 0
                    layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 10.0
            layout.minimumInteritemSpacing = 10.0
                    explorecollectionView?.dataSource = self
                    explorecollectionView?.delegate = self
            
                    explorecollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellIdentifier")
                   // explorecollectionView?.backgroundColor = UIColor.white
                    explorecollectionView?.showsHorizontalScrollIndicator = false
                    if let aView = explorecollectionView {
                        contentview.addSubview(aView)
                    }
            if(isFilterEnable){
                explorecollectionView?.register(UINib(nibName: "ExploreCollectionFilterCell", bundle: nil), forCellWithReuseIdentifier: "ExploreCollectionFilterCell")
                
                       }
                       else{
            explorecollectionView?.register(UINib(nibName: "popularcollectionCell", bundle: nil), forCellWithReuseIdentifier: "popularcollectionCell")
            }
                    
           
                        self.explorecollectionView?.reloadData()
                cell?.contentView.addSubview(contentview)
                return cell!
        }
        
        else if((indexPath.row==1)) {
            if(isFilterEnable){
                contentview.frame = CGRect(x: 0, y: 0, width: Int(FULLWIDTH), height:((400 * (FilterArray.count))))
                contentview.clipsToBounds = true
            }
            else{
            if(homeImageArray.count % 2 == 0){
            contentview.frame = CGRect(x: 0, y: 0, width: Int(FULLWIDTH), height:(220 * (homeImageArray.count/2))+50)
            }
            else{
              contentview.frame = CGRect(x: 0, y: 0, width: Int(FULLWIDTH), height:((220 * (homeImageArray.count/2))+280))
            }
            }
           // contentview.backgroundColor = UIColor.white
            let titleLabel = UILabel()
            
           if(homeImageArray.count>0 && !isFilterEnable)
           {
            titleLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"recommended"))!)"
            }
            else
           {
            titleLabel.text = ""
            }
            //titleLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"recommended"))!)"
            titleLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 22)
            titleLabel.frame = CGRect(x:20, y: 0, width: FULLWIDTH - 40, height: 40)
            //titleLabel.textColor = UIColor(red: 111.0/255.0, green: 113.0/255.0, blue: 121.0/255.0, alpha: 1.0)
            contentview.addSubview(titleLabel)
            
            
            let layout = UICollectionViewFlowLayout()
            if(isFilterEnable){
                explorecollectionView = UICollectionView(frame: CGRect(x:20, y:0, width: Int(FULLWIDTH-40), height: ((400 * (FilterArray.count)))), collectionViewLayout: layout)
            }
            else{
                if(homeImageArray.count % 2 == 0){
                explorecollectionView = UICollectionView(frame: CGRect(x:20, y:50, width: Int(FULLWIDTH-40), height:((220 * (homeImageArray.count/2)))), collectionViewLayout: layout)
                }
                else{
                    explorecollectionView = UICollectionView(frame: CGRect(x:20, y: 50, width: Int(FULLWIDTH-40), height:((220 * (homeImageArray.count/2))+220)), collectionViewLayout: layout)
                }
            }
            explorecollectionView?.tag = 1
            explorecollectionView?.isScrollEnabled = false

           // layout.scrollDirection = .vertical
            explorecollectionView?.dataSource = self
            explorecollectionView?.delegate = self
            explorecollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellIdentifier")
           // explorecollectionView?.backgroundColor = UIColor.white
            if let aView = explorecollectionView {
                contentview.addSubview(aView)
            }
            if(isFilterEnable){
                explorecollectionView?.register(UINib(nibName: "ExploreCollectionFilterCell", bundle: nil), forCellWithReuseIdentifier: "ExploreCollectionFilterCell")
                
            }
            else{
            explorecollectionView?.register(UINib(nibName: "ExploreCollectioncell", bundle: nil), forCellWithReuseIdentifier: "ExploreCollectioncell")
            }
         //   DispatchQueue.main.async {
                self.explorecollectionView?.reloadData()
        //    }
           
            cell?.contentView.addSubview(contentview)
            cell?.contentView.layer.cornerRadius = 5.0
            cell?.contentView.clipsToBounds = true
        
            return cell!
        }
        else{
            if(isFilterEnable){
                contentview.frame = CGRect(x: 0, y: 0, width: Int(FULLWIDTH), height:((400 * (FilterArray.count))))
                
            }
            else{
             if(mosthomeImageArray.count % 2 == 0){
            contentview.frame = CGRect(x: 0, y: 0, width: Int(FULLWIDTH), height: ((220 * (mosthomeImageArray.count/2))+80))
            }
             else{
               contentview.frame = CGRect(x: 0, y: 0, width: Int(FULLWIDTH), height:((220 * (mosthomeImageArray.count/2))+290))
            }
            }
            //contentview.backgroundColor = UIColor.white
            let titleLabel = UILabel()
            if(mosthomeImageArray.count > 0 && !isFilterEnable)
            {
            titleLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"mostviewed"))!)"
            }
            else
             {
            titleLabel.text = ""
            }
            titleLabel.frame = CGRect(x:20, y: 0, width: FULLWIDTH - 40, height: 40)
            titleLabel.tintColor =  UIColor(named: "Title_Header")
            titleLabel.textColor =  UIColor(named: "Title_Header")
            titleLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 22)
            contentview.addSubview(titleLabel)
            
            
            let layout = UICollectionViewFlowLayout()
            if(isFilterEnable){
                explorecollectionView = UICollectionView(frame: CGRect(x:20, y:0, width: Int(FULLWIDTH-40), height: (400 * (FilterArray.count))), collectionViewLayout: layout)
            }
            else{
                if(mosthomeImageArray.count % 2 == 0){
                explorecollectionView = UICollectionView(frame: CGRect(x:20, y:50, width: Int(FULLWIDTH-40), height: (220 * (mosthomeImageArray.count/2))), collectionViewLayout: layout)
                }
                else{
                   explorecollectionView = UICollectionView(frame: CGRect(x:20, y:50, width: Int(FULLWIDTH-40), height:((220 * (mosthomeImageArray.count/2))+220)), collectionViewLayout: layout)
                }
            }
            explorecollectionView?.tag = 2
            explorecollectionView?.isScrollEnabled = false
            //explorecollectionView?.isScrollEnabled = true
            //layout.scrollDirection = .vertical
            explorecollectionView?.dataSource = self
            explorecollectionView?.delegate = self
            explorecollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellIdentifier")
          //  explorecollectionView?.backgroundColor = UIColor.white
            if let aView = explorecollectionView {
                contentview.addSubview(aView)
            }
            if(isFilterEnable){
                explorecollectionView?.register(UINib(nibName: "ExploreCollectionFilterCell", bundle: nil), forCellWithReuseIdentifier: "ExploreCollectionFilterCell")
                
            }
            else{
                explorecollectionView?.register(UINib(nibName: "ExploreCollectioncell", bundle: nil), forCellWithReuseIdentifier: "ExploreCollectioncell")
            }
            //DispatchQueue.main.async {
                self.explorecollectionView?.reloadData()
         //   }
            
            cell?.contentView.addSubview(contentview)
            cell?.contentView.layer.cornerRadius = 5.0
            cell?.contentView.clipsToBounds = true
            return cell!
        }
        
        

    }
    
    @objc(collectionView:didSelectItemAtIndexPath:) func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if (collectionView == self.collectionViewFilterPage && FilterArray.count > indexPath.row){
            let viewListing = UpdatedViewListing()
            Utility.shared.unpublish_preview_check = false
            viewListing.listID = FilterArray[indexPath.row].id ?? 0
            viewListing.delegate = self
            if let imageCell = collectionView.cellForItem(at: indexPath) as? UpdatedSearchCell {
//                imageCell.contentView.backgroundColor = UIColor.white
                viewListing.cc_setZoomTransition(originalView:imageCell.contentView)
            }

            self.present(viewListing, animated: true, completion: nil)
        }else if (collectionView == self.popularCollectionView){
            
            Utility.shared.locationfromSearch = populardestinationArray[indexPath.row].locationAddress!
            if Utility.shared.locationfromSearch == "empty" {
            locationLabel.text = ""
            }
            else {
                locationLabel.text = Utility.shared.locationfromSearch
            }
            isFilterEnable = true
            self.searchBackBtn.backgroundColor =  UIColor(named: "viewBG")
            self.searchBackBtn.setImage(#imageLiteral(resourceName: "back_black"), for: .normal)
            
            self.locationLabel.textColor =  UIColor(named: "Title_Header")
            headerView.backgroundColor =  UIColor(named: "becomeAHostStep_Color")
            collectionViewFilterPage?.prepareSkeleton(completion: { [self] done in
                self.collectionViewFilterPage?.isSkeletonable = true
                self.collectionViewFilterPage?.showAnimatedGradientSkeleton()
            })
            self.searchListingAPICall()
            
        }else if (collectionView == self.recommendedCollectionView){
            let viewListing = UpdatedViewListing()
            Utility.shared.unpublish_preview_check = false
            viewListing.listID = recommendListingArray[indexPath.row].id ?? 0
            viewListing.delegate = self
            if let imageCell = collectionView.cellForItem(at: indexPath) as? customUpdatedCell {
//                imageCell.contentView.backgroundColor = UIColor.white
                viewListing.cc_setZoomTransition(originalView:imageCell.contentView)
            }
            self.present(viewListing, animated: true, completion: nil)
        }else{
            let viewListing = UpdatedViewListing()
            Utility.shared.unpublish_preview_check = false
            viewListing.listID = mostListingArray[indexPath.row].id ?? 0
            viewListing.delegate = self
            if let imageCell = collectionView.cellForItem(at: indexPath) as? customUpdatedCell {
//                imageCell.contentView.backgroundColor = UIColor.white
                viewListing.cc_setZoomTransition(originalView:imageCell.contentView)
            }
            self.present(viewListing, animated: true, completion: nil)
        }
        
        
    }

    
    override func viewDidLayoutSubviews() {
        self.view.clipsToBounds = true
        if self.PageIndex == 1{
            self.scrollToBottom()
        }
        
        let shadowSize : CGFloat = 3.0
        let shadowPath = UIBezierPath(roundedRect: newFilterBtn.bounds, cornerRadius: 15)
        self.newFilterBtn.layer.masksToBounds = false
        self.newFilterBtn.layer.shadowColor = Theme.SearchShadowColor.cgColor
        self.newFilterBtn.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.newFilterBtn.layer.shadowOpacity = 0.2
        self.newFilterBtn.layer.cornerRadius = 14
        self.newFilterBtn.layer.shadowPath = shadowPath.cgPath
        
        
        let shadowPath2 = UIBezierPath(roundedRect:searchView.bounds, cornerRadius: 15)
       
        self.searchView.layer.cornerRadius = 14
        self.searchView.clipsToBounds = true
        self.searchView.layer.masksToBounds = false
        self.searchView.layer.shadowColor = Theme.SearchShadowColor.cgColor
        self.searchView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.searchView.layer.shadowOpacity = 0.2
        self.searchView.layer.shadowPath = shadowPath2.cgPath
    }
    @objc func scrollToBottom() {
//        if self.FilterArray.count != 0 && isFilterEnable == true {
//            isFilterEnable = true
//            let indexPath = IndexPath(row:0,section:0)
//            self.collectionViewFilterPage.scrollToItem(at: indexPath, at: .top, animated: false)
//
//        }
    }

    
    //MARK****************************************COLLECTIONVIEW DELEGATE & DATASOURCE METHODS *********************************************>
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == self.popularCollectionView){
            return populardestinationArray.count
        }else if (collectionView == self.recommendedCollectionView){
            return homeImageArray.count
        }else if (collectionView == self.mostViewedCOllectionView){
            return mosthomeImageArray.count
        }else {
            if(FilterArray.count>0 && collectionView == self.collectionViewFilterPage){
                return FilterArray.count
            }
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == self.popularCollectionView){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularcollectionCell", for: indexPath)as! popularcollectionCell
            let listimage = populardestinationArray[indexPath.row].image!
//            cell.contentView.backgroundColor = .white
//            cell.backgroundColor = .white

            cell.popularImage.sd_setImage(with: URL(string: "\(POPULAR_LOCATION_IMAGE)\(listimage)"), placeholderImage: #imageLiteral(resourceName: "placeholderimg"))
            cell.popularImage.contentMode = .scaleAspectFill
            cell.popularLabel.text = "\(populardestinationArray[indexPath.row].location!)"
            cell.popularLabel.textAlignment = .center
            cell.popularImage.layer.cornerRadius = 15.0
            cell.popularImage.layer.masksToBounds = true
            cell.shadowView.layer.cornerRadius = 15.0
            cell.shadowView.layer.masksToBounds = true

            return cell
        }else if (collectionView == self.recommendedCollectionView){
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellcustomUpdated", for: indexPath)as! customUpdatedCell
            if Utility.shared.isRTLLanguage(){
              cell.thunderTop.constant = 17.5
            }
            else {
                cell.thunderTop.constant = 19.5
            }
            cell.lineView.isHidden = true
            var listTypeString = ""
           
          
            
            if(Utility.shared.isRTLLanguage()) {
                
            
            if ((self.recommendListingArray[indexPath.row].beds ?? 0) > 1){
                listTypeString =  "\(self.recommendListingArray[indexPath.row].beds ?? 0)" + " beds"
            }else if ((self.recommendListingArray[indexPath.row].beds ?? 0) == 1){
                listTypeString = "\(self.recommendListingArray[indexPath.row].beds ?? 0)" + " bed"
            }
                
                listTypeString = listTypeString + " / " + "\(self.recommendListingArray[indexPath.row].roomType ?? "")"
            }
            else {
                listTypeString = "\(self.recommendListingArray[indexPath.row].roomType ?? "")"
                if ((self.recommendListingArray[indexPath.row].beds ?? 0) > 1){
                    listTypeString = listTypeString + " / " + "\(self.recommendListingArray[indexPath.row].beds ?? 0)" + " beds"
                }else if ((self.recommendListingArray[indexPath.row].beds ?? 0) == 1){
                    listTypeString = listTypeString + " / " + "\(self.recommendListingArray[indexPath.row].beds ?? 0)" + " bed"
                }
                
            }
            cell.listTypeLabel.text = listTypeString
            cell.listTypeLabel.textColor = UIColor(named: "searchPlaces_TextColor")
            
            let listimage = homeImageArray[indexPath.row]
            cell.imageView.sd_setImage(with: URL(string: "\(IMAGE_LISTING_MEDIUM)\(listimage)"), placeholderImage: #imageLiteral(resourceName: "placeholderimg"))
            cell.imageView.contentMode = .scaleAspectFill
            cell.listTitleLabel.text = self.recommendListingArray[indexPath.row].title ?? ""
            
            cell.lightningImageView.isHidden = self.recommendListingArray[indexPath.row].bookingType != "instant"
            
           
                    if("\(wishlistArray[indexPath.row])" == "0"){
                        cell.heartBtn.setImage(#imageLiteral(resourceName: "Heart"), for: .normal)
                    }else{
                        cell.heartBtn.setImage(#imageLiteral(resourceName: "like"), for: .normal)
                    }
                    cell.heartBtn.isHidden = false
                    cell.heartBtn.tag = indexPath.row
                    cell.heartBtn.addTarget(self, action: #selector(likeBtnTapped), for: .touchUpInside)
                
           
            
            
            
            if(Utility.shared.getPreferredCurrency() != nil &&  Utility.shared.getPreferredCurrency() != "")
            {
                let currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!)
                let from_currency = self.recommendListingArray[indexPath.row].listingData?.currency
                let currency_amount = self.recommendListingArray[indexPath.row].listingData?.basePrice != nil ? self.recommendListingArray[indexPath.row].listingData?.basePrice : 0
                let price_value = Utility.shared.getCurrencyRate(basecurrency:currencyvalue_from_API?.base! ?? "", fromCurrency:from_currency!, toCurrency:Utility.shared.getPreferredCurrency()!, CurrencyRate:Utility.shared.currency_Dict, amount:currency_amount!)
                let restricted_price =  Double(String(format: "%.2f",price_value))
                cell.listPriceLabel.text =  "\(currencysymbol!)\(restricted_price!.clean) / \(Utility.shared.getLanguage()?.value(forKey:"night") ?? "Night")"
                
                let attributes = [
                    NSAttributedString.Key.font: UIFont(name: APP_FONT_SEMIBOLD, size: 18),
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
            else
            {
                let currencysymbol = Utility.shared.getSymbol(forCurrencyCode:self.currencyvalue_from_API?.base! ?? "")
                let from_currency = self.recommendListingArray[indexPath.row].listingData?.currency
                let currency_amount = self.recommendListingArray[indexPath.row].listingData?.basePrice != nil ? self.recommendListingArray[indexPath.row].listingData?.basePrice : 0
                let price_value = Utility.shared.getCurrencyRate(basecurrency:currencyvalue_from_API?.base! ?? "", fromCurrency:from_currency!, toCurrency:self.currencyvalue_from_API?.base! ?? "", CurrencyRate:Utility.shared.currency_Dict, amount:currency_amount!)
                let restricted_price =  Double(String(format: "%.2f",price_value))
                cell.listPriceLabel.text = "\(currencysymbol!)\(restricted_price!.clean) / \(Utility.shared.getLanguage()?.value(forKey:"night") ?? "Night")"
                let attributes = [
                    NSAttributedString.Key.font: UIFont(name: APP_FONT_SEMIBOLD, size: 18),
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
            
            
                let value1 = Float("\(reviewcount_Array[indexPath.row])") ?? 0.0
                let value2 = Float("\(reviewStart_ratingArray[indexPath.row])") ?? 0.0
                if(value2 != 0.0){
                    let divideValue = value2/value1
                    cell.ratingLabel.text = "\(Int(divideValue.rounded()))"
                    cell.ratingView.isHidden = false
                }else{
                    cell.ratingLabel.text = "0.0"
                    cell.ratingView.isHidden = true
                }
        
            return cell
        }else if (collectionView == mostViewedCOllectionView){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellcustomUpdated", for: indexPath)as! customUpdatedCell
            if Utility.shared.isRTLLanguage(){
                cell.thunderTop.constant = 19
            }
            else {
                cell.thunderTop.constant = 23
            }
            
           
            cell.lineView.isHidden = true
            cell.heightConstant.constant = 225
            cell.leftConstant.constant = 10
            var listTypeString = ""
           
            
            if(Utility.shared.isRTLLanguage()) {
                
            
            if ((self.mostListingArray[indexPath.row].beds ?? 0) > 1){
                listTypeString =  "\(self.mostListingArray[indexPath.row].beds ?? 0)" + " beds"
            }else if ((self.mostListingArray[indexPath.row].beds ?? 0) == 1){
                listTypeString = "\(self.mostListingArray[indexPath.row].beds ?? 0)" + " bed"
            }
                
                listTypeString = listTypeString + " / " + "\(self.mostListingArray[indexPath.row].roomType ?? "")"
            }
            else {
                listTypeString = "\(self.mostListingArray[indexPath.row].roomType ?? "")"
                if ((self.mostListingArray[indexPath.row].beds ?? 0) > 1){
                    listTypeString = listTypeString + " / " + "\(self.mostListingArray[indexPath.row].beds ?? 0)" + " beds"
                }else if ((self.mostListingArray[indexPath.row].beds ?? 0) == 1){
                    listTypeString = listTypeString + " / " + "\(self.mostListingArray[indexPath.row].beds ?? 0)" + " bed"
                }
                
            }
            cell.listTypeLabel.text = listTypeString
            cell.listTypeLabel.textColor = UIColor(named: "searchPlaces_TextColor")
            
            let listimage = mosthomeImageArray[indexPath.row]
            cell.imageView.sd_setImage(with: URL(string: "\(IMAGE_LISTING_MEDIUM)\(listimage)"), placeholderImage: #imageLiteral(resourceName: "placeholderimg"))
            cell.imageView.contentMode = .scaleAspectFill
            
            cell.listTitleLabel.text = self.mostListingArray[indexPath.row].title ?? ""
            
            cell.lightningImageView.isHidden = self.mostListingArray[indexPath.row].bookingType != "instant"
            
          
                    if("\(mostwishlist_Array[indexPath.row])" == "0"){
                        cell.heartBtn.setImage(#imageLiteral(resourceName: "Heart"), for: .normal)
                    }else{
                        cell.heartBtn.setImage(#imageLiteral(resourceName: "like"), for: .normal)
                    }
                    cell.heartBtn.isHidden = false
                    cell.heartBtn.tag = indexPath.row
                    cell.heartBtn.addTarget(self, action: #selector(most_likeBtnTapped), for: .touchUpInside)
               
            
        if(Utility.shared.getPreferredCurrency() != nil &&  Utility.shared.getPreferredCurrency() != "")
        {
            var currencysymbol = "$"
            if let symbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!) {
                currencysymbol = symbol
            }
            else {
                currencysymbol = "$"
            }
            let from_currency = self.mostListingArray[indexPath.row].listingData?.currency
            let currency_amount = self.mostListingArray[indexPath.row].listingData?.basePrice != nil ? self.mostListingArray[indexPath.row].listingData?.basePrice : 0
            let price_value = Utility.shared.getCurrencyRate(basecurrency:currencyvalue_from_API?.base! ?? "", fromCurrency:from_currency!, toCurrency:Utility.shared.getPreferredCurrency()!, CurrencyRate:Utility.shared.currency_Dict, amount:currency_amount!)
            let restricted_price =  Double(String(format: "%.2f",price_value))
            cell.listPriceLabel.text = "\(currencysymbol)\(restricted_price!.clean) / \(Utility.shared.getLanguage()?.value(forKey:"night") ?? "Night")"
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
                let attributedString2 = NSMutableAttributedString(string: "/ \(currencysymbol)\(restricted_price!.clean)" , attributes: attributes as [NSAttributedString.Key : Any])
                let attributedString = NSMutableAttributedString(string: "\(Utility.shared.getLanguage()?.value(forKey:"night") ?? "Night")", attributes: attributes2 as [NSAttributedString.Key : Any])
                
                attributedString.append(attributedString2)
                
                cell.listPriceLabel.attributedText = attributedString
                
            }
            else {
                let attributedString = NSMutableAttributedString(string: "\(currencysymbol)\(restricted_price!.clean)" , attributes: attributes as [NSAttributedString.Key : Any])
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
        else
        {
            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode:self.currencyvalue_from_API?.base! ?? "")
            
            
            let from_currency = self.mostListingArray[indexPath.row].listingData?.currency
            let currency_amount = self.mostListingArray[indexPath.row].listingData?.basePrice != nil ? self.mostListingArray[indexPath.row].listingData?.basePrice : 0
            let price_value = Utility.shared.getCurrencyRate(basecurrency:currencyvalue_from_API?.base! ?? "", fromCurrency:from_currency!, toCurrency:self.currencyvalue_from_API?.base! ?? "", CurrencyRate: Utility.shared.currency_Dict, amount:currency_amount!)
            let restricted_price =  Double(String(format: "%.2f",price_value))
            cell.listPriceLabel.text = "\(currencysymbol!)\(restricted_price!.clean) / \(Utility.shared.getLanguage()?.value(forKey:"night") ?? "Night")"
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
            
            let value1 = Float("\(mostreviewcount_Array[indexPath.row])") ?? 0.0
            let value2 = Float("\(mostreviewStart_ratingArray[indexPath.row])") ?? 0.0
            if(value2 != 0.0){
                let dividedValue = value2/value1
                cell.ratingLabel.text = "\(Int(dividedValue.rounded()))"
                cell.ratingView.isHidden = false
            }else{
                cell.ratingLabel.text = "0.0"
                cell.ratingView.isHidden = true
            }
            
        return cell
        }else{
            if (collectionView == collectionViewFilterPage && FilterArray.count > indexPath.row) {
            
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellUpdatedSearch", for: indexPath)as! UpdatedSearchCell
                
                var listTypeString = ""
                
                
                if(Utility.shared.isRTLLanguage()) {
                    
                
                if ((self.FilterArray[indexPath.row].beds ?? 0) > 1){
                    listTypeString =  "\(self.FilterArray[indexPath.row].beds ?? 0)" + " beds"
                }else if ((self.FilterArray[indexPath.row].beds ?? 0) == 1){
                    listTypeString = "\(self.FilterArray[indexPath.row].beds ?? 0)" + " bed"
                }
                    
                    listTypeString = listTypeString + " / " + "\(self.FilterArray[indexPath.row].roomType ?? "")"
                }
                else {
                    listTypeString = "\(self.FilterArray[indexPath.row].roomType ?? "")"
                    if ((self.FilterArray[indexPath.row].beds ?? 0) > 1){
                        listTypeString = listTypeString + " / " + "\(self.FilterArray[indexPath.row].beds ?? 0)" + " beds"
                    }else if ((self.FilterArray[indexPath.row].beds ?? 0) == 1){
                        listTypeString = listTypeString + " / " + "\(self.FilterArray[indexPath.row].beds ?? 0)" + " bed"
                    }
                    
                }
                cell.listTypeLabel.text = listTypeString
                cell.listTypeLabel.textColor = UIColor(named: "searchPlaces_TextColor")
                                
                cell.listTitleLabel.text = self.FilterArray[indexPath.row].title ?? ""
                
                cell.lightImg.isHidden = self.FilterArray[indexPath.row].bookingType != "instant"
                
                if Utility.shared.isRTLLanguage(){
                  cell.thunderTop.constant = 19
                }
                else {
                    cell.thunderTop.constant = 23
                }
                
        let array = FilterArray[indexPath.row].listingPhotos
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
            let from_currency = self.FilterArray[indexPath.row].listingData?.currency
                let currency_amount = self.FilterArray[indexPath.row].listingData?.basePrice != nil ? self.FilterArray[indexPath.row].listingData?.basePrice : 0
            
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
            let from_currency = self.FilterArray[indexPath.row].listingData?.currency
            let currency_amount = self.FilterArray[indexPath.row].listingData?.basePrice != nil ? self.FilterArray[indexPath.row].listingData?.basePrice! : 0
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
                let value1 = Float(FilterArray[indexPath.row].reviewsCount ?? 0)
                let value2 = Float(FilterArray[indexPath.row].reviewsStarRating ?? 0)
                if(value2 != 0.0){
                    let dividedValue = value2/value1
                    cell.ratingCount.text = "\(Int(dividedValue.rounded()))"
                    cell.ratingView.isHidden = false
                }else{
                    cell.ratingCount.text = "0.0"
                    cell.ratingView.isHidden = true
                }
        
                   
                        if(FilterArray[indexPath.row].wishListStatus ?? false){
                            cell.likeBtn.setImage(#imageLiteral(resourceName: "like"), for: .normal)
                        }else{
                            cell.likeBtn.setImage(#imageLiteral(resourceName: "Heart"), for: .normal)
                        }
                        cell.likeBtn.isHidden = false
                        cell.likeBtn.tag = indexPath.row
                        cell.likeBtn.addTarget(self, action: #selector(filter_likeBtnTapped), for: .touchUpInside)
                   
              
            
            return cell
            }else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExploreCollectionFilterCell", for: indexPath)as! ExploreCollectionFilterCell
                
                return cell
            }
            
        }
    }
    
     func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5) {
            if let cell = collectionView.cellForItem(at: indexPath) as? ExploreCollectioncell {
                cell.transform = .init(scaleX: 0.90, y: 0.90)
//                cell.contentView.backgroundColor = UIColor.white
            }
        }
    }
    
     func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5) {
            if let cell = collectionView.cellForItem(at: indexPath) as? ExploreCollectioncell {

                cell.transform = .identity
//                cell.contentView.backgroundColor = .clear
            }
        }
    }
   
    
     @objc func imageScrollerTapped(_ sender: UITapGestureRecognizer) {
        if(FilterArray.count > 0)
        {
            let viewListing = UpdatedViewListing()
            Utility.shared.unpublish_preview_check = false
            viewListing.listID = FilterArray[sender.view!.tag].id ?? 0
            viewListing.delegate = self
            if let imageCell = self.collectionViewFilterPage.cellForItem(at: IndexPath(row: sender.view?.tag ?? 0, section: 0)) as? UpdatedSearchCell {
//                imageCell.contentView.backgroundColor = UIColor.white
                viewListing.cc_setZoomTransition(originalView:imageCell.contentView)
            }
            self.present(viewListing, animated: true, completion: nil)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if (collectionView == self.popularCollectionView){
            return CGSize(width: 125, height: 180)
        }else if (collectionView == self.recommendedCollectionView){
            return CGSize(width: 280, height:280)
        }else if (collectionView == self.mostViewedCOllectionView){
            return CGSize(width:FULLWIDTH-30, height: 340)
        }else{
            return CGSize(width: (FULLWIDTH-40), height:345)
        }
    }
   
    
      //MARK**************************************** AIRBNB DATEPICKER DELEGATE METHODS *********************************************>
    
    @objc func showDatePicker() {
        Utility.shared.isfromcheckingPage = false
        let datePickerViewController = AirbnbDatePickerViewController(dateFrom: selectedStartDate, dateTo: selectedEndDate)
        datePickerViewController.isFromFilter = true
        datePickerViewController.delegate = self
        let navigationController = UINavigationController(rootViewController: datePickerViewController)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true, completion: nil)
    }
    
    
    
    
    func datePickerController(_ datePickerController: AirbnbDatePickerViewController, didSaveStartDate startDate: Date?, endDate: Date?) {
       
        
        selectedStartDate = startDate
        selectedEndDate = endDate
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        if(startDate != nil && endDate != nil){
         Utility.shared.selectedstartDate_filter = (dateFormatterGet.string(from: startDate!))
        Utility.shared.selectedEndDate_filter = (dateFormatterGet.string(from: endDate!))
        }
        else
        {
             Utility.shared.selectedstartDate_filter = ""
            Utility.shared.selectedEndDate_filter = ""
        }
        
        if selectedStartDate == nil && selectedEndDate == nil {
            dateBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"dates")) ?? "Dates")", for: .normal)
            dateBtn.setTitleColor(Theme.TextDarkColor, for: .normal)
            dateBtn.backgroundColor = UIColor.white
            
            if Utility.shared.isRTLLanguage(){
                guestBtn.frame = CGRect(x: (self.dateBtn.frame.origin.x-120), y: 10, width:110, height: 33)
                filterBtn.frame = CGRect(x:(self.guestBtn.frame.origin.x-80), y: 10, width: 70, height: 33)
            }else{
                guestBtn.frame = CGRect(x:(self.dateBtn.frame.origin.x+self.dateBtn.frame.size.width + 10), y: 10, width:110, height: 33)
                filterBtn.frame = CGRect(x:(self.guestBtn.frame.origin.x+self.guestBtn.frame.size.width + 10), y: 10, width: 70, height: 33)
            }
        } else {
            self.lottieAnimation()
            dateBtn.setTitle("\(dateFormatter.string(from: startDate!)) - \(dateFormatter.string(from: endDate!))", for: .normal)
            dateBtn.frame = CGRect(x:20, y: 10, width: 130, height: 33)
             dateBtn.backgroundColor = Theme.PRIMARY_COLOR
            dateBtn.setTitleColor(UIColor.white, for: .normal)
           // dateBtn.titleLabel?.font = UIFont(name: "AvenirNextMedium", size: 10.0)
            guestBtn.frame = CGRect(x:(self.dateBtn.frame.origin.x+self.dateBtn.frame.size.width + 10), y: 10, width:110, height: 33)
            filterBtn.isHidden = false
            
            
            if Utility.shared.isRTLLanguage(){
                dateBtn.frame = CGRect(x:FULLWIDTH - (40+115), y: 10, width:135, height: 33)
                guestBtn.frame = CGRect(x: (self.dateBtn.frame.origin.x-120), y: 10, width:110, height: 33)
                filterBtn.frame = CGRect(x:(self.guestBtn.frame.origin.x-80), y: 10, width: 70, height: 33)
            }else{
                dateBtn.frame = CGRect(x:20, y: 10, width:130, height: 33)
                guestBtn.frame = CGRect(x: (self.dateBtn.frame.origin.x+self.dateBtn.frame.size.width + 10), y: 10, width:110, height: 33)
                filterBtn.frame = CGRect(x:(self.guestBtn.frame.origin.x+self.guestBtn.frame.size.width + 10), y: 10, width: 70, height: 33)
            }
            
            self.isFilterEnable = true
            self.PageIndex = 1
            collectionViewFilterPage?.prepareSkeleton(completion: { [self] done in
                self.collectionViewFilterPage?.isSkeletonable = true
                self.collectionViewFilterPage?.showAnimatedGradientSkeleton()
            })
           self.searchListingAPICall()
          
        }
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
            if recommendListingArray.count > 0 {
                let headerView = WhishlistPageVC()
                headerView.listID = recommendListingArray[sender.tag].id!
                headerView.listimage = recommendListingArray[sender.tag].listPhotoName!
                headerView.senderID = sender.tag
                headerView.delegate = self
                headerView.modalPresentationStyle = .overFullScreen
                self.present(headerView, animated: false, completion: nil)
            }
        }
        }
        else
   {
    self.exploreTV.isHidden = true
    self.offlineView.isHidden = false
    let shadowSize2 : CGFloat = 3.0
    let shadowPath2 = UIBezierPath(rect: CGRect(x: -shadowSize2 / 2,
                                                y: -shadowSize2 / 2,
                                                width: self.offlineView.frame.size.width + shadowSize2,
                                                height: self.offlineView.frame.size.height + shadowSize2))
    
    self.offlineView.layer.masksToBounds = false
    self.offlineView.layer.shadowColor = Theme.TextLightColor.cgColor
    self.offlineView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
    self.offlineView.layer.shadowOpacity = 0.3
    self.offlineView.layer.shadowPath = shadowPath2.cgPath
    if IS_IPHONE_X || IS_IPHONE_XR {
        offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-150, width: FULLWIDTH, height: 55)
    }else{
        offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-100, width: FULLWIDTH, height: 55)
    }
        }
        
      
    }
    @objc func most_likeBtnTapped(_ sender: UIButton!)
    {
        if Utility.shared.isConnectedToNetwork(){
        if((Utility.shared.getCurrentUserToken()) == nil || (Utility.shared.getCurrentUserToken()) == "")
        {
            let welcomeObj = WelcomePageVC()
             welcomeObj.modalPresentationStyle = .fullScreen
            self.present(welcomeObj, animated:false, completion: nil)
            //  appDelegate.setInitialViewController(initialView: welcomeObj)
        }
        else{
            if(mostListingArray.count > 0) {
                let headerView = WhishlistPageVC()
                headerView.listID = mostListingArray[sender.tag].id!
                headerView.listimage = mostListingArray[sender.tag].listPhotoName!
                headerView.delegate = self
                headerView.modalPresentationStyle = .overFullScreen
                self.present(headerView, animated: false, completion: nil)
                
            }
        }
        }
        else{
            self.exploreTV.isHidden = true
            self.offlineView.isHidden = false
            let shadowSize2 : CGFloat = 3.0
            let shadowPath2 = UIBezierPath(rect: CGRect(x: -shadowSize2 / 2,
                                                        y: -shadowSize2 / 2,
                                                        width: self.offlineView.frame.size.width + shadowSize2,
                                                        height: self.offlineView.frame.size.height + shadowSize2))
            
            self.offlineView.layer.masksToBounds = false
            self.offlineView.layer.shadowColor = Theme.TextLightColor.cgColor
            self.offlineView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            self.offlineView.layer.shadowOpacity = 0.3
            self.offlineView.layer.shadowPath = shadowPath2.cgPath
            if IS_IPHONE_X || IS_IPHONE_XR {
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-150, width: FULLWIDTH, height: 55)
            }else{
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-100, width: FULLWIDTH, height: 55)
            }
        }
    }
    @objc func filter_likeBtnTapped(_ sender: UIButton!)
    {
        if Utility.shared.isConnectedToNetwork(){
        if((Utility.shared.getCurrentUserToken()) == nil || (Utility.shared.getCurrentUserToken()) == "")
        {
            let welcomeObj = WelcomePageVC()
             welcomeObj.modalPresentationStyle = .fullScreen
            self.present(welcomeObj, animated:false, completion: nil)
            //  appDelegate.setInitialViewController(initialView: welcomeObj)
        }
        else
        {
        let headerView = WhishlistPageVC()
        if(FilterArray.count > 0)
        {
            headerView.listID = FilterArray[sender.tag].id!
            headerView.listimage = FilterArray[sender.tag].listPhotoName!
            headerView.delegate = self
            headerView.modalPresentationStyle = .overFullScreen
            self.present(headerView, animated: false, completion: nil)
            }
        }
        }
        else
        {
            self.exploreTV.isHidden = true
            self.offlineView.isHidden = false
            let shadowSize2 : CGFloat = 3.0
            let shadowPath2 = UIBezierPath(rect: CGRect(x: -shadowSize2 / 2,
                                                        y: -shadowSize2 / 2,
                                                        width: self.offlineView.frame.size.width + shadowSize2,
                                                        height: self.offlineView.frame.size.height + shadowSize2))
            
            self.offlineView.layer.masksToBounds = false
            self.offlineView.layer.shadowColor = Theme.TextLightColor.cgColor
            self.offlineView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            self.offlineView.layer.shadowOpacity = 0.3
            self.offlineView.layer.shadowPath = shadowPath2.cgPath
            if IS_IPHONE_X || IS_IPHONE_XR {
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-150, width: FULLWIDTH, height: 55)
            }else{
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-100, width: FULLWIDTH, height: 55)
            }
        }
    }
    
    //MARK:************************************************* AIRBNB OCCUPANT FILTER DELEGATE METHODS ****************************************>
    
     @objc func showOccupantFilter() {
        Utility.shared.isfromcheckingPage = false
        let occupantController = AirbnbOccupantFilterController(adultCount: adultCount, childrenCount: childrenCount, infantCount: infantCount, hasPet: hasPet)
        occupantController.delegate = self
        let navigationController = UINavigationController(rootViewController: occupantController)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true, completion: nil)
    }
    func occupantFilterController(_ occupantFilterController: AirbnbOccupantFilterController, didSaveAdult adult: Int, children: Int, infant: Int, pet: Bool) {
        self.lottieAnimation()
        self.adultCount = adult
        self.childrenCount = children
        self.infantCount = infant
        self.hasPet = pet
        self.guest_filter = adult
        
        let human = adult + children
        Utility.shared.guestCountToBeSend = human
        let infant = "\(infant > 0 ? (infant.description + " infant" + (infant > 1 ? "s" : "")) : "")"
        let pet = "\(pet ? "pets" : "")"
        
//        let text = "\(human) \((Utility.shared.getLanguage()?.value(forKey:"guest"))!)\(human > 1 ? "s" : "")" + (infant != "" ? ", " + infant : "") + (pet != "" ? ", " + pet : "")
        var value = String()
        if(human > 1)
        {
           value = "\(human) \((Utility.shared.getLanguage()?.value(forKey:"guests"))!)"
        }
        else
        {
           value = "\(human) \((Utility.shared.getLanguage()?.value(forKey:"guest"))!)"
        }
        guestBtn.backgroundColor = Theme.PRIMARY_COLOR
        guestBtn.setTitleColor(UIColor.white, for: .normal)
        //guestBtn.frame = CGRect(x: 170, y: 5, width: 130, height: 33)
        filterBtn.isHidden = false
        if Utility.shared.isRTLLanguage(){
            filterBtn.frame = CGRect(x:(self.guestBtn.frame.origin.x-80), y: 10, width: 70, height: 33)
        }else{
            filterBtn.frame = CGRect(x:(self.guestBtn.frame.origin.x+self.guestBtn.frame.size.width + 10), y: 10, width: 70, height: 33)
        }
        guestBtn.setTitle(value, for: .normal)
       
        self.isFilterEnable = true
        self.PageIndex = 1
        collectionViewFilterPage?.prepareSkeleton(completion: { [self] done in
            self.collectionViewFilterPage?.isSkeletonable = true
            self.collectionViewFilterPage?.showAnimatedGradientSkeleton()
        })
       self.searchListingAPICall()
        
    }
    
    
    
    //MARK:************************************************** GRAPHQL API METHOD CALL ********************************************************************>
    
    
    func popularAPICall() {
        
        if Utility.shared.isConnectedToNetwork(){
            let mostlistingquery = PTProAPI.GetPopularLocationsQuery()
            //            self.scrollView.isHidden = true
            Network.shared.apollo_headerClient.fetch(query: mostlistingquery,cachePolicy:.fetchIgnoringCacheData){ [self] response in
                self.popularCollectionView.isSkeletonable = false
                self.popularCollectionView.hideSkeleton()
                
                switch response {
                case .success(let result):
                    //MostViewListing
                    guard let mostListingValue = result.data?.getPopularLocations?.results else {
                        print("Missing data")
                        self.popularListingTitle.text = ""
                        self.popularListingTitle.isHidden = true
                        self.popularCollectionView.isHidden = true
                        self.popularListTitleTopConstraint.constant = 0
                        self.popularCollectionTopConstraint.constant = 0
                        self.popularCollectionHeightConstraint.constant = 0
                        return
                    }
                                        
                    self.populardestinationArray = (result.data?.getPopularLocations?.results) as! [PTProAPI.GetPopularLocationsQuery.Data.GetPopularLocations.Result]
                    
                    
                    
                    if self.populardestinationArray.count > 0{
                        self.popularListingTitle.text = "\(Utility.shared.getLanguage()?.value(forKey: "populardest") ?? "Popular Locations")"
                        self.popularListingTitle.isHidden = false
                        self.popularCollectionView.isHidden = false
                        self.popularListTitleTopConstraint.constant = 20
                        self.popularCollectionTopConstraint.constant = 15
                        self.popularCollectionHeightConstraint.constant = 200
                    }else{
                        self.popularListingTitle.text = ""
                        self.popularListingTitle.isHidden = true
                        self.popularCollectionView.isHidden = true
                        self.popularListTitleTopConstraint.constant = 0
                        self.popularCollectionTopConstraint.constant = 0
                        self.popularCollectionHeightConstraint.constant = 0
                    }
                    
                    self.popularCollectionView.reloadData()
                    self.popularCollectionView.isSkeletonable = false
                    self.popularCollectionView.hideSkeleton()
                    //self.popularCollectionView.isSkeletonable = false
                    
                    self.popularCollectionView.performBatchUpdates(nil, completion: {
                        (result) in
                        if(Utility.shared.isRTLLanguage()){
                            if (self.populardestinationArray.count > 0){
                                self.popularCollectionView.scrollToItem(at:IndexPath(item:0, section: 0), at: .right, animated: true)
                            }
                            
                            
                        }
                        
                        
                    })
                case .failure(let error):
                    self.view.makeToast(error.localizedDescription)
                }
            }
        }
        else {
            popularCollectionView?.prepareSkeleton(completion: { [self] done in
                self.popularCollectionView?.isSkeletonable = true
                self.popularCollectionView.showAnimatedGradientSkeleton()
            })
            
        }
    }
    
    
    func MostViewedListingAPICall()
    {
        self.collectionViewFilterPage.isHidden = true
        
        self.collectionViewFilterPage?.isSkeletonable = false
        self.collectionViewFilterPage?.hideSkeleton()
        
        if Utility.shared.isConnectedToNetwork(){
            self.exploreTV.isHidden = true
            self.offlineView.isHidden = true
            //            self.becomeAHostView.isHidden = true
            //            self.becomeAHostTopConstraint.constant = 0
            //            self.becomeAHostHeightConstraint.constant = 0
            self.getImageBannerFromAdmin()
            Utility.shared.selectedstartDate = ""
            Utility.shared.selectedEndDate = ""
            let mostlistingquery = PTProAPI.GetDefaultSettingQuery()
            //            self.scrollView.isHidden = true
            Network.shared.apollo_headerClient.fetch(query: mostlistingquery,cachePolicy:.fetchIgnoringCacheData){ [self] response in
                self.scrollView.isHidden = false
                self.scrollView.contentOffset = CGPoint(x: 0, y: 0)
                self.searchViewTopConstraint.constant = 20
                self.exploreTitleLabel.text = "\(Utility.shared.getLanguage()?.value(forKey: "Explore_Title") ?? "Explore the world! By Travelling")"
                self.exploreTitleLabel.isHidden = false
                switch response {
                case .success(let result):
                    guard let recommendeListingValue = result.data?.getRecommend?.results else{
                        print("Missing Data")
                        if result.data?.getRecommend?.status == 500{
                            let alert = UIAlertController(title: "\(Utility.shared.getLanguage()?.value(forKey: "oops") ?? "oops" )", message:result.data?.getMostViewedListing?.errorMessage, preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "\(Utility.shared.getLanguage()?.value(forKey: "okay") ?? "Okay")", style: .default, handler: { (action) in
                                UserDefaults.standard.removeObject(forKey: "user_token")
                                UserDefaults.standard.removeObject(forKey: "user_id")
                                UserDefaults.standard.removeObject(forKey: "password")
                                UserDefaults.standard.removeObject(forKey: "currency_rate")
                                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                                let welcomeObj = WelcomePageVC()
                                appDelegate.setInitialViewController(initialView: welcomeObj)
                            }))
                            self.present(alert, animated: true, completion: nil)
                            return
                        }
                        
                        return
                    }
                    self.searchBackBtn.backgroundColor =  UIColor(named: "viewBG")
                    self.searchBackBtn.setImage(#imageLiteral(resourceName: "Magnyfy_glass"), for: .normal)
                    self.locationLabel.textColor =  UIColor(named: "Title_Header")
                    headerView.backgroundColor = UIColor(named: "becomeAHostStep_Color")
                    self.newFilterBtn.layer.shadowOpacity = 0.3
                    self.searchView.layer.shadowOpacity = 0.2
                    
                    //            self.lottieView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
                    //            self.lottieView.isHidden = true
                    self.isAnimationCompleted = true
                    self.popularCollectionView.isSkeletonable = false
                    self.recommendedCollectionView.isSkeletonable = false
                    self.mostViewedCOllectionView.isSkeletonable = false
                    self.popularCollectionView.hideSkeleton()
                    self.recommendedCollectionView.hideSkeleton()
                    self.mostViewedCOllectionView.hideSkeleton()
                    self.homeTitleArray.removeAllObjects()
                    self.homePriceArray.removeAllObjects()
                    self.homeImageArray.removeAllObjects()
                    self.bookingTypeArray.removeAllObjects()
                    self.reviewcount_Array.removeAllObjects()
                    self.reviewStart_ratingArray.removeAllObjects()
                    self.entirehomeArray.removeAllObjects()
                    self.wishlistArray.removeAllObjects()
                    self.recommendListingArray = ((result.data?.getRecommend?.results)!) as! [PTProAPI.GetDefaultSettingQuery.Data.GetRecommend.Result]
                    if self.recommendListingArray.count > 0{
                        self.recommendedTitle.text = "\(Utility.shared.getLanguage()?.value(forKey: "recommended") ?? "Recommended")"
                        self.recommendedTitle.isHidden = false
                        self.recommendedCollectionView.isHidden = false
                        self.recommendedCollectionHeightConstraint.constant = 300
                        
                        self.recommendedTotalPage  = (self.recommendListingArray.count - 1)
                        recommendedPageControl.pageIndicatorTintColor = UIColor(named: "Review_Page_Line_Color")!
       //                 recommendedPageControl.currentPageIndicatorTintColor = Theme.Button_BG
                        recommendedPageControl.numberOfPages = self.recommendedTotalPage
                        recommendedPageControl.setCurrentPage(at: 0)
                        let config = FlexiblePageControl.Config(
                            displayCount: self.recommendedTotalPage,
                            dotSize: 8,
                            dotSpace: 4,
                            smallDotSizeRatio: 0.5,
                            mediumDotSizeRatio: 0.7
                        )
                        
                        recommendedPageControl.setConfig(config)
                        self.recommendedCollectionView.reloadData()
                    }else{
                        self.recommendedTitle.text = ""
                        self.recommendedTitle.isHidden = true
                        self.recommendedCollectionView.isHidden = true
                        self.recommendedCollectionHeightConstraint.constant = 0
                    }
                    for i in recommendeListingValue {
                        self.homeTitleArray.add(i?.title as Any)
                        self.homeImageArray.add(i?.listPhotoName as Any)
                        self.homePriceArray.add(i?.listingData?.basePrice as Any)
                        self.reviewcount_Array.add(i?.reviewsCount as Any)
                        self.reviewStart_ratingArray.add(i?.reviewsStarRating as Any)
                        self.entirehomeArray.add(i?.roomType as Any)
                        self.wishlistArray.add(i?.wishListStatus as Any)
                        self.bookingTypeArray.add(i?.bookingType as Any)
                        
                    }
                    
                    
                    //Currencyvalueget
                    
                    guard (result.data?.currency?.result) != nil else {
                        print("Missing data")
                        return
                    }
                    self.currencyvalue_from_API = (result.data?.currency?.result)!
                    Utility.shared.currencyvalue_from_API_base = (result.data?.currency?.result?.base)!
                    let currency_value = result.data?.currency?.result?.rates
                    self.currency_Dict = self.convertToDictionary(text: currency_value!)! as NSDictionary
                    Utility.shared.currency_Dict = self.convertToDictionary(text: currency_value!)! as NSDictionary
                    
                    //MostViewListing
                    guard let mostListingValue = result.data?.getMostViewedListing?.results else {
                        print("Missing data")
                        
                        
                        
                        return
                    }
                    self.mosthomeImageArray.removeAllObjects()
                    self.mosthomeTitleArray.removeAllObjects()
                    self.mosthomePriceArray.removeAllObjects()
                    self.mostreviewcount_Array.removeAllObjects()
                    self.mostreviewStart_ratingArray.removeAllObjects()
                    self.most_entirehomeArray.removeAllObjects()
                    self.mostwishlist_Array.removeAllObjects()
                    self.mostbookingTypeArray.removeAllObjects()
                    
                    self.mostListingArray = ((result.data?.getMostViewedListing?.results)!) as! [PTProAPI.GetDefaultSettingQuery.Data.GetMostViewedListing.Result]
                    
                    
                    
                    for i in mostListingValue {
                        self.mosthomeTitleArray.add(i?.title as Any)
                        self.mosthomePriceArray.add(i?.listingData?.basePrice as Any)
                        self.mosthomeImageArray.add(i?.listPhotoName as Any)
                        self.mostreviewcount_Array.add(i?.reviewsCount as Any)
                        self.mostreviewStart_ratingArray.add(i?.reviewsStarRating as Any)
                        self.most_entirehomeArray.add(i?.roomType as Any)
                        self.mostwishlist_Array.add(i?.wishListStatus as Any)
                        self.mostbookingTypeArray.add(i?.bookingType as Any)
                        
                    }
                    
                    
                    if self.mostListingArray.count > 0{
                        self.mostViewedTitle.text = "\(Utility.shared.getLanguage()?.value(forKey: "mostviewed") ?? "Most viewed")"
                        self.mostViewedTitle.isHidden = false
                        self.mostViewedCOllectionView.isHidden = false
                        self.mostViewedCOllectionHeightConstraint.constant = 200
                        self.mostViewedTitleTopConstraint.constant = 30
                        self.mostViewedCollectionTopConstraint.constant = 20
                        
                        
                        self.mostViewedTotalPage  = self.mostListingArray.count
                        mostViewedPageControl.inactiveTintColor = UIColor(named: "Review_Page_Line_Color")!
                        mostViewedPageControl.currentPageTintColor = Theme.Button_BG
                        self.mostViewedPageControl.radius = 4
                        self.mostViewedPageControl.padding = 6
                        mostViewedPageControl.numberOfPages = 0
                        
                        
                        mostViewedPageControl.currentPage = 0
                        
                        mostViewedCOllectionView.performBatchUpdates({
                            
                            
                            
                            self.mostViewedCOllectionView.reloadData()
                        }
                                                                     
                                                                     , completion: {
                            (result) in
                            let height = self.mostViewedCOllectionView.collectionViewLayout.collectionViewContentSize.height
                            self.mostViewedCOllectionHeightConstraint.constant = height
                            self.view.setNeedsLayout()
                            self.view.layoutIfNeeded()
                        })
                        
                        
                        //                self.populardestinationArray = (self.mostListingArray[0].popularLocationListing) as! [GetDefaultSettingQuery.Data.GetMostViewedListing.Result.PopularLocationListing]
                        ////                self.popularCollectionView.hideSkeleton()
                        ////                self.popularCollectionView.isSkeletonable = false
                        //                self.popularCollectionView.reloadData()
                        
                        //                self.popularCollectionView.performBatchUpdates(nil, completion: {
                        //                                    (result) in
                        //                                    if(Utility.shared.isRTLLanguage()){
                        //                                    if (self.populardestinationArray.count > 0){
                        //                                        self.popularCollectionView.scrollToItem(at:IndexPath(item:0, section: 0), at: .right, animated: true)
                        //                                    }
                        //
                        //                                        if (self.mostListingArray.count > 0){
                        //                                        self.mostViewedCOllectionView.scrollToItem(at:IndexPath(item:0, section: 0), at: .right, animated: true)
                        //                                    }
                        //
                        //                                    if (self.recommendListingArray.count > 0){
                        //                                        self.recommendedCollectionView.scrollToItem(at:IndexPath(item:0, section: 0), at: .right, animated: true)
                        //                                    }
                        //                                    }
                        //
                        //
                        //                                })
                        
                    }else{
                        self.mostViewedTitle.text = ""
                        self.mostViewedTitle.isHidden = true
                        self.mostViewedCOllectionView.isHidden = true
                        self.mostViewedTitleTopConstraint.constant = 0
                        self.mostViewedCollectionTopConstraint.constant = 0
                        self.mostViewedCOllectionHeightConstraint.constant = 0
                    }
                    
                    
                    
                    
                    
                    
                    guard (result.data?.getListingSettingsCommon?.results) != nil else{
                        return
                    }
                    self.RoomsFilterArray = ((result.data?.getListingSettingsCommon?.results)!) as! [PTProAPI.GetDefaultSettingQuery.Data.GetListingSettingsCommon.Result]
                    if let endval = (self.RoomsFilterArray[1].listSettings?[0]?.endValue) {
                        Utility.shared.maximum_guest_count = endval
                    }
                    if let startVal = (self.RoomsFilterArray[1].listSettings?[0]?.startValue) {
                        Utility.shared.min_filter_guest_count = startVal
                        
                        
                        Utility.shared.showbedRoomCount = false
                        //                Utility.shared.filterCount = startVal
                    }
                    
                    if let startVal = (self.RoomsFilterArray[4].listSettings?[0]?.startValue) {
                        Utility.shared.min_filter_bedroom_count = 0
                        
                        
                        Utility.shared.showbedRoomCount = false
                        //                Utility.shared.filterCount = startVal
                    }
                    if let startVal = (self.RoomsFilterArray[5].listSettings?[0]?.startValue) {
                        Utility.shared.min_filter_bed_count = 0
                        
                        
                        Utility.shared.showbedCount = false
                        //                Utility.shared.filterCount = startVal
                    }
                    if let startVal = (self.RoomsFilterArray[7].listSettings?[0]?.startValue) {
                        Utility.shared.min_filter_bath_count = 0
                        
                        
                        Utility.shared.showbathCount = false
                        //                Utility.shared.filterCount = startVal
                    }
                    
                    
                    
                    
                    
                    
                    self.getsearchPriceArray = ((result.data?.getSearchSettings?.results)!)
                    
                    
                    //            self.lottieView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
                    //            self.lottieView.isHidden = true
                    self.isAnimationCompleted = true
                    self.popularCollectionView.hideSkeleton()
                    self.popularCollectionView.isSkeletonable = false
                    if((result.data?.getRecommend?.results?.count == 0) && (result.data?.getMostViewedListing?.results?.count == 0)) {
                        self.exploreTV.isHidden = true
                        self.NoresultView.isHidden = false
                        self.scrollView.isHidden = true
                        
                        self.NoViewNoresult.isHidden = true
                        self.noViewFirstText.isHidden = true
                        self.noViewSecondText.isHidden = true
                        self.NoViewthirdText.isHidden = true
                        self.NoListingFoundImage.isHidden = false
                        self.NoListingFoundTitle.isHidden = false
                        self.floatingMapView.isHidden = true
                        self.NoresultView.frame = CGRect(x: 0, y: self.headerView.frame.size.height+self.headerView.frame.origin.y+25, width: FULLWIDTH, height:FULLHEIGHT-110)
                    }
                    else
                    {
                        self.exploreTV.isHidden = true
                        self.NoresultView.isHidden = true
                        self.scrollView.isHidden = false
                    }
                    self.floatingMapView.isHidden = true
                case .failure(let error):
                    self.view.makeToast(error.localizedDescription)
                }
            }
        }
        
        else{
            self.exploreTV.isHidden = true
            //            self.lottieView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            //            self.lottieView.isHidden = true
            self.popularCollectionView.showAnimatedSkeleton()
            self.recommendedCollectionView.showAnimatedSkeleton()
            self.mostViewedCOllectionView.showAnimatedSkeleton()
            
            collectionViewFilterPage?.prepareSkeleton(completion: { [self] done in
                self.collectionViewFilterPage?.isSkeletonable = true
                self.collectionViewFilterPage?.showAnimatedGradientSkeleton()
            })
            
            self.offlineView.isHidden = false
            self.scrollView.isHidden = false
            let shadowSize2 : CGFloat = 3.0
            let shadowPath2 = UIBezierPath(rect: CGRect(x: -shadowSize2 / 2,
                                                        y: -shadowSize2 / 2,
                                                        width: self.offlineView.frame.size.width + shadowSize2,
                                                        height: self.offlineView.frame.size.height + shadowSize2))
            
            self.offlineView.layer.masksToBounds = false
            self.offlineView.layer.shadowColor = Theme.TextLightColor.cgColor
            self.offlineView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            self.offlineView.layer.shadowOpacity = 0.3
            self.offlineView.layer.shadowPath = shadowPath2.cgPath
            if IS_IPHONE_X || IS_IPHONE_XR{
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-150, width: FULLWIDTH, height: 55)
            }else{
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-110, width: FULLWIDTH, height: 55)
            }
            
        }
        
        
    }
    
    func getImageBannerFromAdmin(){
        let getImageBanner = PTProAPI.GetImageBannerQuery()
        Network.shared.apollo_headerClient.fetch(query: getImageBanner,cachePolicy:.fetchIgnoringCacheData){ response in
            switch response {
            case .success(let result):
                guard (result.data?.getImageBanner?.result) != nil else {
                    self.becomeAHostView.isHidden = true
                    self.becomeAHostTopConstraint.constant = 0
                    self.becomeAHostHeightConstraint.constant = 0
                    return
                }
                self.becomeAHostView.isHidden = false
                self.becomeAHostTopConstraint.constant = 20
                self.becomeAHostHeightConstraint.constant = 285
                self.becomeAHostView.isSkeletonable = false
                self.becomeAHostView.hideSkeleton()
                //                self.hostTitleLabel.text = "\(response.data?.getImageBanner?.result?.title ?? "") \(response.data?.getImageBanner?.result?.description ?? "")"
                
                let attributes = [
                    NSAttributedString.Key.font: UIFont(name: APP_FONT_SEMIBOLD, size: 24.0),
                    NSAttributedString.Key.foregroundColor: Theme.Button_BG
                ]
                let attributedString = NSMutableAttributedString(string: "\(result.data?.getImageBanner?.result?.title ?? "") "  , attributes: attributes as [NSAttributedString.Key : Any])
                let attributes2 = [
                    NSAttributedString.Key.font: UIFont(name: APP_FONT_SEMIBOLD, size: 24.0),
                    NSAttributedString.Key.foregroundColor: UIColor.white
                ]
                let attributedString2 = NSMutableAttributedString(string: "\(result.data?.getImageBanner?.result?.description ?? "")", attributes: attributes2 as [NSAttributedString.Key : Any])
                
                attributedString.append(attributedString2)
                
                self.hostTitleLabel.attributedText = attributedString
                
                
                self.hostBtn.setTitle(result.data?.getImageBanner?.result?.buttonLabel ?? "Host", for: .normal)
                if let imageBanner = result.data?.getImageBanner?.result?.image{
                    self.hostSamepleImageView.sd_setImage(with: URL(string: "\(Banner_URL)\(imageBanner)"), placeholderImage: #imageLiteral(resourceName: "placeholderimg"))
                }
                if Utility.shared.isRTLLanguage(){
                    self.hostTransparentImageView.performRTLTransform()
                }
            case .failure(_): break
            }
        }
    }

    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    func searchListingAPICall()
{
    if Utility.shared.isConnectedToNetwork(){
        //            self.lottieAnimation()
        self.exploreTV.isHidden = true
        self.offlineView.isHidden = true
        self.NoresultView.isHidden = true
                
        var lat = Double()
        var lon = Double()
        var bookingtype = String()
        
        if((Utility.shared.searchLocationDict.value(forKey: "lat") != nil) && (Utility.shared.searchLocationDict.value(forKey: "lon") != nil))
        {
            lat  = Utility.shared.searchLocationDict.value(forKey: "lat") as! Double
            lon  = Utility.shared.searchLocationDict.value(forKey: "lon") as! Double
        }
        else{
            lat = 0.0
            lon = 0.0
        }
        if(Utility.shared.filterCount != 0)
        {
            guest_filter = Utility.shared.filterCount
        }
        
        if(Utility.shared.amenitiesArray.count == 0)
        {
            Utility.shared.amenitiesArray = []
        }
        if(Utility.shared.roomtypeArray.count == 0)
        {
            Utility.shared.roomtypeArray = []
        }
        if(Utility.shared.facilitiesArray.count == 0)
        {
            Utility.shared.facilitiesArray = []
        }
        if(Utility.shared.houseRulesArray.count == 0)
        {
            Utility.shared.houseRulesArray = []
        }
        if(Utility.shared.roomtypeArray.count == 0)
        {
            Utility.shared.roomtypeArray = []
        }
        if(Utility.shared.priceRangeArray.count == 0)
        {
            Utility.shared.priceRangeArray = []
        }
        if(Utility.shared.locationfromSearch == nil)
        {
            Utility.shared.locationfromSearch = ""
        }
        if(Utility.shared.isSwitchEnable == true)
        {
            bookingtype = "instant"
        }
        var currency = String()
        if(Utility.shared.getPreferredCurrency() == nil)
        {
            currency = Utility.shared.currencyvalue_from_API_base
        }
        else{
            currency = Utility.shared.getPreferredCurrency()!
        }
        
        self.collectionViewFilterPage.isHidden = PageIndex == 1 ? false : false
        var searchListingquery = PTProAPI.SearchListingQuery(personCapacity: .some(guest_filter), currentPage: .some(PageIndex), dates:  .some("'\( Utility.shared.selectedstartDate_filter)' AND '\(Utility.shared.selectedEndDate_filter)'"), lat: 0, lng: 0, amenities: .some(Utility.shared.amenitiesArray as! [Int]), beds: .some(Utility.shared.beds_count as Int), bedrooms:.some(Utility.shared.bedrooms_count as Int), bathrooms:.some(Utility.shared.bathroom_count as Int), roomType: .some((Utility.shared.roomtypeArray as? [Int] ?? [])), spaces:.some(Utility.shared.facilitiesArray as! [Int]), houseRules: .some(Utility.shared.houseRulesArray as! [Int]), priceRange: .some(Utility.shared.priceRangeArray as! [Int]), geoType: .none, geography:.none , bookingType: .some(bookingtype), address: .some(Utility.shared.locationfromSearch),currency: .some(currency))
        self.scrollView.isHidden = true
        Network.shared.apollo_headerClient.fetch(query: searchListingquery,cachePolicy:.fetchIgnoringCacheData){ response in
            self.scrollView.isHidden = false
            self.searchViewTopConstraint.constant = 0
            self.exploreTitleLabel.text = ""
            self.exploreTitleLabel.isHidden = true
            
            switch response {
            case .success(let result):
                guard let searchListingValues = result.data?.searchListing?.results else{
                    print("Missing Data")
                    
                    self.collectionViewFilterPage.hideSkeleton()
                    self.collectionViewFilterPage?.isSkeletonable = false
                    
                    self.isFilterEnable = true
                    self.searchBackBtn.backgroundColor =  UIColor(named: "viewBG")
                    self.searchBackBtn.setImage(#imageLiteral(resourceName: "back_black"), for: .normal)
                    
                    self.locationLabel.textColor = UIColor(named: "Title_Header")
                    self.headerView.backgroundColor =  UIColor(named: "becomeAHostStep_Color")
                    self.exploreTV.isHidden = true
                    self.collectionViewFilterPage.isHidden = true
                    self.NoresultView.isHidden = false
                    self.scrollView.isHidden = true
                    self.NoViewNoresult.isHidden = false
                    self.noViewFirstText.isHidden = false
                    self.noViewSecondText.isHidden = false
                    self.NoViewthirdText.isHidden = false
                    self.NoListingFoundImage.image = #imageLiteral(resourceName: "NoSearchImg")
                    self.NoListingFoundTitle.isHidden = true
                    self.floatingMapView.isHidden = true
                    //                self.lottieView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
                    //               self.lottieView.isHidden = true
                    self.NoresultView.frame = CGRect(x: 0, y: self.headerView.frame.size.height+self.headerView.frame.origin.y+25, width: FULLWIDTH, height:FULLHEIGHT-110)
                    
                    //            self.lottieView.isHidden = true
                    //            self.view.makeToast(result.data?.searchListing?.errorMessage)
                    return
                }
                
                if((result.data?.searchListing?.count)!>0) {
                    self.NoresultView.isHidden = true
                    self.scrollView.isHidden = false
                    self.exploreTV.isHidden = true
                    self.collectionViewFilterPage.isSkeletonable = false
                    self.collectionViewFilterPage.hideSkeleton()
                    self.floatingMapView.isHidden = false
                    self.isFilterEnable = true
                    self.newFilterBtn.layer.shadowOpacity = 0.0
                    self.searchView.layer.shadowOpacity = 0.0
                    self.searchBackBtn.backgroundColor =  UIColor(named: "viewBG")
                    self.headerView.backgroundColor =  UIColor(named: "becomeAHostStep_Color")
                    self.locationLabel.textColor =  UIColor(named: "Title_Header")
                    if(Utility.shared.isRTLLanguage()){
                        
                        self.searchBackBtn.setImage(#imageLiteral(resourceName: "back_black"), for: .normal)
                        
                        self.searchBackBtn.rotateImageViewofBtn()
                    }else{
                        self.searchBackBtn.setImage(#imageLiteral(resourceName: "back_black"), for: .normal)
                        
                    }
                    
                    
                    
                    
                    
                    if(result.data?.searchListing?.currentPage == 1){
                        self.FilterArray.removeAll()
                    }
                    
                    self.FilterArray.append(contentsOf: ((result.data?.searchListing?.results)!) as! [PTProAPI.SearchListingQuery.Data.SearchListing.Result])
                    
                    self.collectionViewFilterPage.isHidden = false
                    self.totalListcount = (result.data?.searchListing?.count)!
                    //                self.lottieView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
                    //            self.lottieView.isHidden = true
                    
                    self.exploreTV?.reloadData()
                    
                    
                    self.collectionViewFilterPage.reloadData()
                    if (result.data?.searchListing?.currentPage == 1) &&  self.FilterArray.count != 0 {
                        self.collectionViewFilterPage.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: false)
                    }
                    
                    if self.FilterArray.count != 0 {
                        self.viewDidLayoutSubviews()
                    }
                    
                }
                else {
                    self.collectionViewFilterPage?.isSkeletonable = false
                    self.collectionViewFilterPage.hideSkeleton()
                    self.isFilterEnable = true
                    self.searchBackBtn.backgroundColor =  UIColor(named: "viewBG")
                    self.searchBackBtn.setImage(#imageLiteral(resourceName: "back_black"), for: .normal)
                    
                    self.locationLabel.textColor =  UIColor(named: "Title_Header")
                    self.headerView.backgroundColor =  UIColor(named: "becomeAHostStep_Color")
                    self.exploreTV.isHidden = true
                    self.collectionViewFilterPage.isHidden = true
                    self.NoresultView.isHidden = false
                    self.scrollView.isHidden = true
                    self.NoViewNoresult.isHidden = false
                    self.noViewFirstText.isHidden = false
                    self.noViewSecondText.isHidden = false
                    self.NoViewthirdText.isHidden = false
                    self.NoListingFoundImage.image = #imageLiteral(resourceName: "NoSearchImg")
                    self.NoListingFoundTitle.isHidden = true
                    self.floatingMapView.isHidden = true
                    //                self.lottieView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
                    //               self.lottieView.isHidden = true
                    self.NoresultView.frame = CGRect(x: 0, y: self.headerView.frame.size.height+self.headerView.frame.origin.y+25, width: FULLWIDTH, height:FULLHEIGHT-110)
                    
                }
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
            }
        }
    }
    else{
        self.exploreTV.isHidden = true
        self.offlineView.isHidden = false
        
        collectionViewFilterPage?.prepareSkeleton(completion: { [self] done in
            self.collectionViewFilterPage?.isSkeletonable = true
            self.collectionViewFilterPage?.showAnimatedGradientSkeleton()
        })
        //             self.collectionViewFilterPage.isHidden = true
        let shadowSize2 : CGFloat = 3.0
        let shadowPath2 = UIBezierPath(rect: CGRect(x: -shadowSize2 / 2,
                                                    y: -shadowSize2 / 2,
                                                    width: self.offlineView.frame.size.width + shadowSize2,
                                                    height: self.offlineView.frame.size.height + shadowSize2))
        
        self.offlineView.layer.masksToBounds = false
        self.offlineView.layer.shadowColor = Theme.TextLightColor.cgColor
        self.offlineView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.offlineView.layer.shadowOpacity = 0.3
        self.offlineView.layer.shadowPath = shadowPath2.cgPath
        if IS_IPHONE_X || IS_IPHONE_XR {
            offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-150, width: FULLWIDTH, height: 55)
        }else{
            offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-100, width: FULLWIDTH, height: 55)
        }
        
        
    }
    
}
    //MARK ******************************************* IMAGESCROLLER DELEGATE METHODS **************************************************************>
    

    @objc func pageChanged(_ sender: UISwipeGestureRecognizer) {
          Pagecontrol.currentPage = sender.view!.tag
        Pagecontrol.inactiveTintColor = UIColor(named: "Review_Page_Line_Color")!
    }
    //MARK ********************************************* LOADMORE FUNCTIONALITY CALL ***************************************************************>
    
    private func isLoadingIndexPath(_ indexPath: IndexPath) -> Bool {
        return indexPath.row == self.FilterArray.count - 1
    }
    
      func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
     {

        var totalPages = Int()

        let last_element = FilterArray.count - 1
        if(indexPath.item == last_element && isFilterEnable)
        {
            if(self.totalListcount % 10 == 0)
            {
                totalPages = (self.totalListcount/10)
            }
            else{
                totalPages = (self.totalListcount/10) + 1
            }
            if(totalPages >= PageIndex){
                self.PageIndex = self.PageIndex + 1
                self.searchListingAPICall()
            }
        }
    }
    //MARK***************************************************** CURRENCY CONVERSION FUNCTION *******************************************************************>
  
    
    }


extension ExplorePageVC: searchPageProtocol{
    func callSearchAPI() {
        
        if Utility.shared.locationfromSearch == "empty" {
              Utility.shared.locationfromSearch = ""
            self.locationLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"losangeles") ?? "Where do you go?")"
              locationLabel.textColor =  UIColor(named: "Title_Header")
              self.PageIndex = 1
              self.FilterArray.removeAll()
            collectionViewFilterPage?.prepareSkeleton(completion: { [self] done in
                self.collectionViewFilterPage?.isSkeletonable = true
                self.collectionViewFilterPage?.showAnimatedGradientSkeleton()
            })
              self.collectionViewFilterPage.reloadData()
              self.searchListingAPICall()
          }
       else if Utility.shared.locationfromSearch != nil && Utility.shared.locationfromSearch != ""{
            self.locationLabel.text = Utility.shared.locationfromSearch
            locationLabel.textColor =  UIColor(named: "Title_Header")
            self.PageIndex = 1
            self.FilterArray.removeAll()
           collectionViewFilterPage?.prepareSkeleton(completion: { [self] done in
               self.collectionViewFilterPage?.isSkeletonable = true
               self.collectionViewFilterPage?.showAnimatedGradientSkeleton()
           })
            self.collectionViewFilterPage.reloadData()
            self.searchListingAPICall()
          
           if (Utility.shared.TotalFilterCount == 0){
               self.newFilterBtn.backgroundColor =  UIColor(named: "colorController")
               newFilterBtn.setImage(#imageLiteral(resourceName: "explore_filter"), for: .normal)
           }
           else {
               self.newFilterBtn.backgroundColor = Theme.PRIMARY_COLOR
               newFilterBtn.setImage(#imageLiteral(resourceName: "filterblue"), for: .normal)
           }
        }
     
        
        else{
            self.locationLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"losangeles") ?? "Where do you go?")"
            
            if (Utility.shared.TotalFilterCount == 0){
                self.popularAPICall()
                self.newFilterBtn.backgroundColor = UIColor(named: "colorController")
                newFilterBtn.setImage(#imageLiteral(resourceName: "explore_filter"), for: .normal)
                self.MostViewedListingAPICall()
               
            }else{
                self.PageIndex = 1
                self.newFilterBtn.backgroundColor = Theme.PRIMARY_COLOR
               
                    newFilterBtn.setImage(#imageLiteral(resourceName: "filterblue"), for: .normal)
               
                self.FilterArray.removeAll()
                collectionViewFilterPage?.prepareSkeleton(completion: { [self] done in
                    self.collectionViewFilterPage?.isSkeletonable = true
                    self.collectionViewFilterPage?.showAnimatedGradientSkeleton()
                })
                self.collectionViewFilterPage.reloadData()
                self.searchListingAPICall()
            }
        }
        
    }
    
    
    
}

extension ExplorePageVC{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == recommendedCollectionView{
            
           
                let visibleRect = CGRect(origin: recommendedCollectionView.contentOffset, size: recommendedCollectionView.bounds.size)
                let visiblePoint = CGPoint(x: visibleRect.origin.x + 50, y: visibleRect.midY)
                guard let visibleIndexpath = recommendedCollectionView.indexPathForItem(at: visiblePoint) else{
                    return
                }
                
            recommendedPageControl.setCurrentPage(at: visibleIndexpath.row)
               
    }
        
          if scrollView == mostViewedCOllectionView{
            
           
                let visibleRect = CGRect(origin: mostViewedCOllectionView.contentOffset, size: mostViewedCOllectionView.bounds.size)
           
              let visiblePoint = CGPoint(x: visibleRect.origin.x + 50, y: visibleRect.midY)
                guard let visibleIndexpath = mostViewedCOllectionView.indexPathForItem(at: visiblePoint) else{
                    return
            }
            
              print(visibleIndexpath.row)
                mostViewedPageControl.currentPage = visibleIndexpath.row
              
               
    }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == mostViewedCOllectionView{
        for cell in mostViewedCOllectionView.visibleCells {
            let indexPath = mostViewedCOllectionView.indexPath(for: cell)
            print(indexPath?.row)
           
        }
        }
    }
    
    }
    

class CustomUITextField: UITextField {
   override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return true
        }
        return false
   }
}
    
