//
//  SaveGroupPageVC.swift
//  App
//
//  Created by RadicalStart on 09/07/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit
import Lottie
import Apollo
import SkeletonView
import PTProAPI

protocol SaveGroupPageVCDelegate: class {
    func whishDeleteAPIcall()
}

class SaveGroupPageVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,GuestDetailVCDelegate,UICollectionViewDelegateFlowLayout, SkeletonCollectionViewDataSource, CreateListVCProtocol {
    func updateWhishlistStatus(status: Bool, title: String) {
        self.wishlistTitle.text = title
    }
    




    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: "SaveGroupPageVC", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBOutlet var cancelBtn: UIButton!

    @IBOutlet var updateBtn: UIButton!
    @IBOutlet var editTextView: UITextView!
    @IBOutlet var editpageTitle: UILabel!
    @IBOutlet var editPageView: UIView!
    @IBOutlet weak var retryBtn: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var startexploringBtn: UIButton!
    @IBOutlet weak var nothingsaveLabel: UILabel!
    @IBOutlet weak var nothingsavedesLabel: UILabel!
    @IBOutlet weak var nowhishlistView: UIView!
    @IBOutlet weak var wishlistTitle: UILabel!
    var groupwhishlistArray = [GetWishListGroupQuery.Data.GetWishListGroup.Results.WishList]()
    @IBOutlet weak var offlineView: UIView!
    @IBOutlet weak var groupCollection: UICollectionView!
    @IBOutlet weak var topView: UIView!
    var lottieView: LottieAnimationView!
    var groupID = Int()
    var delegate: SaveGroupPageVCDelegate?
    var whishlistTitle = String()

    @IBOutlet weak var BackBtn: UIButton!

    var totalListcount:Int = 0
    var PageIndex : Int = 1




    override func viewDidLoad() {
        super.viewDidLoad()
        self.lottieAnimation()
        self.initialsetup()
        offlineView.backgroundColor =  UIColor(named: "Button_Grey_Color")
        
        self.view.backgroundColor =   UIColor(named: "colorController")
        groupCollection.backgroundColor =  UIColor(named: "colorController")

        self.BackBtn.setImage(UIImage(named: "left_arrow"), for: .normal)
        self.BackBtn.setTitle("", for: .normal)
        self.BackBtn.backgroundColor = Theme.ButtonBack_BG
        self.BackBtn.layer.cornerRadius = self.BackBtn.frame.size.height/2
        self.BackBtn.clipsToBounds = true

        if Utility.shared.isRTLLanguage(){
            self.BackBtn.rotateImageViewofBtn()
        }

        self.tabBarController?.tabBar.isHidden = false
        self.wishlistTitle.text = whishlistTitle
        self.wishlistTitle.textColor = UIColor(named: "Title_Header")
        self.wishlistTitle.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        self.wishlistTitle.font = UIFont(name: APP_FONT_MEDIUM, size: 18)

        // Do any additional setup after loading the view.
    }

    @IBAction func startExploringtapped(_ sender: Any) {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        Utility.shared.setTab(index: 0)
//        Utility.shared.isfromfloatmap_Page = false
//
//        self.view.window?.rootViewController?.dismiss(animated: false, completion: nil)
//        appDelegate.GuestTabbarInitialize(initialView: CustomTabbar())
        self.dismiss(animated: true, completion: nil)
        if let tabBarController = self.view.window!.rootViewController as? CustomTabbar {
             Utility.shared.setTab(index: 0)
            tabBarController.selectedIndex = 0
        }


    }

    func removeWhishlistAPICall() {
       // self.initialsetup()
        self.groupwhishlistArray.removeAll()
         self.savedGroupAPICall(groupID: groupID, PageIndex: 1)

    }

    override func viewWillAppear(_ animated: Bool) {

    }
    @IBAction func backBtnTapped(_ sender: Any) {

//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        self.dismiss(animated: false, completion: {
//            self.navigationController?.popToRootViewController(animated: true)
//            if let tabBarController = appDelegate.window!.rootViewController as? CustomTabbar {
//                Utility.shared.setTab(index: 1)
//                tabBarController.selectedIndex = 1
//            }
//        })
        self.delegate?.whishDeleteAPIcall()

        self.dismiss(animated: true, completion: nil)

//        Utility.shared.setTab(index: 1)
//        Utility.shared.isfromfloatmap_Page = false
//        self.view.window?.rootViewController?.dismiss(animated:false, completion: nil)
//        self.view.window?.backgroundColor = .white
//        appDelegate.GuestTabbarInitialize(initialView: CustomTabbar())

       //
    }
    @IBAction func moreBtnTapped(_ sender: Any) {
        let actionSheetController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
    
        // create an action
        let firstAction: UIAlertAction = UIAlertAction(title: "\((Utility.shared.getLanguage()?.value(forKey:"delete"))!)", style: .destructive) { action -> Void in
            self.deleteAPICall()
        }

        let cancelAction: UIAlertAction = UIAlertAction(title: "\((Utility.shared.getLanguage()?.value(forKey:"cancel"))!)", style: .cancel) { action -> Void in }

        // add actions
        actionSheetController.addAction(firstAction)
        actionSheetController.addAction(cancelAction)

        // present an actionSheet...
        present(actionSheetController, animated: true, completion: nil)
    }
    func initialsetup()
    {
        groupCollection.register(UINib(nibName: "customUpdatedCell", bundle: nil), forCellWithReuseIdentifier: "CellcustomUpdated")
        self.groupCollection.layoutSkeletonIfNeeded()
        groupCollection?.isSkeletonable = true
        self.groupCollection?.showAnimatedGradientSkeleton()

        self.view.bringSubviewToFront(groupCollection)
        if let flowLayout = groupCollection.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.itemSize = CGSize(width: (FULLWIDTH-40), height:270)
            flowLayout.scrollDirection = .vertical
        }

        if(Utility.shared.isRTLLanguage()) {
            nothingsaveLabel.textAlignment = .right
            nothingsavedesLabel.textAlignment = .right
            startexploringBtn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.right
        }

        self.offlineView.isHidden = true
        errorLabel.textColor =  UIColor(named: "Title_Header")
        retryBtn.setTitleColor(Theme.PRIMARY_COLOR, for: .normal)
        errorLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"error_field"))!)"
        retryBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"retry"))!)", for:.normal)
        nothingsaveLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"nothingsaveyet"))!)"
        nothingsaveLabel.textColor = UIColor(named: "Title_Header")
        nothingsavedesLabel.textColor =  UIColor(named: "searchPlaces_TextColor")
        nothingsavedesLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"savedescription"))!)"
        startexploringBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"startexploring"))!)", for:.normal)
        startexploringBtn.setTitleColor(Theme.PRIMARY_COLOR, for: .normal)
        retryBtn.setTitleColor(Theme.PRIMARY_COLOR, for: .normal)
        nothingsavedesLabel.font = UIFont(name: APP_FONT, size: 18)
        nothingsaveLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 18)
        errorLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 15)
        retryBtn.titleLabel?.font = UIFont(name: APP_FONT, size: 15)
        startexploringBtn.titleLabel?.font = UIFont(name: APP_FONT_MEDIUM, size:17)
    }

    // Lottie AnimationView ******

    func lottieAnimation(){
        lottieView = LottieAnimationView.init(name:"animation")
        lottieView.isHidden = true
        self.lottieView.frame = CGRect(x:FULLWIDTH/2-40, y:FULLHEIGHT/2-150, width:100, height:100)
        self.groupCollection.addSubview(self.lottieView)
        self.lottieView.backgroundColor = UIColor.clear
        self.lottieView.layer.cornerRadius = 6.0
        self.lottieView.clipsToBounds = true
        self.lottieView.play()
        Timer.scheduledTimer(timeInterval:0.3, target: self, selector: #selector(autoscroll), userInfo: nil, repeats: true)
    }
    @objc func autoscroll()
    {
        self.lottieView.play()
    }
    @IBAction func retryBtnTapped(_ sender: Any) {
        if Utility.shared.isConnectedToNetwork(){
        self.offlineView.isHidden = true
        }
    }

    func savedGroupAPICall(groupID:Int,PageIndex:Int)
    {
        if Utility.shared.isConnectedToNetwork(){
            let getwhishlistgroupquery = GetWishListGroupQuery(id: groupID, currentPage: .some(PageIndex))
            Network.shared.apollo_headerClient.fetch(query: getwhishlistgroupquery,cachePolicy:.fetchIgnoringCacheData){  response in
                self.lottieView.isHidden = true
                switch response {
                case .success(let result):
                    guard (result.data?.getWishListGroup?.results) != nil else{
                        print("Missing Data")
                        self.nowhishlistView.isHidden = false
                        self.groupCollection.isHidden = true
                        return
                    }
                    if result.data?.getWishListGroup?.status == 200 {
                        
                        self.whishlistTitle = result.data?.getWishListGroup?.results?.name ?? ""
                        self.wishlistTitle.text = self.whishlistTitle
                        self.totalListcount = ((result.data?.getWishListGroup?.results?.wishListCount!)!)
                        
                        if((result.data?.getWishListGroup?.results?.wishLists!.count)! > 0)
                        {
                            self.nowhishlistView.isHidden = true
                            
                            self.groupwhishlistArray.append(contentsOf:(((result.data?.getWishListGroup?.results?.wishLists!)!) as! [GetWishListGroupQuery.Data.GetWishListGroup.Results.WishList]))
                            self.groupCollection.hideSkeleton()
                            self.groupCollection.isSkeletonable = false
                            self.groupCollection.reloadData()
                        }
                        else
                        {
                            if(self.groupwhishlistArray.count == 0)
                            {
                                self.nowhishlistView.isHidden = false
                                self.groupCollection.isHidden = true
                                self.groupCollection.hideSkeleton()
                                self.groupCollection.isSkeletonable = false
                            }
                        }
                    }else{
                        self.nowhishlistView.isHidden = false
                        self.groupCollection.isHidden = true
                        self.groupCollection.hideSkeleton()
                        self.groupCollection.isSkeletonable = false
                    }
                case .failure(let error):
                    self.view.makeToast(error.localizedDescription)
                }
            }
        }
        else
        {
            self.offlineView.isHidden = false
            self.groupCollection.isHidden = false
            self.groupCollection.layoutSkeletonIfNeeded()
            self.groupCollection.isSkeletonable = true
            self.groupCollection.showAnimatedGradientSkeleton()
            
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
                self.offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-130, width: FULLWIDTH, height: 55)
            }else{
                self.offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-100, width: FULLWIDTH, height: 55)
            }
        }
    }

    func createWhishlistAPICall(listId:Int,wishListGroupId:Int,eventKey:Bool)
    {
        let createWhishlistMutation = CreateWishListMutation(listId: listId, wishListGroupId: .some(wishListGroupId), eventKey: .some(eventKey))
        Network.shared.apollo_headerClient.perform(mutation: createWhishlistMutation){  response in
            switch response {
            case .success(let result):
                if let data = result.data?.createWishList?.status,data == 200 {
                    self.groupwhishlistArray.removeAll()
                    self.savedGroupAPICall(groupID: self.groupID, PageIndex:1)
                } else {
                    self.view.makeToast(result.data?.createWishList?.errorMessage!)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
            }
        }
    }

    func createWhishlistAPICall()
    {
        if Utility.shared.isConnectedToNetwork(){
            let createWhishlistMutation = CreateWishListGroupMutation(name:editTextView.text!,isPublic: .none, id: .none)
            Network.shared.apollo_headerClient.perform(mutation: createWhishlistMutation){ [self] response in
                switch response {
                case .success(let result):
                    if let data = result.data?.createWishListGroup?.status,data == 200 {
                        editPageView.removeFromSuperview()
                        self.wishlistTitle.text = result.data?.createWishListGroup?.results?.name
                        
                        //                    self.createWhishlistAPICalls(listId: self.listID, wishListGroupId: (result.data?.createWishListGroup?.results?.id)!, eventKey: true)
                        //
                        //                    self.delegate?.updateWhishlistStatus(status:true)
                    } else {
                        self.view.makeToast(result.data?.createWishListGroup?.errorMessage)
                    }
                case .failure(let error):
                    self.view.makeToast(error.localizedDescription)
                }
                
            }
        }
        else
        {
            self.lottieView.isHidden = true
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
            if IS_IPHONE_X || IS_IPHONE_XR{
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-130, width: FULLWIDTH, height: 55)
            }else{
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-100, width: FULLWIDTH, height: 55)
            }
        }
    }

    func deleteAPICall()
    {
        if Utility.shared.isConnectedToNetwork(){
            let deletewhishlistMutation = DeleteWishListGroupMutation(id: groupID)
            Network.shared.apollo_headerClient.perform(mutation: deletewhishlistMutation){  response in
                switch response {
                case .success(let result):
                    if let data = result.data?.deleteWishListGroup?.status,data == 200 {
                        self.delegate?.whishDeleteAPIcall()
                        self.dismiss(animated: true, completion: nil)
                    } else {
                        self.view.makeToast(result.data?.deleteWishListGroup?.errorMessage!)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            self.dismiss(animated: true, completion: nil)
                        }
                    }
                case .failure(let error):
                    self.view.makeToast(error.localizedDescription)
                }
                
            }
        }
        else
        {
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
                self.offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-130, width: FULLWIDTH, height: 55)
            }else{
                self.offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-100, width: FULLWIDTH, height: 55)
            }
        }
        
    }



        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return groupwhishlistArray.count
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
             return CGSize(width: (FULLWIDTH-40), height:340)
        }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {


        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellcustomUpdated", for: indexPath)as! customUpdatedCell
        cell.listTitleLabel.font = UIFont(name:APP_FONT_MEDIUM, size: 16)
        cell.leftConstant.constant = 0
        if Utility.shared.isRTLLanguage(){
            cell.thunderTop.constant = 21.5
        }
        else {
            cell.thunderTop.constant = 23.5
        }
        cell.heightConstant.constant = 225
        cell.heartBtnTrailing.constant = 12
        cell.lineView.isHidden = true
        var listTypeString = ""
        listTypeString = "\(self.groupwhishlistArray[indexPath.row].listData?.roomType ?? "")"
        if ((self.groupwhishlistArray[indexPath.row].listData?.beds ?? 0) > 1){
            listTypeString = listTypeString + " / " + "\(self.groupwhishlistArray[indexPath.row].listData?.beds ?? 0)" + " beds"
        }else if ((self.groupwhishlistArray[indexPath.row].listData?.beds ?? 0) == 1){
            listTypeString = listTypeString + " / " + "\(self.groupwhishlistArray[indexPath.row].listData?.beds ?? 0)" + " bed"
        }
        cell.listTypeLabel.text = listTypeString
        cell.listTypeLabel.textColor = UIColor(named: "searchPlaces_TextColor")

//        let newConstraint = cell.imageHeightConstraint.constraintWithMultiplier(0.65)
//        cell.removeConstraint(cell.imageHeightConstraint)
//        cell.addConstraint(newConstraint)
//        cell.layoutIfNeeded()
//        cell.imageHeightConstraint = newConstraint

        if let listimage = groupwhishlistArray[indexPath.row].listData?.listPhotoName{
            cell.imageView.sd_setImage(with: URL(string: "\(IMAGE_LISTING_MEDIUM)\(listimage)"), placeholderImage: #imageLiteral(resourceName: "placeholderimg"))
            cell.imageView.contentMode = .scaleAspectFill
        }else{
            cell.imageView.image = #imageLiteral(resourceName: "placeholderimg")
        }

        cell.listTitleLabel.text = self.groupwhishlistArray[indexPath.row].listData?.title ?? ""

        cell.lightningImageView.isHidden = self.groupwhishlistArray[indexPath.row].listData?.bookingType != "instant"

                cell.heartBtn.setImage(#imageLiteral(resourceName: "like"), for: .normal)
                cell.heartBtn.tag = indexPath.row
                cell.heartBtn.addTarget(self, action: #selector(likeBtnTapped), for: .touchUpInside)


        if(Utility.shared.getPreferredCurrency() != nil && Utility.shared.getPreferredCurrency() != "")
        {
            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!)
            let from_currency = groupwhishlistArray[indexPath.row].listData?.listingData?.currency!
            let currency_amount = groupwhishlistArray[indexPath.row].listData?.listingData?.basePrice != nil ? groupwhishlistArray[indexPath.row].listData?.listingData?.basePrice! : 0
            let price_value = Utility.shared.getCurrencyRate(basecurrency:Utility.shared.currencyvalue_from_API_base,fromCurrency:from_currency!, toCurrency:Utility.shared.getPreferredCurrency()!, CurrencyRate:Utility.shared.currency_Dict, amount:currency_amount!)
            let restricted_price =  Double(String(format: "%.2f",price_value))
            cell.listPriceLabel.text = "\(currencysymbol!)\(restricted_price!.clean) / \(Utility.shared.getLanguage()?.value(forKey:"night") ?? "Night")"

            let attributes = [
                NSAttributedString.Key.font: UIFont(name: APP_FONT_SEMIBOLD, size: 22),
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
            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode:Utility.shared.currencyvalue_from_API_base)
            let from_currency = groupwhishlistArray[indexPath.row].listData?.listingData?.currency!
            let currency_amount = groupwhishlistArray[indexPath.row].listData?.listingData?.basePrice != nil ? groupwhishlistArray[indexPath.row].listData?.listingData?.basePrice! : 0
            let price_value = Utility.shared.getCurrencyRate(basecurrency:Utility.shared.currencyvalue_from_API_base, fromCurrency:from_currency!, toCurrency:Utility.shared.currencyvalue_from_API_base, CurrencyRate:Utility.shared.currency_Dict, amount:currency_amount!)
            let restricted_price =  Double(String(format: "%.2f",price_value))
            cell.listPriceLabel.text = "\(currencysymbol!)\(restricted_price!.clean) / \(Utility.shared.getLanguage()?.value(forKey:"night") ?? "Night")"
            let attributes = [
                NSAttributedString.Key.font: UIFont(name: APP_FONT_SEMIBOLD, size: 22),
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

        let value1 = Float(self.groupwhishlistArray[indexPath.row].listData?.reviewsCount ?? 0)
        let value2 = Float(self.groupwhishlistArray[indexPath.row].listData?.reviewsStarRating ?? 0)
        if(value2 != 0.0){
            let dividedValue = value2/value1
            cell.ratingLabel.text = "\(Int(dividedValue.rounded()))"
            cell.ratingView.isHidden = false
        }else{
            cell.ratingLabel.text = "0.0"
            cell.ratingView.isHidden = true
        }

    return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if groupwhishlistArray.count > 0 {
            let viewListing = UpdatedViewListing()
            viewListing.listID = groupwhishlistArray[indexPath.row].listId ?? 0
            Utility.shared.unpublish_preview_check = false
            viewListing.modalPresentationStyle = .fullScreen
            self.present(viewListing, animated: true, completion: nil)
        }
    }

    @IBAction func editBtnTapped(_ sender: Any) {
        
        let createListObj = CreateListVC()
        createListObj.groupID = self.groupID
        createListObj.title_data = self.wishlistTitle.text!
        createListObj.isFromSave = true
        createListObj.delegate  = self
        createListObj.modalPresentationStyle = .fullScreen
        self.present(createListObj, animated: true, completion: nil)

//        cancelBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"cancel_uppercase"))!)", for: .normal)
//        updateBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"Update_caps"))!)", for: .normal)
//
//        updateBtn.contentHorizontalAlignment = Utility.shared.isRTLLanguage() ? .left : .right
//        cancelBtn.contentHorizontalAlignment = Utility.shared.isRTLLanguage() ? .right : .left
//        editTextView.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
//
//        editpageTitle.textColor = UIColor(named: "Title_Header")
//        editpageTitle.font = UIFont(name: APP_FONT_MEDIUM, size: 18.0)
//        editpageTitle.text = "\((Utility.shared.getLanguage()?.value(forKey:"whishedit"))!)"
//        editTextView.font = UIFont(name: APP_FONT, size: 14.0)
//        cancelBtn.titleLabel?.font = UIFont(name: APP_FONT, size: 16.0)
//        updateBtn.titleLabel?.font = UIFont(name: APP_FONT, size: 16.0)
//        editPageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height)
//        self.view.addSubview(editPageView)
//        editTextView.text = whishlistTitle
//        editPageView.isHidden = false

    }


    @IBAction func updateTapped(_ sender: Any) {


    }
    @IBAction func cancelTapped(_ sender: Any) {
        editPageView.removeFromSuperview()
        editPageView.isHidden = true
    }


    @objc func likeBtnTapped(_ sender:UIButton!)
    {
        if Utility.shared.isConnectedToNetwork(){
            if((groupwhishlistArray.count > sender.tag) && groupwhishlistArray[sender.tag].listId != nil)
            {
                self.createWhishlistAPICall(listId:(groupwhishlistArray[sender.tag].listId != nil ? groupwhishlistArray[sender.tag].listId! : 0), wishListGroupId:groupID, eventKey:false)
            }
        }
        else
        {
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"error_field"))!)")
        }

    }

    //  fun getRate(base: String, to: String, from: String, rateStr: String, amount: Double) : Double {


    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
   {
       if Utility.shared.isConnectedToNetwork(){
           var totalPages = Int()

           let last_element = groupwhishlistArray.count - 1
           if(indexPath.item == last_element)
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
                   self.savedGroupAPICall(groupID:groupID,PageIndex:self.PageIndex)
               }
           }
       }
       else{
           self.view.addSubview(offlineView)
           self.groupCollection.bringSubviewToFront(offlineView)
           self.groupCollection.isHidden = false
           self.groupCollection.layoutSkeletonIfNeeded()
           self.groupCollection.isSkeletonable = true
           self.groupCollection.showAnimatedGradientSkeleton()
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
               offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-135, width: FULLWIDTH, height: 55)
           }else{
               offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-100, width: FULLWIDTH, height: 55)
           }
       }


  }
   // }

    func numSections(in collectionSkeletonView: UICollectionView) -> Int  {
        return 1
    }
   func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {

        return "CellcustomUpdated"
    }

    func collectionSkeletonView(_ skeletonView: UICollectionView, skeletonCellForItemAt indexPath: IndexPath) -> UICollectionViewCell?
    {
        let cell = skeletonView.dequeueReusableCell(withReuseIdentifier: "CellcustomUpdated", for: indexPath)as! customUpdatedCell
        self.nowhishlistView.isHidden = true
        cell.leftConstant.constant = 0
        if Utility.shared.isRTLLanguage(){
            cell.thunderTop.constant = 22
        }
        else {
            cell.thunderTop.constant = 24
        }
        cell.heightConstant.constant = 225
        cell.heartBtnTrailing.constant = 12
        cell.lineView.isHidden = true
        return cell
    }


}

