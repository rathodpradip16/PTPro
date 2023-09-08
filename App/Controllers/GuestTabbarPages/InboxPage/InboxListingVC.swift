//
//  InboxListingVC.swift
//  App
//
//  Created by RadicalStart on 11/06/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit
import GrowingTextView
import Apollo
import Lottie
import IQKeyboardManagerSwift
import SwiftMessages
import MaterialComponents
import SkeletonView
class InboxListingVC: UIViewController,UITableViewDelegate,UITableViewDataSource,GrowingTextViewDelegate,UINavigationControllerDelegate,UITextViewDelegate, SkeletonTableViewDataSource,RequestbookVCDelegate {
    func passSelectedStartDate(selectedstartDate: Date) {
        
    }
    
    func passSelectedEndDate(selectedenddate: Date) {
        
    }
    
    func billingListAPICall(startDate: String, endDate: String) {
        
    }
    
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var moreBtn: UIButton!
    
    @IBOutlet weak var messageBtn: UIButton!
    @IBOutlet weak var newmessageBtn: MDCRaisedButton!
    @IBOutlet weak var additionalTitle: UILabel!
    
    @IBOutlet weak var unreadView: UIView!
    @IBOutlet weak var retryBtn: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var moreBtnImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var messageTxtView: GrowingTextView!
    @IBOutlet weak var bottomview: UIView!
    @IBOutlet weak var inboxlistingTable: UITableView!
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet var CustomHeaderView: UIView!
    @IBOutlet var HeaderViewShadowView: UIView!
    @IBOutlet var HeaderDescriptionTitle: UILabel!
    @IBOutlet var TimeLabel: UILabel!
    @IBOutlet var HeaderActionBtn: UIButton!
    @IBOutlet var HeaderDeclineButton: UIButton!
    
    @IBOutlet var HeaderDescLabel: UILabel!
    var isformViewUpdation = false
    var isFirstTime = false
    var isFromItinerary = false
    
    let messageArray = NSMutableArray()
    var threadId = Int()
    var isSentMsg:Bool = false
    
    var message = String()
     var lottieView: LottieAnimationView!
    @IBOutlet weak var offlineView: UIView!
    var totalListcount:Int = 0
    var PageIndex:Int = 1
    var totalPages = Int()
    var isScrollBottom:Bool = false
    var ResultArray = GetThreadsQuery.Data.GetThread.Result()
    var getmessageListquery = [GetThreadsQuery.Data.GetThread.Result.ThreadItem]()
    var viewUpdateQuery = GetThreadsQuery.Data.GetThread.Result.ThreadItemForType()
    var sendMessageArray = SendMessageMutation.Data.SendMessage.Result()
    var getunreadthreadCount = GetUnReadThreadCountQuery.Data.GetUnReadThreadCount.Result()
    //var getallreservationquery = [GetAllReservationQuery.Data.GetAllReservation.Result]()
    
    var viewListingArray = ViewListingDetailsQuery.Data.ViewListing.Result()
    var getbillingArray = GetBillingCalculationQuery.Data.GetBillingCalculation.Result()
    
    
    var releaseDate: NSDate?
    var countdownTimer = Timer()
    var startDate = String()
    var EndDate = String()
    
    var StartDateQwery = String()
    var enddateQery = String()
    
    
    var preAprroveString = String()
    var preApproveEndSString = String()
    var preApproveStartString = String()

    
    var apollo_headerClient: ApolloClient = {
        let cache = InMemoryNormalizedCache()
        let store1 = ApolloStore(cache: cache)
        let configuration = URLSessionConfiguration.default
        // Add additional headers as needed
        configuration.httpAdditionalHeaders = ["auth": "\(Utility.shared.getCurrentUserToken()!)"] // Replace `<token>`
        let url = URL(string:graphQLEndpoint)!
        let client1 = URLSessionClient(sessionConfiguration: configuration, callbackQueue: nil)
        let provider = DefaultInterceptorProvider(client: client1, shouldInvalidateClientOnDeinit: true, store: store1)
        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                                 endpointURL: url)
        return ApolloClient(networkTransport: requestChainTransport,
                            store: store1)
    }()
    
    var isnewMessage:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        offlineView.backgroundColor =  UIColor(named: "Button_Grey_Color")
        self.isnewMessage = false
        self.initialsetUp()
        self.configMsgField()
        self.lottieAnimation()
        self.readMessage()
        inboxlistingTable.transform = CGAffineTransform(scaleX: 1, y: -1)
      
        self.view.backgroundColor = UIColor(named: "colorController")
        self.newmessageBtn.setElevation(ShadowElevation(rawValue:20), for: .normal)
        self.newmessageBtn.setElevation(ShadowElevation(rawValue:25), for: .highlighted)
        
        CustomHeaderView.isHidden = true
        HeaderViewShadowView.isHidden = true
        HeaderDescriptionTitle.isHidden = true
        HeaderActionBtn.isHidden = true
        TimeLabel.isHidden = true
        HeaderDeclineButton.isHidden = true
        HeaderDescLabel.isHidden = true
        additionalTitle.isHidden = true
        self.ViewdetailApiCall(listid: Int(Utility.shared.ListID)!)
        
      //  self.getMessageListAPICall(threadId:threadId)
       
        newmessageBtn.applyGradient(colors: [Theme.PRIMARY_COLOR.cgColor,Theme.PRIMARY_COLOR.cgColor])

          retryBtn.titleLabel?.font = UIFont(name: APP_FONT, size: 15)
        HeaderActionBtn.titleLabel?.font = UIFont(name: APP_FONT, size: 15)
        TimeLabel.font = UIFont(name: APP_FONT, size: 15)
        HeaderDeclineButton.titleLabel?.font = UIFont(name: APP_FONT, size: 15)
        
        HeaderDescriptionTitle.font = UIFont(name: APP_FONT_MEDIUM, size: 16)
        HeaderDescriptionTitle.textColor = UIColor(named: "Title_Header")
        
        HeaderDescLabel.font = UIFont(name: APP_FONT, size: 12)
        HeaderDescLabel.textColor = UIColor(named: "searchPlaces_TextColor")
        
        additionalTitle.font = UIFont(name: APP_FONT_MEDIUM, size: 12)
         errorLabel.font = UIFont(name: APP_FONT, size: 17)
        
        nameLabel.text = "\(Utility.shared.getLanguage()?.value(forKey: "message") ?? "Message")"
        nameLabel.font = UIFont(name: APP_FONT_SEMIBOLD, size: 18)
        nameLabel.textColor = UIColor(named: "Title_Header")
        nameLabel.backgroundColor = UIColor.clear
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
      //  self.initialsetUp()
 
        
        scheduledTimerWithTimeInterval()
        
        if Utility.shared.isConnectedToNetwork() {
            
            offlineView.isHidden = true
        }else{
       //     self.offlineView_func()
        }
    }
    
    func scheduledTimerWithTimeInterval(){
       
     //    Utility.shared.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(InboxListingVC.getUnreadCountMessage), userInfo: nil, repeats: true)
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        Utility.shared.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {
            timer in

            self.someBackgroundTask(timer: timer)
        }
        
    }

    override func viewDidAppear(_ animated: Bool) {
        

        DispatchQueue.main.async {
            self.scrollToBottom()
        }
    }
    func someBackgroundTask(timer:Timer) {
        DispatchQueue.global(qos: DispatchQoS.background.qosClass).async {
            //print("do some background task")
            self.getUnreadCountMessage()
            DispatchQueue.main.async {
                //print("update some UI")
            }
        }
    }
    override func viewDidLayoutSubviews() {
    
        if !isFirstTime {
            isFirstTime = true
            self.scrollToBottom()
        }
        
      
        if(CustomHeaderView.isHidden) {
            self.inboxlistingTable.frame.origin.y = 100
            self.inboxlistingTable.frame.size.height = (self.bottomview.frame.origin.y - self.topView.frame.size.height-10)-5
        }
        else {
        self.inboxlistingTable.frame.origin.y = (CustomHeaderView.frame.height + CustomHeaderView.frame.origin.y)+5
        self.inboxlistingTable.frame.size.height = ((self.bottomview.frame.origin.y-self.topView.frame.size.height-10) - CustomHeaderView.frame.size.height)-8
        }
    }
    func lottieAnimation(){
        
        lottieView = LottieAnimationView.init(name:"animation")
        lottieView.isHidden = true
        self.lottieView.frame = CGRect(x:FULLWIDTH/2-40, y:FULLHEIGHT/2-50, width:100, height:100)
        self.inboxlistingTable.addSubview(self.lottieView)
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
    
    func ViewdetailApiCall(listid: Int){
        
        if Utility.shared.isConnectedToNetwork() {
         
            let viewlistingQuery = ViewListingDetailsQuery(listId: listid)
            apollo_headerClient.fetch(query: viewlistingQuery, cachePolicy:.fetchIgnoringCacheData){(result, error) in
                guard (result?.data?.viewListing?.results) != nil else{
                    print("missing Data")
                    return
                }
                self.viewListingArray = (result?.data?.viewListing?.results)!
            }
            
        }
    }
    
    
    
    @IBAction func moreBtnTapped(_ sender: Any) {
        
        let actionSheetController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
       
        // create an action
        let firstAction: UIAlertAction = UIAlertAction(title: "\((Utility.shared.getLanguage()?.value(forKey:"reportuser"))!)", style: .default) { action -> Void in
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"reportingalert"))!)")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.dismiss(animated: true, completion: nil)
            }
        }
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "\((Utility.shared.getLanguage()?.value(forKey:"cancel"))!)", style: .cancel) { action -> Void in }
        
        // add actions
        actionSheetController.addAction(firstAction)
        actionSheetController.addAction(cancelAction)
        
        // present an actionSheet...
        present(actionSheetController, animated: true, completion: nil)
        
    }
    @IBAction func backbtnTapped(_ sender: Any) {
        if Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification{
         //   let messagepage = TripsMessageVC()
          //  self.present(messagepage, animated: false, completion: nil)
             let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.addingElementsToObjects()
//            appDelegate.settingRootViewControllerFunction()
            Utility.shared.setHostTab(index: 3)
            appDelegate.HostTabbarInitialize(initialView: CustomHostTabbar())
            
        }else if Utility.shared.isfromAppDelegateMessageBackground || Utility.shared.isfromAppdelegateMessageOffline{
            
            Utility.shared.isfromAppDelegateMessageBackground = false
            Utility.shared.isfromAppdelegateMessageOffline = false
            
             let appDelegate = UIApplication.shared.delegate as! AppDelegate
            Utility.shared.setTab(index: 3)
            appDelegate.GuestTabbarInitialize(initialView: CustomTabbar())
        }
        else{
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    @IBAction func sendBtnTapped(_ sender: Any) {
          if Utility().isConnectedToNetwork(){
             message = messageTxtView.text
            if(!(Utility.shared.checkEmptyWithString(value: message)) && getmessageListquery.count > 0)
            {
          
            let timestamp = Date().currentTimeMillis()
           
            let array =   GetThreadsQuery.Data.GetThread.Result.ThreadItem.init(id:self.sendMessageArray.id, threadId:self.threadId, reservationId:self.sendMessageArray.reservationId, content:messageTxtView.text, sentBy:Utility.shared.getCurrentUserID()! as String, type:"message", startDate: self.sendMessageArray.startDate, endDate:self.sendMessageArray.endDate, createdAt:"\(timestamp)")
                print(sendMessageArray)
            self.getmessageListquery.insert(array, at:0)
                
            inboxlistingTable.reloadData()
           // self.ViewUpdation()
            self.messageTxtView.text = ""
            self.sendMessageAPICall()
            }
//            else
//            {
//            self.configureNextBtn(enable: false)
//            }
           
//        self.messageArray.add(messageTxtView.text)
//        inboxlistingTable.reload()
       
        }
        else{
            // self.previousTable.isHidden = true
            self.view.endEditing(true)
            self.bottomview.frame.origin.y = (FULLHEIGHT -  self.bottomview.frame.size.height)
            
            if CustomHeaderView.isHidden{
                self.inboxlistingTable.frame.origin.y = 100
                self.inboxlistingTable.frame.size.height = (self.bottomview.frame.origin.y - self.topView.frame.size.height-10)-5
            }else{
                self.inboxlistingTable.frame.origin.y = (CustomHeaderView.frame.height + CustomHeaderView.frame.origin.y)+5
                self.inboxlistingTable.frame.size.height = ((self.bottomview.frame.origin.y-self.topView.frame.size.height-10) - CustomHeaderView.frame.size.height)-5
            }

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
            if IS_IPHONE_XR{
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-85, width: FULLWIDTH, height: 55)
            }else{
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-55, width: FULLWIDTH, height: 55)
            }
            
        }
    }
    
    func sendMessageAPICall()
    {
       
            let sendMsgMutation = SendMessageMutation(threadId:threadId, content:message, type: "message")
            
         apollo_headerClient.perform(mutation: sendMsgMutation){(result,error) in
                guard (result?.data?.sendMessage?.results) != nil else{
                    print("Missing Data")
                    return
                }

            self.sendMessageArray = (result?.data?.sendMessage?.results)!
 
                
        }
    }
    
    func initialsetUp()
    {

        self.backBtn.setImage(UIImage(named: "left_arrow"), for: .normal)
        self.backBtn.setTitle("", for: .normal)
        self.backBtn.backgroundColor = Theme.ButtonBack_BG
        self.backBtn.layer.cornerRadius = self.backBtn.frame.size.height/2
        self.backBtn.clipsToBounds = true
        IQKeyboardManager.shared.enableAutoToolbar = true
        
        self.bottomview.layer.borderColor = UIColor(named: "Review_Page_Line_Color")?.cgColor
        self.bottomview.layer.borderWidth = 1.0
        self.bottomview.layer.cornerRadius = self.bottomview.frame.size.height/2
        self.bottomview.clipsToBounds = true
//        CustomHeaderView.frame = CGRect(x: 0, y: topView.frame.size.height+topView.frame.origin.y+1, width: FULLWIDTH, height: 150)
//        HeaderViewShadowView.frame = CGRect(x: 10, y: 2, width: CustomHeaderView.frame.size.width-20, height: CustomHeaderView.frame.size.height-4)
//        HeaderDescriptionTitle.frame = CGRect(x: 2, y: 2, width: HeaderViewShadowView.frame.size.width-4, height: 73)
//        HeaderActionBtn.frame = CGRect(x: 2, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: 80, height: 40)
//        TimeLabel.frame = CGRect(x: HeaderActionBtn.frame.size.width+HeaderActionBtn.frame.origin.x+5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
        
        inboxlistingTable.register(UINib(nibName: "inboxListingcellTableViewCell", bundle: nil), forCellReuseIdentifier: "inboxListingcellTableViewCell")
        inboxlistingTable.register(UINib(nibName: "ReceiverMessageCell", bundle: nil), forCellReuseIdentifier: "ReceiverMessageCell")
        inboxlistingTable.register(UINib(nibName: "InboxDateLabel", bundle: nil), forCellReuseIdentifier: "InboxDateLabel")
        inboxlistingTable.register(UINib(nibName: "sendCell", bundle: nil), forCellReuseIdentifier: "sendCell")
        inboxlistingTable.register(UINib(nibName: "ReceiverMessageonlyCell", bundle: nil), forCellReuseIdentifier: "ReceiverMessageonlyCell")
        inboxlistingTable.rowHeight = UITableView.automaticDimension
        self.inboxlistingTable.isSkeletonable = true
        inboxlistingTable.isUserInteractionDisabledWhenSkeletonIsActive = true
        inboxlistingTable.showAnimatedGradientSkeleton()
        
        inboxlistingTable.separatorStyle = .none
        inboxlistingTable.separatorColor = .clear
        self.offlineView.isHidden = true
        lottieView = LottieAnimationView.init(name:"animation")
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
        messageTxtView.autocorrectionType = UITextAutocorrectionType.no
       let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        if(messageTxtView.text == "")
        {
            configureNextBtn(enable: false)
        }
        else
        {
            configureNextBtn(enable: true)
        }
        errorLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"error_field"))!)"
        retryBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"retry"))!)", for:.normal)
        sendBtn.setTitle("", for:.normal)
        sendBtn.setImage(UIImage(named: "sendMessage"), for: .normal)
        newmessageBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"newmessage"))!)", for:.normal)
        unreadView.isHidden = true
        errorLabel.textColor =  UIColor(named: "Title_Header")
        retryBtn.setTitleColor(Theme.PRIMARY_COLOR, for: .normal)
        if(Utility.shared.isRTLLanguage()) {
            self.backBtn.rotateImageViewofBtn()
            self.backBtn.imageView?.performRTLTransform()
            sendBtn.frame.origin.x -= (FULLWIDTH-105)
        }

    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    func configureNextBtn(enable:Bool){
        if(enable){
//            self.sendBtn.isUserInteractionEnabled = true
          //  self.sendBtn.alpha = 1.0
        }
        else {
//            self.sendBtn.isUserInteractionEnabled = false
//            self.sendBtn.alpha = 0.7
        }
        
    }
    @IBAction func retryBtnTapped(_ sender: Any) {
        
        if Utility.shared.isConnectedToNetwork() {
            
             self.offlineView.isHidden = true
            
        }
       
        
        
    }
    
  func readMessage()
  {
    let readMessageMutation = ReadMessageMutation(threadId: threadId)
    apollo_headerClient.perform(mutation: readMessageMutation){(result,error) in
        guard (result?.data?.readMessage?.status) != 200 else{
            print("Missing Data")
            return
    }
    
    }
    }
    @IBAction func messageunreadTapped(_ sender: Any) {
        self.readMessage()
        PageIndex = 0
        self.isnewMessage = true
        self.getMessageListAPICall(threadId: threadId)
    }
    @IBAction func unreadBtnTapped(_ sender: Any) {
        self.readMessage()
        PageIndex = 0
        self.isnewMessage = true
        self.getMessageListAPICall(threadId: threadId)
     //   self.unreadView.animHide()
        
    }
   
    
    //MARK: - UnReadCount Message
    @objc func getUnreadCountMessage()
    {
         if Utility().isConnectedToNetwork(){
            let getunreadmessageCount = GetUnReadThreadCountQuery(threadId: threadId)
            apollo_headerClient.fetch(query: getunreadmessageCount,cachePolicy: .fetchIgnoringCacheData){(result,error) in
                guard (result?.data?.getUnReadThreadCount?.results) != nil else{
                    print("Missing Data")
                    return
                }
                self.getunreadthreadCount = (result?.data?.getUnReadThreadCount?.results!)!
                if(result?.data?.getUnReadThreadCount?.results?.isUnReadMessage == true)
                {
//                    if(self.isnewMessage)
//                    {
                    self.unreadView.isHidden = false
                    //}
                    self.newmessageBtn.layer.cornerRadius = 20.0
                    self.newmessageBtn.layer.masksToBounds = true
                    self.newmessageBtn.layer.borderColor = Theme.TextLightColor.cgColor
                    self.newmessageBtn.layer.borderWidth = 0.5
                   
                    
                    
                   
                  //  self.unreadView.animShow()

//
//                    self.showunreadview(unreadview: unreadviewlayer)

                    print("Getmessage")
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
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-85, width: FULLWIDTH, height: 55)
            }else{
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-55, width: FULLWIDTH, height: 55)
            }
        }
    }
    
    func getMessageListAPICall(threadId:Int)
    {
        if Utility().isConnectedToNetwork(){
            var threadtype = String()
            if(Utility.shared.host_message_isfromHost || Utility.shared.host_message_isfrommessage || Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification)
            {
                if isFromItinerary {
                    threadtype = GUEST
                }
                else {
                  threadtype = HOST
                }
            
            }
            else
            {
             threadtype = GUEST
            }
            
            print("PageIndex \(PageIndex)")
            print("threadType \(threadtype)")
            print("threadID \(threadId)")
            
            let getmessagequery = GetThreadsQuery(threadType:threadtype, threadId: threadId, currentPage: PageIndex)
            apollo_headerClient.fetch(query:getmessagequery,cachePolicy:.fetchIgnoringCacheData){(result,error) in
                guard (result?.data?.getThreads?.results) != nil else{
                    print("Missing Data")
                    self.view.makeToast("\(result?.data?.getThreads?.errorMessage ?? "\(Utility.shared.getLanguage()?.value(forKey:"somethingwrong") ?? "Something Went wrong")")")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                        self.dismiss(animated: true)
                    })
                    return
                }
               
               self.inboxlistingTable.hideSkeleton()
                self.inboxlistingTable.isSkeletonable = false
                if(!self.isnewMessage)
                {
                     self.totalListcount = (result?.data?.getThreads?.results?.getThreadCount)!
                    self.getmessageListquery.append(contentsOf: ((result?.data?.getThreads?.results?.threadItems)!) as! [GetThreadsQuery.Data.GetThread.Result.ThreadItem])
                   
                    self.viewUpdateQuery =  (result?.data?.getThreads?.results?.threadItemForType)! 
                    // self.getmessageListquery = self.getmessageListquery.reversed()
                    self.ResultArray = ((result?.data?.getThreads?.results)!)
//                    if(Utility.shared.host_message_isfromHost || Utility.shared.host_message_isfrommessage || Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification)
//                    {
//                        self.nameLabel.text = self.ResultArray.guestProfile?.displayName != nil ? self.ResultArray.hostProfile?.displayName! : ""
//                    }
//                    else
//                    {
//                        self.nameLabel.text = self.ResultArray.hostProfile?.displayName != nil ? self.ResultArray.hostProfile?.displayName! : ""
//                    }
                    self.lottieView.isHidden = true
                    self.inboxlistingTable.hideSkeleton()
                    self.inboxlistingTable.isSkeletonable = false
                    self.ViewUpdation()
                    UIView.performWithoutAnimation {
                        self.inboxlistingTable.reloadSections([0], with: .none)
                    }
                  
                }
                else
                {
                
                self.unreadView.isHidden = true
                //self.isnewMessage = false
                var messageArray = [GetThreadsQuery.Data.GetThread.Result.ThreadItem]()
                messageArray.removeAll()
                messageArray.append(contentsOf: ((result?.data?.getThreads?.results?.threadItems)!) as! [GetThreadsQuery.Data.GetThread.Result.ThreadItem])
                for i in 0..<messageArray.count
                {
                  if messageArray[i].id != self.getmessageListquery[i].id
                  {
                 self.getmessageListquery.insert(((result?.data?.getThreads?.results?.threadItems![i])!), at:i)
                    }
                }
                   
                    self.viewUpdateQuery =  (result?.data?.getThreads?.results?.threadItemForType)! 
                self.ViewUpdation()
                    UIView.performWithoutAnimation {
                        self.inboxlistingTable.reloadSections([0], with: .none)
                    }
                  
                return
                }
                
                
            }
        }
        else{
            // self.previousTable.isHidden = true
            self.offlineView.isHidden = false
            self.inboxlistingTable.isSkeletonable = true
            inboxlistingTable.showAnimatedGradientSkeleton()
           
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
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-85, width: FULLWIDTH, height: 55)
            }else{
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-55, width: FULLWIDTH, height: 55)
            }
            
        }
        
    }
    
    
    //set up message text view
    func configMsgField()  {
//        messageTxtView.layer.borderWidth  = 1.0
        messageTxtView.font = UIFont(name: APP_FONT_MEDIUM, size:14)
        //messageTxtView.textContainer.lineFragmentPadding = 20
        messageTxtView.delegate = self
        messageTxtView.trimWhiteSpaceWhenEndEditing = true
        messageTxtView.placeholder = "\((Utility.shared.getLanguage()?.value(forKey:"writeinbox"))!)"
        messageTxtView.placeholderColor = Theme.TextLightColor
        messageTxtView.minHeight = 30.0
        messageTxtView.maxHeight = 150.0
        messageTxtView.layer.cornerRadius = 20.0
        if(Utility.shared.isRTLLanguage()){
            if IS_IPHONE_X || IS_IPHONE_XR {
            messageTxtView.textAlignment = .right
                messageTxtView.frame = CGRect(x: 30, y: 14, width: FULLWIDTH-80, height: 40)
            }else{
                messageTxtView.textAlignment = .right
                messageTxtView.frame = CGRect(x: 70, y: 14, width: FULLWIDTH-80, height: 40)
            }
        }else{
            messageTxtView.textAlignment = .left
        }
        messageTxtView.isUserInteractionEnabled = true
    }
    
   
    func textViewDidEndEditing(_ textView: UITextView) {
        self.view.endEditing(true)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(getmessageListquery.count > 0)
        {
            return getmessageListquery.count
        }
        return 0
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if(indexPath.section == 0)
//        {
//        return 160
//        }
//       // return 145
//    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if section == 0 {
//
//            tableView.tableHeaderView = CustomHeaderView
//            tableView.tableHeaderView?.transform = CGAffineTransform(scaleX: 1, y: -1)
//
//            }
//        return tableView.tableHeaderView
//    }
    
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//
//        tableView.tableFooterView = CustomHeaderView
//        tableView.tableFooterView?.transform = CGAffineTransform(scaleX: 1, y: -1)
//        return tableView.tableFooterView
//    }
//
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("index\(indexPath.row)")
        
        
        //MARK: - Host Message Cell
        if(Utility.shared.host_message_isfromHost || Utility.shared.host_message_isfrommessage || Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification)
        {
            if(getmessageListquery[indexPath.row].type != "message" && getmessageListquery[indexPath.row].content == nil || getmessageListquery[indexPath.row].content == "")
            {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "InboxDateLabel", for: indexPath)as! InboxDateLabel
                cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
                cell.selectionStyle = .none
                cell.typeLAbel.text = Utility.shared.getbookingtype(type:(getmessageListquery[indexPath.row].type!))

                if((getmessageListquery[indexPath.row].endDate != nil && getmessageListquery[indexPath.row].endDate != "") && (getmessageListquery[indexPath.row].startDate != nil && getmessageListquery[indexPath.row].startDate != ""))
                {
                let date = getdateValue(timestamp:(getmessageListquery[indexPath.row].startDate!))
                let day = getdayValue(timestamp: (getmessageListquery[indexPath.row].startDate!))
                let date1 = getdateValue(timestamp:(getmessageListquery[indexPath.row].endDate!))
                let day1 = getdayValue(timestamp: (getmessageListquery[indexPath.row].endDate!))
                cell.dateLabel.text = "\(day), \(date) - \(day1), \(date1)"
                }
                
                cell.circleIndicationView.backgroundColor = Utility.shared.getbookingtypeColor(type: getmessageListquery[indexPath.row].type ?? "")
                return cell
            }
            else if(((getmessageListquery[indexPath.row].sentBy!) == (ResultArray.hostProfile?.userId!)) && (getmessageListquery[indexPath.row].startDate != nil && getmessageListquery[indexPath.row].startDate != ""))
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "inboxListingcellTableViewCell", for: indexPath)as! inboxListingcellTableViewCell
                cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
                cell.selectionStyle = .none
                if(getmessageListquery[indexPath.row].content == "")
                {
                    cell.messageLAbel.text = ""
                }
                else{
                    cell.messageLAbel.text = getmessageListquery[indexPath.row].content != nil ? getmessageListquery[indexPath.row].content! : ""
                }
                if(ResultArray.hostProfile?.picture != nil)
                {
                    let listimage = (ResultArray.hostProfile?.picture!)!
                    cell.profileImage.sd_setImage(with: URL(string: "\(IMAGE_AVATAR_MEDIUM)\(listimage)"), placeholderImage: #imageLiteral(resourceName: "unknown"))
                }
                else
                {
                    cell.profileImage.image = #imageLiteral(resourceName: "unknown")
                }
                cell.requestLAbel.text = Utility.shared.getbookingtype(type:(getmessageListquery[indexPath.row].type!))
                let date = getdateValue(timestamp:(getmessageListquery[indexPath.row].startDate!))
                let day = getdayValue(timestamp: (getmessageListquery[indexPath.row].startDate!))
                let date1 = getdateValue(timestamp:(getmessageListquery[indexPath.row].endDate!))
                let day1 = getdayValue(timestamp: (getmessageListquery[indexPath.row].endDate!))
                cell.dateLAbel.text = "\(day), \(date) - \(day1), \(date1)"
                let msgday = getdayValue(timestamp: (getmessageListquery[indexPath.row].createdAt!))
                let msgdate = getdateValue(timestamp:(getmessageListquery[indexPath.row].createdAt!))
                cell.messageDateLabel.text = "\(msgday), \(msgdate)"
                cell.senderView.backgroundColor = UIColor(named: "sendMessageBGColor")
                
                cell.circleIndicationView.backgroundColor = Utility.shared.getbookingtypeColor(type: getmessageListquery[indexPath.row].type ?? "")
                
                return cell
            }
            else if(((getmessageListquery[indexPath.row].sentBy!) == (ResultArray.guestProfile?.userId!)) && (getmessageListquery[indexPath.row].startDate != nil && getmessageListquery[indexPath.row].startDate != ""))
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiverMessageCell", for: indexPath)as! ReceiverMessageCell
                cell.selectionStyle = .none
                cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
                if(getmessageListquery[indexPath.row].content == nil)
                {
                    cell.receiverMsgLabel.text = ""
                }
                else{
                    cell.receiverMsgLabel.text = getmessageListquery[indexPath.row].content != nil ? getmessageListquery[indexPath.row].content! : ""
                }
                cell.receiverView.backgroundColor =  UIColor(named: "Button_Grey_Color")
                cell.requestLabel.text = Utility.shared.getbookingtype(type:(getmessageListquery[indexPath.row].type!))
                if(ResultArray.guestProfile?.picture != nil)
                {
                    let listimage = (ResultArray.guestProfile?.picture!)!
                    cell.profileImage.sd_setImage(with: URL(string: "\(IMAGE_AVATAR_MEDIUM)\(listimage)"), placeholderImage: #imageLiteral(resourceName: "unknown"))
                }
                else
                {
                    cell.profileImage.image = #imageLiteral(resourceName: "unknown")
                }
                if(getmessageListquery[indexPath.row].startDate != nil && getmessageListquery[indexPath.row].startDate != "")
                {
                    let date = getdateValue(timestamp:(getmessageListquery[indexPath.row].startDate!))
                    let day = getdayValue(timestamp: (getmessageListquery[indexPath.row].startDate!))
                    let date1 = getdateValue(timestamp:(getmessageListquery[indexPath.row].endDate!))
                    let day1 = getdayValue(timestamp: (getmessageListquery[indexPath.row].endDate!))
                    cell.dateLAbel.text = "\(day), \(date) - \(day1), \(date1)"
                }
                let msgday = getdayValue(timestamp: (getmessageListquery[indexPath.row].createdAt!))
                let msgdate = getdateValue(timestamp:(getmessageListquery[indexPath.row].createdAt!))
                cell.receiverDateLabel.text = "\(msgday), \(msgdate)"
                
                cell.circleIndicationView.backgroundColor = Utility.shared.getbookingtypeColor(type: getmessageListquery[indexPath.row].type ?? "")
                return cell
            }
            else if(((getmessageListquery[indexPath.row].sentBy!) == (ResultArray.guestProfile?.userId!)) && (getmessageListquery[indexPath.row].startDate == nil || getmessageListquery[indexPath.row].startDate == ""))
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiverMessageonlyCell", for: indexPath)as! ReceiverMessageonlyCell
                cell.curveView.isHidden = false
                
                cell.selectionStyle = .none
                cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
                cell.receiverView.backgroundColor =  UIColor(named: "Button_Grey_Color")
//                cell.curveView.image = #imageLiteral(resourceName: "grey-centers").withRenderingMode(.alwaysTemplate)
//                cell.curveView.tintColor = UIColor(named: "Button_Grey_Color")
                if(getmessageListquery[indexPath.row].content == nil)
                {
                    cell.messageLabel.text = ""
                }
                else{
                    cell.messageLabel.text = getmessageListquery[indexPath.row].content != nil ? getmessageListquery[indexPath.row].content!.trimmingCharacters(in: .newlines) : ""
                }
                if(ResultArray.guestProfile?.picture != nil)
                {
                    let listimage = (ResultArray.guestProfile?.picture!)!
                    cell.profileimage.sd_setImage(with: URL(string: "\(IMAGE_AVATAR_MEDIUM)\(listimage)"), placeholderImage: #imageLiteral(resourceName: "unknown"))
                }
                else
                {
                    cell.profileimage.image = #imageLiteral(resourceName: "unknown")
                }
                let msgday = getdayValue(timestamp: (getmessageListquery[indexPath.row].createdAt!))
                let msgdate = getdateValue(timestamp:(getmessageListquery[indexPath.row].createdAt!))
                cell.dateLabel.text = "\(msgday), \(msgdate)"
                return cell
            }
            else if((((getmessageListquery[indexPath.row].sentBy!) == (ResultArray.hostProfile?.userId!)) && (getmessageListquery[indexPath.row].startDate == nil || getmessageListquery[indexPath.row].startDate == "")))
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "sendCell", for: indexPath)as! sendCell
                cell.curveView.isHidden = false
               
                cell.selectionStyle = .none
                cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
                cell.senderView.backgroundColor = UIColor(named: "sendMessageBGColor")
                
//                cell.curveView.image = #imageLiteral(resourceName: "blue-center").withRenderingMode(.alwaysTemplate)
//                cell.curveView.tintColor = UIColor(named: "sendMessageBGColor")
                if(getmessageListquery[indexPath.row].content == "")
                {
                    cell.messageLAbel.numberOfLines = 1
                    cell.messageLAbel.text = ""
                }
                else{
                    cell.messageLAbel.text = getmessageListquery[indexPath.row].content != nil ? getmessageListquery[indexPath.row].content!.trimmingCharacters(in: .newlines) : ""
                }
                if(ResultArray.hostProfile?.picture != nil)
                {
                    let listimage = (ResultArray.hostProfile?.picture!)!
                    cell.profileImage.sd_setImage(with: URL(string: "\(IMAGE_AVATAR_MEDIUM)\(listimage)"), placeholderImage: #imageLiteral(resourceName: "unknown"))
                }
                else
                {
                    cell.profileImage.image = #imageLiteral(resourceName: "unknown")
                }
                let msgday = getdayValue(timestamp: (getmessageListquery[indexPath.row].createdAt!))
                let msgdate = getdateValue(timestamp:(getmessageListquery[indexPath.row].createdAt!))
                cell.messageDateLabel.text = "\(msgday), \(msgdate)"
                
                return cell
            }
            else
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "InboxDateLabel", for: indexPath)as! InboxDateLabel
                cell.selectionStyle = .none
                cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
                cell.typeLAbel.text = Utility.shared.getbookingtype(type:(getmessageListquery[indexPath.row].type!))
                // cell.typeLAbel.text = getmessageListquery[indexPath.row].type!.capitalized
                let date = getdateValue(timestamp:(getmessageListquery[indexPath.row].startDate!))
                let day = getdayValue(timestamp: (getmessageListquery[indexPath.row].startDate!))
                let date1 = getdateValue(timestamp:(getmessageListquery[indexPath.row].endDate!))
                let day1 = getdayValue(timestamp: (getmessageListquery[indexPath.row].endDate!))
                cell.dateLabel.text = "\(day), \(date) - \(day1), \(date1)"
                cell.circleIndicationView.backgroundColor = Utility.shared.getbookingtypeColor(type: getmessageListquery[indexPath.row].type ?? "")
                return cell
            }
        }
            
     //MARK: - Guest Message Cell
        else
        {
        if(getmessageListquery[indexPath.row].type != "message" && getmessageListquery[indexPath.row].content == nil || getmessageListquery[indexPath.row].content == "")
        {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "InboxDateLabel", for: indexPath)as! InboxDateLabel
            cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
            cell.selectionStyle = .none
            cell.typeLAbel.text = Utility.shared.getbookingtype(type:(getmessageListquery[indexPath.row].type != nil ? getmessageListquery[indexPath.row].type! : ""))
            
            if((getmessageListquery[indexPath.row].endDate != nil && getmessageListquery[indexPath.row].endDate != "") && (getmessageListquery[indexPath.row].startDate != nil && getmessageListquery[indexPath.row].startDate != ""))
            {
            let date = getdateValue(timestamp:(getmessageListquery[indexPath.row].startDate!))
            let day = getdayValue(timestamp: (getmessageListquery[indexPath.row].startDate!))
            let date1 = getdateValue(timestamp:(getmessageListquery[indexPath.row].endDate!))
            let day1 = getdayValue(timestamp: (getmessageListquery[indexPath.row].endDate!))
            cell.dateLabel.text = "\(day), \(date) - \(day1), \(date1)"
            }

            cell.circleIndicationView.backgroundColor = Utility.shared.getbookingtypeColor(type: getmessageListquery[indexPath.row].type ?? "")
            return cell
        }
        else if(((getmessageListquery[indexPath.row].sentBy!) == (ResultArray.guestProfile?.userId!)) && (getmessageListquery[indexPath.row].startDate != nil && getmessageListquery[indexPath.row].startDate != ""))
        {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "inboxListingcellTableViewCell", for: indexPath)as! inboxListingcellTableViewCell
             cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
            cell.selectionStyle = .none
            if(getmessageListquery[indexPath.row].content == "")
            {
                cell.messageLAbel.text = ""
            }
            else{
                cell.messageLAbel.text = getmessageListquery[indexPath.row].content != nil ? getmessageListquery[indexPath.row].content!.trimmingCharacters(in: .newlines) : ""
            }
            if(ResultArray.guestProfile?.picture != nil)
            {
                let listimage = (ResultArray.guestProfile?.picture!)!
                cell.profileImage.sd_setImage(with: URL(string: "\(IMAGE_AVATAR_MEDIUM)\(listimage)"), placeholderImage: #imageLiteral(resourceName: "unknown"))
            }
            else
            {
                cell.profileImage.image = #imageLiteral(resourceName: "unknown")
            }
            cell.requestLAbel.text = Utility.shared.getbookingtype(type:(getmessageListquery[indexPath.row].type!))
            let date = getdateValue(timestamp:(getmessageListquery[indexPath.row].startDate!))
            let day = getdayValue(timestamp: (getmessageListquery[indexPath.row].startDate!))
            let date1 = getdateValue(timestamp:(getmessageListquery[indexPath.row].endDate!))
            let day1 = getdayValue(timestamp: (getmessageListquery[indexPath.row].endDate!))
            cell.dateLAbel.text = "\(day), \(date) - \(day1), \(date1)"
            let msgday = getdayValue(timestamp: (getmessageListquery[indexPath.row].createdAt!))
            let msgdate = getdateValue(timestamp:(getmessageListquery[indexPath.row].createdAt!))
            cell.messageDateLabel.text = "\(msgday), \(msgdate)"
            
            cell.circleIndicationView.backgroundColor = Utility.shared.getbookingtypeColor(type: getmessageListquery[indexPath.row].type ?? "")
            
            return cell
        }
        else if(((getmessageListquery[indexPath.row].sentBy!) == (ResultArray.hostProfile?.userId!)) && (getmessageListquery[indexPath.row].startDate != nil && getmessageListquery[indexPath.row].startDate != ""))
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiverMessageCell", for: indexPath)as! ReceiverMessageCell
            cell.selectionStyle = .none
            cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
            if(getmessageListquery[indexPath.row].content == nil)
            {
              cell.receiverMsgLabel.text = ""
            }
            else{
                cell.receiverMsgLabel.text = getmessageListquery[indexPath.row].content != nil ? getmessageListquery[indexPath.row].content!.trimmingCharacters(in: .newlines) : ""
            }
            cell.requestLabel.text = Utility.shared.getbookingtype(type:(getmessageListquery[indexPath.row].type != nil ? getmessageListquery[indexPath.row].type! : ""))
            if(ResultArray.hostProfile?.picture != nil)
            {
                let listimage = (ResultArray.hostProfile?.picture!)!
                cell.profileImage.sd_setImage(with: URL(string: "\(IMAGE_AVATAR_MEDIUM)\(listimage)"), placeholderImage: #imageLiteral(resourceName: "unknown"))
            }
            else
            {
                cell.profileImage.image = #imageLiteral(resourceName: "unknown")
            }
            if(getmessageListquery[indexPath.row].startDate != nil && getmessageListquery[indexPath.row].startDate != "")
            {
            let date = getdateValue(timestamp:(getmessageListquery[indexPath.row].startDate!))
            let day = getdayValue(timestamp: (getmessageListquery[indexPath.row].startDate!))
            let date1 = getdateValue(timestamp:(getmessageListquery[indexPath.row].endDate!))
            let day1 = getdayValue(timestamp: (getmessageListquery[indexPath.row].endDate!))
            cell.dateLAbel.text = "\(day), \(date) - \(day1), \(date1)"
            }
            let msgday = getdayValue(timestamp: (getmessageListquery[indexPath.row].createdAt!))
            let msgdate = getdateValue(timestamp:(getmessageListquery[indexPath.row].createdAt!))
            cell.receiverDateLabel.text = "\(msgday), \(msgdate)"
            cell.circleIndicationView.backgroundColor = Utility.shared.getbookingtypeColor(type: getmessageListquery[indexPath.row].type ?? "")
            return cell
        }
        else if(((getmessageListquery[indexPath.row].sentBy!) == (ResultArray.hostProfile?.userId!)) && (getmessageListquery[indexPath.row].startDate == nil ||  getmessageListquery[indexPath.row].startDate == ""))
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiverMessageonlyCell", for: indexPath)as! ReceiverMessageonlyCell
            cell.curveView.isHidden = false
            cell.selectionStyle = .none
             cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
            cell.receiverView.backgroundColor =  UIColor(named: "Button_Grey_Color")
            
//            cell.curveView.image = #imageLiteral(resourceName: "grey-centers").withRenderingMode(.alwaysTemplate)
//            cell.curveView.tintColor = UIColor(named: "Button_Grey_Color")
            if(getmessageListquery[indexPath.row].content == nil)
            {
                cell.messageLabel.text = ""
            }
            else{
                cell.messageLabel.text = getmessageListquery[indexPath.row].content != nil ? getmessageListquery[indexPath.row].content!.trimmingCharacters(in: .newlines) : ""
            }
            if(ResultArray.hostProfile?.picture != nil)
            {
                let listimage = (ResultArray.hostProfile?.picture!)!
                cell.profileimage.sd_setImage(with: URL(string: "\(IMAGE_AVATAR_MEDIUM)\(listimage)"), placeholderImage: #imageLiteral(resourceName: "unknown"))
            }
            else
            {
                cell.profileimage.image = #imageLiteral(resourceName: "unknown")
            }
            let msgday = getdayValue(timestamp: (getmessageListquery[indexPath.row].createdAt!))
            let msgdate = getdateValue(timestamp:(getmessageListquery[indexPath.row].createdAt!))
            cell.dateLabel.text = "\(msgday),\(msgdate)"
            return cell
        }
        else if(((getmessageListquery[indexPath.row].sentBy!) == (ResultArray.guestProfile?.userId!)) && (getmessageListquery[indexPath.row].startDate == nil || getmessageListquery[indexPath.row].startDate == ""))
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "sendCell", for: indexPath)as! sendCell
            cell.selectionStyle = .none
             cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
            cell.curveView.isHidden = false
           
            cell.senderView.backgroundColor = UIColor(named: "sendMessageBGColor")
//            cell.curveView.image = #imageLiteral(resourceName: "blue-center").withRenderingMode(.alwaysTemplate)
//            cell.curveView.tintColor = UIColor(named: "sendMessageBGColor")
            if(getmessageListquery[indexPath.row].content == "")
            {
                cell.messageLAbel.numberOfLines = 1
                cell.messageLAbel.text = ""
            }
            else{
                cell.messageLAbel.text = getmessageListquery[indexPath.row].content != nil ?  getmessageListquery[indexPath.row].content!.trimmingCharacters(in: .newlines) : ""
            }
            if(ResultArray.guestProfile?.picture != nil)
            {
                let listimage = (ResultArray.guestProfile?.picture!)!
                cell.profileImage.sd_setImage(with: URL(string: "\(IMAGE_AVATAR_MEDIUM)\(listimage)"), placeholderImage: #imageLiteral(resourceName: "unknown"))
            }
            else
            {
                cell.profileImage.image = #imageLiteral(resourceName: "unknown")
            }
            let msgday = getdayValue(timestamp: (getmessageListquery[indexPath.row].createdAt!))
            let msgdate = getdateValue(timestamp:(getmessageListquery[indexPath.row].createdAt!))
            cell.messageDateLabel.text = "\(msgday), \(msgdate)"
            
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InboxDateLabel", for: indexPath)as! InboxDateLabel
            // cell.messageLAbel.text = messageArray[indexPath.row] as? String
            cell.selectionStyle = .none
             cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
            cell.typeLAbel.text = Utility.shared.getbookingtype(type:(getmessageListquery[indexPath.row].type != nil ? getmessageListquery[indexPath.row].type! : ""))
            
            let date = getdateValue(timestamp:(getmessageListquery[indexPath.row].startDate!))
            let day = getdayValue(timestamp: (getmessageListquery[indexPath.row].startDate!))
            let date1 = getdateValue(timestamp:(getmessageListquery[indexPath.row].endDate!))
            let day1 = getdayValue(timestamp: (getmessageListquery[indexPath.row].endDate!))
            cell.dateLabel.text = "\(day), \(date) - \(day1), \(date1)"
            cell.circleIndicationView.backgroundColor = Utility.shared.getbookingtypeColor(type: getmessageListquery[indexPath.row].type ?? "")
            return cell
        }
        }

    }
    
    func ViewUpdation(){
        
        if Utility.shared.isConnectedToNetwork(){
            if getmessageListquery.count > 0 {
                
                print(getmessageListquery)
                let array = getmessageListquery
                print("reverse Action \(array)")
                
                
                
                array.reversed().forEach { print($0) } // e,d,c,b,a
                
                print(Array(array.reversed()))
                let reversedArray = Array(array.reversed())
                print(reversedArray)
              //  for i in reversedArray {
                    
                    let i = viewUpdateQuery
                
                //array.first(where: {$0.type != "message"})
                           
                print(i ?? 0)
                    
                if i.type == "preApproved"{
                        if(Utility.shared.host_message_isfromHost || Utility.shared.host_message_isfrommessage || Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification)
                        {

                            CustomHeaderView.frame = CGRect(x: 0, y: topView.frame.size.height+topView.frame.origin.y+5, width: FULLWIDTH, height: 100)
                            CustomHeaderView.backgroundColor = UIColor(named: "messageTopHeaderBG_Blue")
                            HeaderViewShadowView.frame = CGRect(x: 25, y: 2, width: CustomHeaderView.frame.size.width-50, height: CustomHeaderView.frame.size.height-4)
                            HeaderDescriptionTitle.frame = CGRect(x: 5, y: 6, width: HeaderViewShadowView.frame.size.width-10, height: 30)
                            
                            HeaderDescriptionTitle.text = "\((Utility.shared.getLanguage()?.value(forKey: "Request_Approved"))!)"
                             additionalTitle.isHidden = true
                            
                            // let BookingLabel = UILabel()
                            HeaderDescLabel.frame = CGRect(x: 5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+1, width: HeaderViewShadowView.frame.size.width-10, height: 60)
                            //HeaderDescLabel.backgroundColor = .blue
                            HeaderDescLabel.font = UIFont(name:APP_FONT, size:14)
                            HeaderDescLabel.text = "\((Utility.shared.getLanguage()?.value(forKey: "Host_preApprove_desc"))!)"
                            // HeaderViewShadowView.addSubview(BookingLabel)
                            if Utility.shared.isRTLLanguage()
                            {
                                HeaderActionBtn.frame = CGRect(x: HeaderViewShadowView.frame.size.width-205, y: HeaderDescLabel.frame.size.height+HeaderDescLabel.frame.origin.y+10, width: 200, height: 40)
                                TimeLabel.frame = CGRect(x: 5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
                            }
                            else
                            {
                                HeaderActionBtn.frame = CGRect(x: 5, y: HeaderDescLabel.frame.size.height+HeaderDescLabel.frame.origin.y+10, width: 200, height: 40)
                                TimeLabel.frame = CGRect(x: HeaderActionBtn.frame.size.width+HeaderActionBtn.frame.origin.x+5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
                            }
//                            HeaderActionBtn.frame = CGRect(x: 5, y: HeaderDescLabel.frame.size.height+HeaderDescLabel.frame.origin.y+10, width: 200, height: 40)
//                            TimeLabel.frame = CGRect(x: HeaderActionBtn.frame.size.width+HeaderActionBtn.frame.origin.x+5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
                            TimeLabel.font =  UIFont(name:APP_FONT_MEDIUM, size:14)
                            TimeLabel.frame = CGRect(x: HeaderActionBtn.frame.size.width+HeaderActionBtn.frame.origin.x+5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
                                                       TimeLabel.font =  UIFont(name: APP_FONT_MEDIUM, size:14)
                            HeaderActionBtn.removeTarget(self, action: nil, for: .allEvents)
                            HeaderDeclineButton.removeTarget(self, action: nil, for: .allEvents)
                            CustomHeaderView.isHidden = false
                            isformViewUpdation = true
                            HeaderViewShadowView.isHidden = false
                            HeaderDescriptionTitle.isHidden = false
                            HeaderActionBtn.isHidden = true
                            TimeLabel.isHidden = true
                            HeaderDeclineButton.isHidden = true
                            HeaderDescLabel.isHidden = false
                            
                            
                            //                        CustomHeaderView.isHidden = true
                            //                        isformViewUpdation = false
                            //                        HeaderViewShadowView.isHidden = true
                            //                        HeaderDescriptionTitle.isHidden = true
                            //                        HeaderActionBtn.isHidden = true
                            //                        TimeLabel.isHidden = true
                            //                        HeaderDeclineButton.isHidden = true
                            //                        HeaderDescLabel.isHidden = true
                            
                        }else {
                            

                            CustomHeaderView.frame = CGRect(x: 0, y: topView.frame.size.height+topView.frame.origin.y+5, width: FULLWIDTH, height: 160)
                            CustomHeaderView.backgroundColor = UIColor(named: "messageTopHeaderBG_Blue")
                            //CustomHeaderView.dropShadow(scale: true)
                            HeaderViewShadowView.frame = CGRect(x: 25, y: 2, width: CustomHeaderView.frame.size.width-50, height: CustomHeaderView.frame.size.height-4)
                            HeaderDescriptionTitle.frame = CGRect(x: 10, y: 6, width: HeaderViewShadowView.frame.size.width-20, height: 50)
                            TimeLabel.frame = CGRect(x: 10, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width, height: 40)
                            HeaderDescriptionTitle.text = "\((Utility.shared.getLanguage()?.value(forKey: "Booking_approved"))!) \(self.ResultArray.hostProfile?.firstName != nil ? ((self.ResultArray.hostProfile?.firstName!)!) : "") \((Utility.shared.getLanguage()?.value(forKey: "fortheirlisting"))!)"
                            if Utility.shared.isRTLLanguage()
                            {
                               HeaderActionBtn.frame = CGRect(x: HeaderViewShadowView.frame.size.width-85, y: TimeLabel.frame.size.height+TimeLabel.frame.origin.y+5, width: 80, height: 40)
                                
                            }
                            else
                            {
                            HeaderActionBtn.frame = CGRect(x: 10, y: TimeLabel.frame.size.height+TimeLabel.frame.origin.y+5, width: 80, height: 40)

                            }
                            HeaderActionBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey: "book"))!)", for: .normal)
                            HeaderActionBtn.setTitleColor(.white, for: .normal)
                            
                            HeaderActionBtn.backgroundColor = Theme.SECONDARY_COLOR
                            
                            TimeLabel.font = UIFont(name: APP_FONT_MEDIUM, size:14)
                            HeaderActionBtn.titleLabel?.font = UIFont(name: APP_FONT_MEDIUM, size:15)
                            
                            self.HeaderActionBtn.layer.borderWidth = 1.5
                            self.HeaderActionBtn.layer.borderColor = Theme.SECONDARY_COLOR.cgColor
                            self.HeaderActionBtn.layer.cornerRadius = self.HeaderActionBtn.frame.size.height / 2
                            self.HeaderActionBtn.clipsToBounds = true
                            
                            
                            
                            let CurrentDate = i.createdAt
                            let sDate = i.startDate
                            let edate = i.endDate
                            if(Int(sDate!) != nil && Int(edate!) != nil)
                            {
                                let timeStampValueStart = Int(sDate!)!/1000
                                let startingDate = Date(timeIntervalSince1970: TimeInterval(timeStampValueStart))
                                let timeStampValueEnd = Int(edate!)!/1000
                                let EndingDate = Date(timeIntervalSince1970: TimeInterval(timeStampValueEnd))
                                
                                let timeStampValue = Int(CurrentDate!)!/1000
                                let showDate = Date(timeIntervalSince1970: TimeInterval(timeStampValue))
                                
                                let TomorrowDate = Calendar.current.date(byAdding: .day, value: 2, to: showDate)
                                let dateFormaatter = DateFormatter()
                                dateFormaatter.timeZone = TimeZone(abbreviation: "UTC")
                                dateFormaatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                                
                                let dateFetched = dateFormaatter.string(from: TomorrowDate!)
                                
                                let datefetchedStart = dateFormaatter.string(from: startingDate)
                                let datefetchedEnd = dateFormaatter.string(from: EndingDate)
                                
                                startDate = datefetchedStart
                                EndDate = datefetchedEnd
                                
                                
                                
                                let releaseDateString = dateFetched
                                let releaseDateFormatter = DateFormatter()
                                releaseDateFormatter.timeZone = TimeZone(abbreviation: "UTC")
                                releaseDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                                
                                releaseDate = releaseDateFormatter.date(from: releaseDateString)! as NSDate
                                print(releaseDate)
                                countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(CountDownDate), userInfo: nil, repeats: true)
                                
                                TimeLabel.text = ""
                                let calendar = Calendar.current
                                let newDate = calendar.date(byAdding: .day, value: 1, to: releaseDate! as Date)
                                print(newDate)
                                let diffDateComponents = calendar.dateComponents([.day, .hour, .minute, .second], from: releaseDate! as Date, to:newDate!)
//
                                if let date = releaseDate as Date? {
                                    if let diff = Calendar.current.dateComponents([.hour], from: date, to: Date()).hour, diff > 24 {
                                        //do something
                                        print("Nothing")
                                        CustomHeaderView.isHidden = true
                                        isformViewUpdation = false
                                    }else{
                                        CustomHeaderView.isHidden = false
                                        
                                        isformViewUpdation = true
                                        HeaderViewShadowView.isHidden = false
                                        HeaderDescriptionTitle.isHidden = false
                                        HeaderActionBtn.isHidden = false
                                        TimeLabel.isHidden = false
                                        HeaderDeclineButton.isHidden = true
                                        HeaderDescLabel.isHidden = true
                                        HeaderActionBtn.removeTarget(self, action: nil, for: .allEvents)
                                        HeaderDeclineButton.removeTarget(self, action: nil, for: .allEvents)
                                        HeaderActionBtn.addTarget(self, action: #selector(NavigatetoBooking), for: .touchUpInside)
                                    }
                                }
//                                if diffDateComponents.hour == 0 && diffDateComponents.minute == 0 && diffDateComponents.second == 0{
//                                    CustomHeaderView.isHidden = true
//                                      isformViewUpdation = false
//                                }else{
//

                           //    }

                            }
                            
                        }
                        
                        
                }else if i.type == "inquiry"{
                        if(Utility.shared.host_message_isfromHost || Utility.shared.host_message_isfrommessage || Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification)
                        {
                            

                            CustomHeaderView.frame = CGRect(x: 0, y: topView.frame.size.height+topView.frame.origin.y+5, width: FULLWIDTH, height: 220)
                            CustomHeaderView.backgroundColor = UIColor(named: "messageTopHeaderBG_Blue")
                            //CustomHeaderView.dropShadow(scale: true)
                            HeaderViewShadowView.frame = CGRect(x:10, y: 2, width: CustomHeaderView.frame.size.width-20, height: CustomHeaderView.frame.size.height-4)
                            HeaderDescriptionTitle.frame = CGRect(x: 10, y: 6, width: HeaderViewShadowView.frame.size.width-20, height: 50)
                            TimeLabel.frame = CGRect(x: 10, y: additionalTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+60, width: HeaderDescriptionTitle.frame.size.width, height: 40)
                            HeaderDescriptionTitle.text = "\((Utility.shared.getLanguage()?.value(forKey: "Invite"))!) \(self.ResultArray.guestProfile?.firstName != nil ? ((self.ResultArray.guestProfile?.firstName!)!) : "") \((Utility.shared.getLanguage()?.value(forKey: "By_preApproving"))!)"
                            additionalTitle.frame = CGRect(x: 10, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+10, width: HeaderViewShadowView.frame.size.width-20, height: 50)
                            additionalTitle.isHidden = false
                            additionalTitle.text = "\((Utility.shared.getLanguage()?.value(forKey: "let"))!) \(self.ResultArray.guestProfile?.firstName != nil ? ((self.ResultArray.guestProfile?.firstName!)!) : "") \((Utility.shared.getLanguage()?.value(forKey: "knowthesedays"))!)"
                            additionalTitle.textColor =  UIColor(named: "searchPlaces_TextColor")
                            additionalTitle.numberOfLines = 2
                            if Utility.shared.isRTLLanguage()
                            {
                               HeaderActionBtn.frame = CGRect(x: HeaderViewShadowView.frame.size.width-165, y: TimeLabel.frame.size.height+TimeLabel.frame.origin.y+10, width: 160, height: 40)
                                
                            }
                            else
                            {
                            HeaderActionBtn.frame = CGRect(x: 10, y: TimeLabel.frame.size.height+TimeLabel.frame.origin.y+10, width: 160, height: 40)

                            }
//                            HeaderActionBtn.frame = CGRect(x: 10, y: TimeLabel.frame.size.height+TimeLabel.frame.origin.y+10, width: 160, height: 40)
                            HeaderActionBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey: "Pre_approve"))!)", for: .normal)
                            HeaderActionBtn.setTitleColor(.white, for: .normal)
                            HeaderActionBtn.backgroundColor = Theme.SECONDARY_COLOR
                            TimeLabel.font = UIFont(name: APP_FONT_MEDIUM, size:14)
                            
                            additionalTitle.font = UIFont(name: APP_FONT_MEDIUM, size:15)
                            HeaderActionBtn.titleLabel?.font = UIFont(name: APP_FONT_MEDIUM, size:15)
                            
                            
                            self.HeaderActionBtn.layer.borderWidth = 1.5
                            self.HeaderActionBtn.layer.borderColor = Theme.SECONDARY_COLOR.cgColor
                            self.HeaderActionBtn.layer.cornerRadius = self.HeaderActionBtn.frame.size.height/2
                            self.HeaderActionBtn.clipsToBounds = true
                            
                            let CurrentDate = i.createdAt //getmessageListquery.first?.createdAt
                            
                            let sDate = i.startDate //getmessageListquery.first?.startDate
                            
                            let edate = i.endDate //getmessageListquery.first?.endDate
                            if(Int(sDate!) != nil && Int(edate!) != nil) {
                            let timeStampValueStart = Int(sDate!)!/1000
                            let startingDate = Date(timeIntervalSince1970: TimeInterval(timeStampValueStart))
                            let timeStampValueEnd = Int(edate!)!/1000
                            let EndingDate = Date(timeIntervalSince1970: TimeInterval(timeStampValueEnd))
                            
                            
                            let timeStampValue = Int(CurrentDate!)!/1000
                            let showDate = Date(timeIntervalSince1970: TimeInterval(timeStampValue))
                            let TomorrowDate = Calendar.current.date(byAdding: .day, value: 2, to: showDate)
                            let dateFormaatter = DateFormatter()
                                dateFormaatter.timeZone = TimeZone(abbreviation: "UTC")
                            dateFormaatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                            let dateFetched = dateFormaatter.string(from: TomorrowDate!)
                            let datefetchedStart = dateFormaatter.string(from: startingDate)
                            let datefetchedEnd = dateFormaatter.string(from: EndingDate)
                            
                            
                            let releaseDateString = dateFetched
                            let releaseDateFormatter = DateFormatter()
                                releaseDateFormatter.timeZone = TimeZone(abbreviation: "UTC")
                            releaseDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                            releaseDate = releaseDateFormatter.date(from: releaseDateString)! as NSDate
                            countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(CountDownDate), userInfo: nil, repeats: true)
                            
                            TimeLabel.text = ""
                            
                            
                            
                            let calendar = Calendar.current
                            let newDate = calendar.date(byAdding: .day, value: 1, to: releaseDate! as Date)
                            print(newDate)
                            let diffDateComponents = calendar.dateComponents([.day, .hour, .minute, .second], from: releaseDate! as Date, to:newDate!)
                            //
                            if let date = releaseDate as Date? {
                            if let diff = Calendar.current.dateComponents([.hour], from: date, to: Date()).hour, diff > 24 {
                                                                    //do something
                            print("Nothing")
                            CustomHeaderView.isHidden = true
                            isformViewUpdation = false
                                
                            }else{
                                CustomHeaderView.isHidden = false
                                
                                isformViewUpdation = true
                                HeaderViewShadowView.isHidden = false
                                HeaderDescriptionTitle.isHidden = false
                                HeaderActionBtn.isHidden = false
                                TimeLabel.isHidden = false
                                HeaderDeclineButton.isHidden = true
                                HeaderDescLabel.isHidden = true
                                HeaderActionBtn.removeTarget(self, action: nil, for: .allEvents)
                                HeaderDeclineButton.removeTarget(self, action: nil, for: .allEvents)
                                HeaderActionBtn.addTarget(self, action: #selector(PreApproveTapped), for: .touchUpInside)
                                }
                            }
//                            if diffDateComponents.hour == 0 && diffDateComponents.minute == 0 && diffDateComponents.second == 0{
//
//                                CustomHeaderView.isHidden = true
//                                 isformViewUpdation = false
//
//                            }else{

//                            }
                            
                            }
                            HeaderDeclineButton.isHidden = true
                        }else{

                          
                            CustomHeaderView.frame = CGRect(x: 0, y: topView.frame.size.height+topView.frame.origin.y+5, width: FULLWIDTH, height: 160)
                            CustomHeaderView.backgroundColor = UIColor(named: "messageTopHeaderBG_Blue")
                            HeaderViewShadowView.frame = CGRect(x: 25, y: 2, width: CustomHeaderView.frame.size.width-50, height: CustomHeaderView.frame.size.height-4)
                            HeaderDescriptionTitle.frame = CGRect(x: 5, y: 6, width: HeaderViewShadowView.frame.size.width-10, height: 30)
                            
                            HeaderDescriptionTitle.text = "You messaged \(self.ResultArray.hostProfile?.firstName != nil ? ((self.ResultArray.hostProfile?.firstName!)!) : "")  about thier listing"
                            
                            // let BookingLabel = UILabel()
                            HeaderDescLabel.frame = CGRect(x: 5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+1, width: HeaderViewShadowView.frame.size.width-10, height: 60)
                            //HeaderDescLabel.backgroundColor = .blue
                            HeaderDescLabel.font = UIFont(name:APP_FONT, size:14)
                            HeaderDescLabel.text = "\((Utility.shared.getLanguage()?.value(forKey: "If_this_listing"))!)"
                            // HeaderViewShadowView.addSubview(BookingLabel)
                            if Utility.shared.isRTLLanguage()
                            {
                               HeaderActionBtn.frame = CGRect(x: HeaderViewShadowView.frame.size.width-205, y: HeaderDescLabel.frame.size.height+HeaderDescLabel.frame.origin.y+10, width: 200, height: 40)
                                 TimeLabel.frame = CGRect(x: 5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
                            }
                            else
                            {
                            HeaderActionBtn.frame = CGRect(x: 5, y: HeaderDescLabel.frame.size.height+HeaderDescLabel.frame.origin.y+10, width: 200, height: 40)
                                 TimeLabel.frame = CGRect(x: HeaderActionBtn.frame.size.width+HeaderActionBtn.frame.origin.x+5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
                            }
                           // HeaderActionBtn.frame = CGRect(x: 5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+10, width: 200, height: 40)
                            HeaderActionBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey: "requestbook"))!)", for: .normal)
                            HeaderActionBtn.setTitleColor(.white, for: .normal)
                            HeaderActionBtn.backgroundColor = Theme.SECONDARY_COLOR
                            HeaderActionBtn.titleLabel?.font = UIFont(name:APP_FONT_MEDIUM, size:15)
                           // TimeLabel.frame = CGRect(x: HeaderActionBtn.frame.size.width+HeaderActionBtn.frame.origin.x+5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
                            TimeLabel.font =  UIFont(name:APP_FONT_MEDIUM, size:14)
                            
                            
                            self.HeaderActionBtn.layer.borderWidth = 1.5
                            self.HeaderActionBtn.layer.borderColor = Theme.SECONDARY_COLOR.cgColor
                            self.HeaderActionBtn.layer.cornerRadius = self.HeaderActionBtn.frame.size.height/2
                            self.HeaderActionBtn.clipsToBounds = true
                            
                            CustomHeaderView.isHidden = false
                            
                            isformViewUpdation = true
                            HeaderViewShadowView.isHidden = false
                            HeaderDescriptionTitle.isHidden = false
                            HeaderActionBtn.isHidden = false
                            TimeLabel.isHidden = true
                            HeaderDeclineButton.isHidden = true
                      HeaderDescLabel.isHidden = false
                            HeaderActionBtn.removeTarget(self, action: nil, for: .allEvents)
                            HeaderDeclineButton.removeTarget(self, action: nil, for: .allEvents)
                            HeaderActionBtn.addTarget(self, action: #selector(requesttoBookTapped), for: .touchUpInside)
                            // TimeLabel.isHidden = true
                        }
                        
                }else if i.type == "instantBooking" || i.type == "intantBooking" {

                        if(Utility.shared.host_message_isfromHost || Utility.shared.host_message_isfrommessage || Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification)
                        {
                            
                            CustomHeaderView.frame = CGRect(x: 0, y: topView.frame.size.height+topView.frame.origin.y+5, width: FULLWIDTH, height: 160)
                            CustomHeaderView.backgroundColor = UIColor(named: "messageTopHeaderBG_Blue")
                            HeaderViewShadowView.frame = CGRect(x: 25, y: 2, width: CustomHeaderView.frame.size.width-50, height: CustomHeaderView.frame.size.height-4)
                            HeaderDescriptionTitle.frame = CGRect(x: 5, y: 6, width: HeaderViewShadowView.frame.size.width-10, height: 30)
                            
                            HeaderDescriptionTitle.text = "\((Utility.shared.getLanguage()?.value(forKey: "Book_conformed"))!)"
                            
                            // let BookingLabel = UILabel()
                            HeaderDescLabel.frame = CGRect(x: 5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+1, width: HeaderViewShadowView.frame.size.width-10, height: 60)
                            //HeaderDescLabel.backgroundColor = .blue
                            HeaderDescLabel.font = UIFont(name:APP_FONT, size:14)
                            HeaderDescLabel.text = "\((Utility.shared.getLanguage()?.value(forKey: "Booking_hostDesc"))!)"
                            // HeaderViewShadowView.addSubview(BookingLabel)
                            if Utility.shared.isRTLLanguage()
                            {
                               HeaderActionBtn.frame = CGRect(x: HeaderViewShadowView.frame.size.width-205, y: HeaderDescLabel.frame.size.height+HeaderDescLabel.frame.origin.y+10, width: 200, height: 40)
                                 TimeLabel.frame = CGRect(x: 5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
                            }
                            else
                            {
                            HeaderActionBtn.frame = CGRect(x: 5, y: HeaderDescLabel.frame.size.height+HeaderDescLabel.frame.origin.y+10, width: 200, height: 40)
                                 TimeLabel.frame = CGRect(x: HeaderActionBtn.frame.size.width+HeaderActionBtn.frame.origin.x+5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
                            }
                          //  HeaderActionBtn.frame = CGRect(x: 5, y: HeaderDescLabel.frame.size.height+HeaderDescLabel.frame.origin.y+10, width: 200, height: 40)
                            HeaderActionBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey: "cancelReservation"))!)", for: .normal)
                            HeaderActionBtn.setTitleColor(.white, for: .normal)
                            HeaderActionBtn.backgroundColor = Theme.SECONDARY_COLOR
                            HeaderActionBtn.titleLabel?.font = UIFont(name:APP_FONT_MEDIUM, size:15)
                          //  TimeLabel.frame = CGRect(x: HeaderActionBtn.frame.size.width+HeaderActionBtn.frame.origin.x+5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
                            TimeLabel.font =  UIFont(name:APP_FONT_MEDIUM, size:14)
                            
                            self.HeaderActionBtn.layer.borderWidth = 1.5
                            self.HeaderActionBtn.layer.borderColor = Theme.SECONDARY_COLOR.cgColor
                            self.HeaderActionBtn.layer.cornerRadius = self.HeaderActionBtn.frame.size.height/2
                            self.HeaderActionBtn.clipsToBounds = true
                            
                            HeaderActionBtn.removeTarget(self, action: nil, for: .allEvents)
                            HeaderDeclineButton.removeTarget(self, action: nil, for: .allEvents)
                            HeaderActionBtn.addTarget(self, action: #selector(cancelReservationHost), for: .touchUpInside)
                            CustomHeaderView.isHidden = false
                            isformViewUpdation = true
                            HeaderViewShadowView.isHidden = false
                            HeaderDescriptionTitle.isHidden = false
                            HeaderActionBtn.isHidden = false
                            TimeLabel.isHidden = true
                            HeaderDeclineButton.isHidden = true
                            HeaderDescLabel.isHidden = false
                            
                        }else{
                            
                            CustomHeaderView.frame = CGRect(x: 0, y: topView.frame.size.height+topView.frame.origin.y+5, width: FULLWIDTH, height: 160)
                            CustomHeaderView.backgroundColor = UIColor(named: "messageTopHeaderBG_Blue")
                            HeaderViewShadowView.frame = CGRect(x: 25, y: 2, width: CustomHeaderView.frame.size.width-50, height: CustomHeaderView.frame.size.height-4)
                            HeaderDescriptionTitle.frame = CGRect(x: 5, y: 6, width: HeaderViewShadowView.frame.size.width-10, height: 30)
                            
                            HeaderDescriptionTitle.text = "\((Utility.shared.getLanguage()?.value(forKey: "Book_conformed"))!)"
                            
                            // let BookingLabel = UILabel()
                            HeaderDescLabel.frame = CGRect(x: 5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+1, width: HeaderViewShadowView.frame.size.width-10, height: 60)
                            //HeaderDescLabel.backgroundColor = .blue
                            HeaderDescLabel.font = UIFont(name:APP_FONT, size:14)
                            HeaderDescLabel.text = "\((Utility.shared.getLanguage()?.value(forKey: "Booking_guestDesc"))!)"
                            // HeaderViewShadowView.addSubview(BookingLabel)
                            if Utility.shared.isRTLLanguage()
                            {
                               HeaderActionBtn.frame = CGRect(x: HeaderViewShadowView.frame.size.width-205, y: HeaderDescLabel.frame.size.height+HeaderDescLabel.frame.origin.y+10, width: 200, height: 40)
                                 TimeLabel.frame = CGRect(x: 5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
                            }
                            else
                            {
                            HeaderActionBtn.frame = CGRect(x: 5, y: HeaderDescLabel.frame.size.height+HeaderDescLabel.frame.origin.y+10, width: 200, height: 40)
                            TimeLabel.frame = CGRect(x: HeaderActionBtn.frame.size.width+HeaderActionBtn.frame.origin.x+5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
                            }
                            HeaderActionBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey: "cancelReservation"))!)", for: .normal)
                            HeaderActionBtn.setTitleColor(.white, for: .normal)
                            HeaderActionBtn.backgroundColor = Theme.SECONDARY_COLOR
                            HeaderActionBtn.titleLabel?.font = UIFont(name: APP_FONT_MEDIUM, size:15)
//                            TimeLabel.frame = CGRect(x: HeaderActionBtn.frame.size.width+HeaderActionBtn.frame.origin.x+5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
                            TimeLabel.font =  UIFont(name:APP_FONT_MEDIUM, size:14)
                            
                            self.HeaderActionBtn.layer.borderWidth = 1.5
                            self.HeaderActionBtn.layer.borderColor = Theme.SECONDARY_COLOR.cgColor
                            self.HeaderActionBtn.layer.cornerRadius = self.HeaderActionBtn.frame.size.height/2
                            self.HeaderActionBtn.clipsToBounds = true
                            
                            HeaderActionBtn.removeTarget(self, action: nil, for: .allEvents)
                            HeaderDeclineButton.removeTarget(self, action: nil, for: .allEvents)
                            HeaderActionBtn.addTarget(self, action: #selector(cancelReservationGuest), for: .touchUpInside)
                            CustomHeaderView.isHidden = false
                            isformViewUpdation = true
                            HeaderViewShadowView.isHidden = false
                            HeaderDescriptionTitle.isHidden = false
                            HeaderActionBtn.isHidden = false
                            TimeLabel.isHidden = true
                            HeaderDeclineButton.isHidden = true
                            HeaderDescLabel.isHidden = false
                            
                        }
                        
                        //                    CustomHeaderView.isHidden = true
                        //                    isformViewUpdation = false
                        //                    HeaderViewShadowView.isHidden = true
                        //                    HeaderDescriptionTitle.isHidden = true
                        //                    HeaderActionBtn.isHidden = true
                        //                    TimeLabel.isHidden = true
                        
                }else if i.type == "requestToBook" {

                        if(Utility.shared.host_message_isfromHost || Utility.shared.host_message_isfrommessage || Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification)
                        {
                            
                            CustomHeaderView.frame = CGRect(x: 0, y: topView.frame.size.height+topView.frame.origin.y+5, width: FULLWIDTH, height: 160)
                            CustomHeaderView.backgroundColor = UIColor(named: "messageTopHeaderBG_Blue")
                            //CustomHeaderView.dropShadow(scale: true)
                            HeaderViewShadowView.frame = CGRect(x:10, y: 2, width: CustomHeaderView.frame.size.width-20, height: CustomHeaderView.frame.size.height-4)
                            HeaderDescriptionTitle.frame = CGRect(x: 10, y: 6, width: HeaderViewShadowView.frame.size.width-20, height: 50)
                            TimeLabel.frame = CGRect(x: 10, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width, height: 40)
                            HeaderDescriptionTitle.text = "\((self.ResultArray.guestProfile?.firstName != nil ? ((self.ResultArray.guestProfile?.firstName!)!) : "")) \((Utility.shared.getLanguage()?.value(forKey: "Guest_BookingRequest"))!)"
                            
                            HeaderActionBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey: "approve"))!)", for: .normal)
                            HeaderActionBtn.setTitleColor(.white, for: .normal)
                            HeaderActionBtn.backgroundColor = Theme.SECONDARY_COLOR
                            TimeLabel.font = UIFont(name: APP_FONT_MEDIUM, size:14)
                            HeaderActionBtn.titleLabel?.font = UIFont(name: APP_FONT_MEDIUM, size:15)
                            HeaderActionBtn.removeTarget(self, action: nil, for: .allEvents)
                            HeaderActionBtn.addTarget(self, action: #selector(Approve_btn_tapped), for: .touchUpInside)
                            
                            HeaderDeclineButton.setTitle("\((Utility.shared.getLanguage()?.value(forKey: "decline"))!)", for: .normal)
                            HeaderDeclineButton.setTitleColor(Theme.SECONDARY_COLOR, for: .normal)
                            HeaderDeclineButton.titleLabel?.font = UIFont(name: APP_FONT_MEDIUM, size: 15)
                            
                            
                            if Utility.shared.isRTLLanguage(){
                                HeaderDeclineButton.frame = CGRect(x: HeaderViewShadowView.frame.size.width-215, y: HeaderDescLabel.frame.size.height+HeaderDescLabel.frame.origin.y+10, width: 100, height: 40)
                                HeaderActionBtn.frame = CGRect(x: HeaderDeclineButton.frame.size.width+HeaderDeclineButton.frame.origin.x+5, y: HeaderDeclineButton.frame.origin.y, width: 100, height: 40)
                            }else{
                                HeaderActionBtn.frame = CGRect(x: 10, y: TimeLabel.frame.size.height+TimeLabel.frame.origin.y+5, width: 100, height: 40)
                                HeaderDeclineButton.frame = CGRect(x: HeaderActionBtn.frame.size.width+HeaderActionBtn.frame.origin.x+5, y: HeaderActionBtn.frame.origin.y, width: 100, height: 40)
                            }
                            self.HeaderActionBtn.layer.borderWidth = 1.5
                            self.HeaderActionBtn.layer.borderColor = Theme.SECONDARY_COLOR.cgColor
                            self.HeaderActionBtn.layer.cornerRadius = self.HeaderActionBtn.frame.size.height/2
                            self.HeaderActionBtn.clipsToBounds = true
                            
                            self.HeaderDeclineButton.layer.borderWidth = 1.5
                            self.HeaderDeclineButton.layer.borderColor = Theme.SECONDARY_COLOR.cgColor
                            self.HeaderDeclineButton.layer.cornerRadius = self.HeaderDeclineButton.frame.size.height/2
                            self.HeaderDeclineButton.clipsToBounds = true
                            HeaderDeclineButton.removeTarget(self, action: nil, for: .allEvents)
                            self.HeaderDeclineButton.addTarget(self, action: #selector(decline_btn_tapped), for: .touchUpInside)
                            
                            let CurrentDate = i.createdAt //getmessageListquery.first?.createdAt
                            
                            let sDate = i.startDate //getmessageListquery.first?.startDate
                            
                            let edate = i.endDate //getmessageListquery.first?.endDate
                            if(Int(sDate!) != nil && Int(edate!) != nil) {
                            let timeStampValueStart = Int(sDate!)!/1000
                            let startingDate = Date(timeIntervalSince1970: TimeInterval(timeStampValueStart))
                            let timeStampValueEnd = Int(edate!)!/1000
                            let EndingDate = Date(timeIntervalSince1970: TimeInterval(timeStampValueEnd))
                            
                            
                            let timeStampValue = Int(CurrentDate!)!/1000
                            let showDate = Date(timeIntervalSince1970: TimeInterval(timeStampValue))
                            let TomorrowDate = Calendar.current.date(byAdding: .day, value: 1, to: showDate)
                            let dateFormaatter = DateFormatter()
                            dateFormaatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                                dateFormaatter.timeZone = TimeZone(abbreviation: "UTC")
                            let dateFetched = dateFormaatter.string(from: TomorrowDate!)
                            let datefetchedStart = dateFormaatter.string(from: startingDate)
                            let datefetchedEnd = dateFormaatter.string(from: EndingDate)
                            
                            
                            let releaseDateString = dateFetched
                            let releaseDateFormatter = DateFormatter()
                                releaseDateFormatter.timeZone = TimeZone(abbreviation: "UTC")
                            releaseDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                            releaseDate = releaseDateFormatter.date(from: releaseDateString)! as NSDate
                            countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(CountDownDate), userInfo: nil, repeats: true)
                            
                            let calendar = Calendar.current
                            let newDate = calendar.date(byAdding: .day, value: 1, to: releaseDate! as Date)
                            print(newDate)
                            let diffDateComponents = calendar.dateComponents([.day, .hour, .minute, .second], from: releaseDate! as Date, to:newDate!)
                            
                                
                                let checkDate = releaseDate! as Date
                                
                                if checkDate < Date() {
//                            if diffDateComponents.hour == 0 && diffDateComponents.minute == 0 && diffDateComponents.second == 0{
                                CustomHeaderView.isHidden = true
                                 isformViewUpdation = false
                            }else{
                            
                                
                                CustomHeaderView.isHidden = false
                                isformViewUpdation = true
                                HeaderViewShadowView.isHidden = false
                                HeaderDescriptionTitle.isHidden = false
                                HeaderActionBtn.isHidden = false
                                TimeLabel.isHidden = false
                                HeaderDeclineButton.isHidden = false
                                HeaderDescLabel.isHidden = true
                                additionalTitle.isHidden = true
                            }
                            }
                            
                        }else{
                            
                            countdownTimer.invalidate()
                            
                            CustomHeaderView.frame = CGRect(x: 0, y: topView.frame.size.height+topView.frame.origin.y+5, width: FULLWIDTH, height: 90)
                            CustomHeaderView.backgroundColor = UIColor(named: "messageTopHeaderBG_Blue")
                            //CustomHeaderView.dropShadow(scale: true)
                            HeaderViewShadowView.frame = CGRect(x: 25, y: 2, width: CustomHeaderView.frame.size.width-50, height: CustomHeaderView.frame.size.height-4)
                            HeaderDescriptionTitle.frame = CGRect(x: 10, y: 6, width: HeaderViewShadowView.frame.size.width-20, height: 50)
                            HeaderDescLabel.frame = CGRect(x: 10, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width, height: 20)
                            HeaderDescriptionTitle.text = "\((Utility.shared.getLanguage()?.value(forKey: "yourrequest"))!) \(self.ResultArray.hostProfile?.firstName != nil ? ((self.ResultArray.hostProfile?.firstName!)!) : "") \((Utility.shared.getLanguage()?.value(forKey: "listing"))!)"
                            //TimeLabel.backgroundColor = .blue
                            HeaderDescLabel.text = "\((Utility.shared.getLanguage()?.value(forKey: "hostrespond"))!)"
                            HeaderDescLabel.font = UIFont(name: APP_FONT, size:14)
                            //HeaderViewShadowView.addSubview(TextLabel)
                            CustomHeaderView.isHidden = false
                            isformViewUpdation = true
                            HeaderViewShadowView.isHidden = false
                            HeaderDescriptionTitle.isHidden = false
                            HeaderActionBtn.isHidden = true
                            TimeLabel.isHidden = true
                            HeaderDeclineButton.isHidden = true
                            HeaderDescLabel.isHidden = false
                        }
                        
                        
                    }else if i.type == "cancelledByGuest"{

                        if(Utility.shared.host_message_isfromHost || Utility.shared.host_message_isfrommessage || Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification)
                        {
                            CustomHeaderView.frame = CGRect(x: 0, y: topView.frame.size.height+topView.frame.origin.y+5, width: FULLWIDTH, height: 80)
                            CustomHeaderView.backgroundColor = UIColor(named: "messageTopHeaderBG_Blue")
                            HeaderViewShadowView.frame = CGRect(x: 25, y: 2, width: CustomHeaderView.frame.size.width-50, height: CustomHeaderView.frame.size.height-4)
                            HeaderDescriptionTitle.frame = CGRect(x: 5, y: 6, width: HeaderViewShadowView.frame.size.width-10, height: 30)
                            
                            HeaderDescriptionTitle.text = "\((Utility.shared.getLanguage()?.value(forKey: "Booking_cancel_Head"))!)"
                            additionalTitle.isHidden = true
                            // let BookingLabel = UILabel()
                            HeaderDescLabel.frame = CGRect(x: 5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+1, width: HeaderViewShadowView.frame.size.width-10, height: 60)
                            //HeaderDescLabel.backgroundColor = .blue
                            HeaderDescLabel.font = UIFont(name:APP_FONT, size:12)
                            HeaderDescLabel.text = "\(ResultArray.guestProfile?.firstName != nil ? ((ResultArray.guestProfile?.firstName)!) : "") \((Utility.shared.getLanguage()?.value(forKey: "Booking_cancelled_Guest"))!)"
                            // HeaderViewShadowView.addSubview(BookingLabel)
                            HeaderActionBtn.frame = CGRect(x: 5, y: HeaderDescLabel.frame.size.height+HeaderDescLabel.frame.origin.y+10, width: 200, height: 40)
                            TimeLabel.frame = CGRect(x: HeaderActionBtn.frame.size.width+HeaderActionBtn.frame.origin.x+5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
                            TimeLabel.font =  UIFont(name:APP_FONT_MEDIUM, size:14)
                            HeaderActionBtn.removeTarget(self, action: nil, for: .allEvents)
                            HeaderDeclineButton.removeTarget(self, action: nil, for: .allEvents)
                            CustomHeaderView.isHidden = false
                            isformViewUpdation = true
                            HeaderViewShadowView.isHidden = false
                            HeaderDescriptionTitle.isHidden = false
                            HeaderActionBtn.isHidden = true
                            TimeLabel.isHidden = true
                            HeaderDeclineButton.isHidden = true
                            HeaderDescLabel.isHidden = false
                            
                        }else{
                            countdownTimer.invalidate()
                            countdownTimer = Timer()
                            CustomHeaderView.frame = CGRect(x: 0, y: topView.frame.size.height+topView.frame.origin.y+5, width: FULLWIDTH, height: 100)
                            CustomHeaderView.backgroundColor = UIColor(named: "messageTopHeaderBG_Blue")
                            HeaderViewShadowView.frame = CGRect(x: 25, y: 2, width: CustomHeaderView.frame.size.width-50, height: CustomHeaderView.frame.size.height-4)
                            HeaderDescriptionTitle.frame = CGRect(x: 5, y: 6, width: HeaderViewShadowView.frame.size.width-10, height: 30)
                            
                            HeaderDescriptionTitle.text = "\((Utility.shared.getLanguage()?.value(forKey: "Booking_cancel_Head"))!)"
                            additionalTitle.isHidden = true
                            // let BookingLabel = UILabel()
                            HeaderDescLabel.frame = CGRect(x: 5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+1, width: HeaderViewShadowView.frame.size.width-10, height: 60)
                            //HeaderDescLabel.backgroundColor = .blue
                            HeaderDescLabel.font = UIFont(name: APP_FONT, size:14)
                            HeaderDescLabel.text = "\((Utility.shared.getLanguage()?.value(forKey: "Booking_cancelled_desc"))!)"
                            // HeaderViewShadowView.addSubview(BookingLabel)
                            HeaderActionBtn.frame = CGRect(x: 5, y: HeaderDescLabel.frame.size.height+HeaderDescLabel.frame.origin.y+10, width: 200, height: 40)
                            TimeLabel.frame = CGRect(x: HeaderActionBtn.frame.size.width+HeaderActionBtn.frame.origin.x+5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
                            TimeLabel.font =  UIFont(name: APP_FONT_MEDIUM, size:14)
                            HeaderActionBtn.removeTarget(self, action: nil, for: .allEvents)
                            HeaderDeclineButton.removeTarget(self, action: nil, for: .allEvents)
                            CustomHeaderView.isHidden = false
                            isformViewUpdation = true
                            HeaderViewShadowView.isHidden = false
                            HeaderDescriptionTitle.isHidden = false
                            HeaderActionBtn.isHidden = true
                            TimeLabel.isHidden = true
                            HeaderDeclineButton.isHidden = true
                            HeaderDescLabel.isHidden = false
                        }
                        
                        
                    }else if i.type == "cancelledByHost"{

                        if(Utility.shared.host_message_isfromHost || Utility.shared.host_message_isfrommessage || Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification)
                        {
                            CustomHeaderView.frame = CGRect(x: 0, y: topView.frame.size.height+topView.frame.origin.y+5, width: FULLWIDTH, height: 80)
                            CustomHeaderView.backgroundColor = UIColor(named: "messageTopHeaderBG_Blue")
                            HeaderViewShadowView.frame = CGRect(x: 25, y: 2, width: CustomHeaderView.frame.size.width-50, height: CustomHeaderView.frame.size.height-4)
                            HeaderDescriptionTitle.frame = CGRect(x: 5, y: 6, width: HeaderViewShadowView.frame.size.width-10, height: 20)
                            
                            HeaderDescriptionTitle.text = "\((Utility.shared.getLanguage()?.value(forKey: "Booking_cancel_Head"))!)"
                             additionalTitle.isHidden = true
                            
                            // let BookingLabel = UILabel()
                            HeaderDescLabel.frame = CGRect(x: 5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+1, width: HeaderViewShadowView.frame.size.width-10, height: 40)
                            //HeaderDescLabel.backgroundColor = .blue
                            HeaderDescLabel.font = UIFont(name: APP_FONT_MEDIUM, size:14)
                            HeaderDescLabel.text = "\(ResultArray.guestProfile?.firstName != nil ? ((ResultArray.guestProfile?.firstName)!) : "") \((Utility.shared.getLanguage()?.value(forKey: "Booking_cancelled_Host"))!)"
                            // HeaderViewShadowView.addSubview(BookingLabel)
                            if Utility.shared.isRTLLanguage()
                            {
                                HeaderActionBtn.frame = CGRect(x: HeaderViewShadowView.frame.size.width-205, y: HeaderDescLabel.frame.size.height+HeaderDescLabel.frame.origin.y+10, width: 200, height: 40)
                                TimeLabel.frame = CGRect(x: 5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
                            }
                            else
                            {
                                 HeaderActionBtn.frame = CGRect(x: 5, y: HeaderDescLabel.frame.size.height+HeaderDescLabel.frame.origin.y+10, width: 200, height: 40)
                                                          TimeLabel.frame = CGRect(x: HeaderActionBtn.frame.size.width+HeaderActionBtn.frame.origin.x+5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
                            }
                          
                            TimeLabel.font =  UIFont(name:APP_FONT_MEDIUM, size:14)
                            HeaderActionBtn.removeTarget(self, action: nil, for: .allEvents)
                            HeaderDeclineButton.removeTarget(self, action: nil, for: .allEvents)
                            CustomHeaderView.isHidden = false
                            isformViewUpdation = true
                            HeaderViewShadowView.isHidden = false
                            HeaderDescriptionTitle.isHidden = false
                            HeaderActionBtn.isHidden = true
                            TimeLabel.isHidden = true
                            HeaderDeclineButton.isHidden = true
                            HeaderDescLabel.isHidden = false
                            
                            
                        }else{
                            
                            CustomHeaderView.frame = CGRect(x: 0, y: topView.frame.size.height+topView.frame.origin.y+5, width: FULLWIDTH, height: 80)
                            CustomHeaderView.backgroundColor = UIColor(named: "messageTopHeaderBG_Blue")
                            HeaderViewShadowView.frame = CGRect(x: 25, y: 2, width: CustomHeaderView.frame.size.width-50, height: CustomHeaderView.frame.size.height-4)
                            HeaderDescriptionTitle.frame = CGRect(x: 5, y: 6, width: HeaderViewShadowView.frame.size.width-10, height: 20)
                            
                            HeaderDescriptionTitle.text = "\((Utility.shared.getLanguage()?.value(forKey: "Booking_cancel_Head"))!)"
                             additionalTitle.isHidden = true
                            
                            // let BookingLabel = UILabel()
                            HeaderDescLabel.frame = CGRect(x: 5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+1, width: HeaderViewShadowView.frame.size.width-10, height: 40)
                            //HeaderDescLabel.backgroundColor = .blue
                            HeaderDescLabel.font = UIFont(name:APP_FONT, size:12)
                            HeaderDescLabel.text = "\(ResultArray.hostProfile?.firstName != nil ? ((ResultArray.hostProfile?.firstName)!) : "") \((Utility.shared.getLanguage()?.value(forKey: "Booking_cancelled_Guest"))!)"
                            // HeaderViewShadowView.addSubview(BookingLabel)
                            if Utility.shared.isRTLLanguage()
                            {
                                       HeaderActionBtn.frame = CGRect(x: HeaderViewShadowView.frame.size.width-205, y: HeaderDescLabel.frame.size.height+HeaderDescLabel.frame.origin.y+10, width: 200, height: 40)
                                           TimeLabel.frame = CGRect(x: 5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
                               }
                               else
                               {
                                      HeaderActionBtn.frame = CGRect(x: 5, y: HeaderDescLabel.frame.size.height+HeaderDescLabel.frame.origin.y+10, width: 200, height: 40)
                                                                  TimeLabel.frame = CGRect(x: HeaderActionBtn.frame.size.width+HeaderActionBtn.frame.origin.x+5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
                               }
                           
                            TimeLabel.font =  UIFont(name: APP_FONT_MEDIUM, size:14)
                            HeaderActionBtn.removeTarget(self, action: nil, for: .allEvents)
                            HeaderDeclineButton.removeTarget(self, action: nil, for: .allEvents)
                            CustomHeaderView.isHidden = false
                            isformViewUpdation = true
                            HeaderViewShadowView.isHidden = false
                            HeaderDescriptionTitle.isHidden = false
                            HeaderActionBtn.isHidden = true
                            TimeLabel.isHidden = true
                            HeaderDeclineButton.isHidden = true
                            HeaderDescLabel.isHidden = false
                        }
                    }else if i.type == "declined" {

                        if(Utility.shared.host_message_isfromHost || Utility.shared.host_message_isfrommessage || Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification)
                        {
                            CustomHeaderView.frame = CGRect(x: 0, y: topView.frame.size.height+topView.frame.origin.y+5, width: FULLWIDTH, height: 110)
                            CustomHeaderView.backgroundColor = UIColor(named: "messageTopHeaderBG_Blue")
                            HeaderViewShadowView.frame = CGRect(x: 25, y: 2, width: CustomHeaderView.frame.size.width-50, height: CustomHeaderView.frame.size.height-4)
                            HeaderDescriptionTitle.frame = CGRect(x: 5, y: 6, width: HeaderViewShadowView.frame.size.width-10, height: 30)
                            
                            HeaderDescriptionTitle.text = "\((Utility.shared.getLanguage()?.value(forKey: "requestdeclined"))!)"
                             additionalTitle.isHidden = true
                            
                            // let BookingLabel = UILabel()
                            HeaderDescLabel.frame = CGRect(x: 5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+1, width: HeaderViewShadowView.frame.size.width-10, height: 60)
                            //HeaderDescLabel.backgroundColor = .blue
                            HeaderDescLabel.font = UIFont(name:APP_FONT, size:14)
                            HeaderDescLabel.text = "\((Utility.shared.getLanguage()?.value(forKey: "declined_host"))!)"
                            // HeaderViewShadowView.addSubview(BookingLabel)
                            HeaderActionBtn.frame = CGRect(x: 5, y: HeaderDescLabel.frame.size.height+HeaderDescLabel.frame.origin.y+10, width: 200, height: 40)
                            TimeLabel.frame = CGRect(x: HeaderActionBtn.frame.size.width+HeaderActionBtn.frame.origin.x+5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
                            TimeLabel.font =  UIFont(name:APP_FONT_MEDIUM, size:14)
                            
                            HeaderActionBtn.removeTarget(self, action: nil, for: .allEvents)
                            HeaderDeclineButton.removeTarget(self, action: nil, for: .allEvents)
                            CustomHeaderView.isHidden = false
                            isformViewUpdation = true
                            HeaderViewShadowView.isHidden = false
                            HeaderDescriptionTitle.isHidden = false
                            HeaderActionBtn.isHidden = true
                            TimeLabel.isHidden = true
                            HeaderDeclineButton.isHidden = true
                            HeaderDescLabel.isHidden = false
                            
                        }else{
                            
                            CustomHeaderView.frame = CGRect(x: 0, y: topView.frame.size.height+topView.frame.origin.y+5, width: FULLWIDTH, height: 110)
                            CustomHeaderView.backgroundColor = UIColor(named: "messageTopHeaderBG_Blue")
                            HeaderViewShadowView.frame = CGRect(x: 25, y: 2, width: CustomHeaderView.frame.size.width-50, height: CustomHeaderView.frame.size.height-4)
                            HeaderDescriptionTitle.frame = CGRect(x: 5, y: 6, width: HeaderViewShadowView.frame.size.width-10, height: 30)
                            
                            HeaderDescriptionTitle.text = "\((Utility.shared.getLanguage()?.value(forKey: "requestdeclined"))!)"
                             additionalTitle.isHidden = true
                            
                            // let BookingLabel = UILabel()
                            HeaderDescLabel.frame = CGRect(x: 5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+1, width: HeaderViewShadowView.frame.size.width-10, height: 60)
                            //HeaderDescLabel.backgroundColor = .blue
                            HeaderDescLabel.font = UIFont(name: APP_FONT, size:14)
                            HeaderDescLabel.text = "\((Utility.shared.getLanguage()?.value(forKey: "declined_guest"))!)"
                            // HeaderViewShadowView.addSubview(BookingLabel)
                            HeaderActionBtn.frame = CGRect(x: 5, y: HeaderDescLabel.frame.size.height+HeaderDescLabel.frame.origin.y+10, width: 200, height: 40)
                            TimeLabel.frame = CGRect(x: HeaderActionBtn.frame.size.width+HeaderActionBtn.frame.origin.x+5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
                            TimeLabel.font =  UIFont(name: APP_FONT_MEDIUM, size:14)
                            
                            HeaderActionBtn.removeTarget(self, action: nil, for: .allEvents)
                            HeaderDeclineButton.removeTarget(self, action: nil, for: .allEvents)
                            CustomHeaderView.isHidden = false
                            isformViewUpdation = true
                            HeaderViewShadowView.isHidden = false
                            HeaderDescriptionTitle.isHidden = false
                            HeaderActionBtn.isHidden = true
                            TimeLabel.isHidden = true
                            HeaderDeclineButton.isHidden = true
                            HeaderDescLabel.isHidden = false
                            
                        }
                    }else if i.type == "approved"{

                        if(Utility.shared.host_message_isfromHost || Utility.shared.host_message_isfrommessage || Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification)
                        {
                            
                            CustomHeaderView.frame = CGRect(x: 0, y: topView.frame.size.height+topView.frame.origin.y+5, width: FULLWIDTH, height: 160)
                            CustomHeaderView.backgroundColor = UIColor(named: "messageTopHeaderBG_Blue")
                            HeaderViewShadowView.frame = CGRect(x: 25, y: 2, width: CustomHeaderView.frame.size.width-50, height: CustomHeaderView.frame.size.height-4)
                            HeaderDescriptionTitle.frame = CGRect(x: 5, y: 6, width: HeaderViewShadowView.frame.size.width-10, height: 30)
                            
                            HeaderDescriptionTitle.text = "\((Utility.shared.getLanguage()?.value(forKey: "Book_conformed"))!)"
                             additionalTitle.isHidden = true
                            
                            // let BookingLabel = UILabel()
                            HeaderDescLabel.frame = CGRect(x: 5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+1, width: HeaderViewShadowView.frame.size.width-10, height: 60)
                            //HeaderDescLabel.backgroundColor = .blue
                            HeaderDescLabel.font = UIFont(name:APP_FONT, size:14)
                            HeaderDescLabel.text = "\((Utility.shared.getLanguage()?.value(forKey: "Booking_hostDesc"))!)"
                            // HeaderViewShadowView.addSubview(BookingLabel)
                            if Utility.shared.isRTLLanguage()
                             {
                                     HeaderActionBtn.frame = CGRect(x: HeaderViewShadowView.frame.size.width-205, y: HeaderDescLabel.frame.size.height+HeaderDescLabel.frame.origin.y+10, width: 200, height: 40)
                                         TimeLabel.frame = CGRect(x: 5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
                             }
                             else
                             {
                                      HeaderActionBtn.frame = CGRect(x: 5, y: HeaderDescLabel.frame.size.height+HeaderDescLabel.frame.origin.y+10, width: 200, height: 40)
                                       TimeLabel.frame = CGRect(x: HeaderActionBtn.frame.size.width+HeaderActionBtn.frame.origin.x+5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
                             }
                                                       
                            HeaderActionBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey: "cancelReservation"))!)", for: .normal)
                            HeaderActionBtn.setTitleColor(.white, for: .normal)
                            HeaderActionBtn.backgroundColor = Theme.SECONDARY_COLOR
                            HeaderActionBtn.titleLabel?.font = UIFont(name: APP_FONT_MEDIUM, size:15)
//                            TimeLabel.frame = CGRect(x: HeaderActionBtn.frame.size.width+HeaderActionBtn.frame.origin.x+5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
                            TimeLabel.font =  UIFont(name: APP_FONT_MEDIUM, size:14)
                            HeaderActionBtn.removeTarget(self, action: nil, for: .allEvents)
                            HeaderDeclineButton.removeTarget(self, action: nil, for: .allEvents)
                            HeaderActionBtn.addTarget(self, action: #selector(cancelReservationHost), for: .touchUpInside)
                            
                            
                            self.HeaderActionBtn.layer.borderWidth = 1.5
                            self.HeaderActionBtn.layer.borderColor = Theme.SECONDARY_COLOR.cgColor
                            self.HeaderActionBtn.layer.cornerRadius = self.HeaderActionBtn.frame.size.height/2
                            self.HeaderActionBtn.clipsToBounds = true
                            
                            CustomHeaderView.isHidden = false
                            isformViewUpdation = true
                            HeaderViewShadowView.isHidden = false
                            HeaderDescriptionTitle.isHidden = false
                            HeaderActionBtn.isHidden = false
                            TimeLabel.isHidden = true
                            HeaderDeclineButton.isHidden = true
                            HeaderDescLabel.isHidden = false
                            
                        }else{
                            
                            CustomHeaderView.frame = CGRect(x: 0, y: topView.frame.size.height+topView.frame.origin.y+5, width: FULLWIDTH, height: 160)
                            CustomHeaderView.backgroundColor = UIColor(named: "messageTopHeaderBG_Blue")
                            HeaderViewShadowView.frame = CGRect(x: 25, y: 2, width: CustomHeaderView.frame.size.width-50, height: CustomHeaderView.frame.size.height-4)
                            HeaderDescriptionTitle.frame = CGRect(x: 5, y: 6, width: HeaderViewShadowView.frame.size.width-10, height: 30)
                            
                            HeaderDescriptionTitle.text = "\((Utility.shared.getLanguage()?.value(forKey: "Book_conformed"))!)"
                             additionalTitle.isHidden = true
                            
                            // let BookingLabel = UILabel()
                            HeaderDescLabel.frame = CGRect(x: 5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+1, width: HeaderViewShadowView.frame.size.width-10, height: 60)
                            //HeaderDescLabel.backgroundColor = .blue
                            HeaderDescLabel.font = UIFont(name: APP_FONT, size:14)
                            HeaderDescLabel.text = "\((Utility.shared.getLanguage()?.value(forKey: "Booking_guestDesc"))!)"
                            // HeaderViewShadowView.addSubview(BookingLabel)
                            if Utility.shared.isRTLLanguage()
                            {
                                    HeaderActionBtn.frame = CGRect(x: HeaderViewShadowView.frame.size.width-205, y: HeaderDescLabel.frame.size.height+HeaderDescLabel.frame.origin.y+10, width: 200, height: 40)
                                        TimeLabel.frame = CGRect(x: 5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
                            }
                            else
                            {
                                     HeaderActionBtn.frame = CGRect(x: 5, y: HeaderDescLabel.frame.size.height+HeaderDescLabel.frame.origin.y+10, width: 200, height: 40)
                                      TimeLabel.frame = CGRect(x: HeaderActionBtn.frame.size.width+HeaderActionBtn.frame.origin.x+5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
                            }
                           
                            HeaderActionBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey: "cancelReservation"))!)", for: .normal)
                            HeaderActionBtn.setTitleColor(.white, for: .normal)
                            HeaderActionBtn.backgroundColor = Theme.SECONDARY_COLOR
                            HeaderActionBtn.titleLabel?.font = UIFont(name:APP_FONT_MEDIUM, size:15)
//                            TimeLabel.frame = CGRect(x: HeaderActionBtn.frame.size.width+HeaderActionBtn.frame.origin.x+5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
                            TimeLabel.font =  UIFont(name: APP_FONT_MEDIUM, size:14)
                            HeaderActionBtn.removeTarget(self, action: nil, for: .allEvents)
                            HeaderDeclineButton.removeTarget(self, action: nil, for: .allEvents)
                            HeaderActionBtn.addTarget(self, action: #selector(cancelReservationGuest), for: .touchUpInside)
                            
                            
                            self.HeaderActionBtn.layer.borderWidth = 1.5
                            self.HeaderActionBtn.layer.borderColor = Theme.SECONDARY_COLOR.cgColor
                            self.HeaderActionBtn.layer.cornerRadius = self.HeaderActionBtn.frame.size.height/2
                            self.HeaderActionBtn.clipsToBounds = true
                            
                            CustomHeaderView.isHidden = false
                            isformViewUpdation = true
                            HeaderViewShadowView.isHidden = false
                            HeaderDescriptionTitle.isHidden = false
                            HeaderActionBtn.isHidden = false
                            TimeLabel.isHidden = true
                            HeaderDeclineButton.isHidden = true
                            HeaderDescLabel.isHidden = false
                            
                        }
                        
                    }else if i.type == "completed"{

                        if(Utility.shared.host_message_isfromHost || Utility.shared.host_message_isfrommessage || Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification)
                        {
                            CustomHeaderView.frame = CGRect(x: 0, y: topView.frame.size.height+topView.frame.origin.y+5, width: FULLWIDTH, height: 80)
                            CustomHeaderView.backgroundColor = UIColor(named: "messageTopHeaderBG_Green")
                            HeaderViewShadowView.frame = CGRect(x: 25, y: 2, width: CustomHeaderView.frame.size.width-50, height: CustomHeaderView.frame.size.height-4)
                            HeaderDescriptionTitle.frame = CGRect(x: 5, y: 6, width: HeaderViewShadowView.frame.size.width-10, height: 30)
                            
                            HeaderDescriptionTitle.text = "\((Utility.shared.getLanguage()?.value(forKey: "trip_completed_head"))!)"
                             additionalTitle.isHidden = true
                            
                            // let BookingLabel = UILabel()
                            HeaderDescLabel.frame = CGRect(x: 5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+1, width: HeaderViewShadowView.frame.size.width-10, height: 40)
                            //HeaderDescLabel.backgroundColor = .blue
                            HeaderDescLabel.font = UIFont(name: APP_FONT, size:14)
                            HeaderDescLabel.text = "\((Utility.shared.getLanguage()?.value(forKey: "trip_completed_desc"))!)"
                            // HeaderViewShadowView.addSubview(BookingLabel)
                            if Utility.shared.isRTLLanguage()
                            {
                                    HeaderActionBtn.frame = CGRect(x: HeaderViewShadowView.frame.size.width-205, y: HeaderDescLabel.frame.size.height+HeaderDescLabel.frame.origin.y+10, width: 200, height: 40)
                                        TimeLabel.frame = CGRect(x: 5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
                            }
                            else
                            {
                                     HeaderActionBtn.frame = CGRect(x: 5, y: HeaderDescLabel.frame.size.height+HeaderDescLabel.frame.origin.y+10, width: 200, height: 40)
                                                                TimeLabel.frame = CGRect(x: HeaderActionBtn.frame.size.width+HeaderActionBtn.frame.origin.x+5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
                            }
                           
                            TimeLabel.font =  UIFont(name:APP_FONT_MEDIUM, size:14)
                            HeaderActionBtn.removeTarget(self, action: nil, for: .allEvents)
                            HeaderDeclineButton.removeTarget(self, action: nil, for: .allEvents)
                            CustomHeaderView.isHidden = false
                            isformViewUpdation = true
                            HeaderViewShadowView.isHidden = false
                            HeaderDescriptionTitle.isHidden = false
                            HeaderActionBtn.isHidden = true
                            TimeLabel.isHidden = true
                            HeaderDeclineButton.isHidden = true
                            HeaderDescLabel.isHidden = false
                            
                            
                        }else{
                            
                            CustomHeaderView.frame = CGRect(x: 0, y: topView.frame.size.height+topView.frame.origin.y+5, width: FULLWIDTH, height: 75)
                            CustomHeaderView.backgroundColor = UIColor(named: "messageTopHeaderBG_Green")
                            HeaderViewShadowView.frame = CGRect(x: 25, y: 2, width: CustomHeaderView.frame.size.width-50, height: CustomHeaderView.frame.size.height-4)
                            HeaderDescriptionTitle.frame = CGRect(x: 5, y: 6, width: HeaderViewShadowView.frame.size.width-10, height: 30)
                            
                            HeaderDescriptionTitle.text = "\((Utility.shared.getLanguage()?.value(forKey: "trip_completed_head"))!)"
                             additionalTitle.isHidden = true
                            
                            // let BookingLabel = UILabel()
                            HeaderDescLabel.frame = CGRect(x: 5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+1, width: HeaderViewShadowView.frame.size.width-10, height: 40)
                            //HeaderDescLabel.backgroundColor = .blue
                            HeaderDescLabel.font = UIFont(name: APP_FONT, size:14)
                            HeaderDescLabel.text = "\((Utility.shared.getLanguage()?.value(forKey: "trip_completed_desc"))!)"
                            // HeaderViewShadowView.addSubview(BookingLabel)
                            if Utility.shared.isRTLLanguage()
                            {
                                    HeaderActionBtn.frame = CGRect(x: HeaderViewShadowView.frame.size.width-205, y: HeaderDescLabel.frame.size.height+HeaderDescLabel.frame.origin.y+10, width: 200, height: 30)
                                        TimeLabel.frame = CGRect(x: 5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
                            }
                            else
                            {
                                     HeaderActionBtn.frame = CGRect(x: 5, y: HeaderDescLabel.frame.size.height+HeaderDescLabel.frame.origin.y+10, width: 200, height: 40)
                                                               TimeLabel.frame = CGRect(x: HeaderActionBtn.frame.size.width+HeaderActionBtn.frame.origin.x+5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
                            }
                           
                            TimeLabel.font =  UIFont(name: APP_FONT_MEDIUM, size:14)
                            HeaderActionBtn.removeTarget(self, action: nil, for: .allEvents)
                            HeaderDeclineButton.removeTarget(self, action: nil, for: .allEvents)
                            CustomHeaderView.isHidden = false
                            isformViewUpdation = true
                            HeaderViewShadowView.isHidden = false
                            HeaderDescriptionTitle.isHidden = false
                            HeaderActionBtn.isHidden = true
                            TimeLabel.isHidden = true
                            HeaderDeclineButton.isHidden = true
                            HeaderDescLabel.isHidden = false
                        }
                    } else if i.type == "expired"{

                        if(Utility.shared.host_message_isfromHost || Utility.shared.host_message_isfrommessage || Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification)
                        {
                            CustomHeaderView.frame = CGRect(x: 0, y: topView.frame.size.height+topView.frame.origin.y+5, width: FULLWIDTH, height: 100)
                            CustomHeaderView.backgroundColor = UIColor(named: "messageTopHeaderBG_Blue")
                            HeaderViewShadowView.frame = CGRect(x: 25, y: 2, width: CustomHeaderView.frame.size.width-50, height: CustomHeaderView.frame.size.height-4)
                            HeaderDescriptionTitle.frame = CGRect(x: 5, y: 6, width: HeaderViewShadowView.frame.size.width-10, height: 30)

                            HeaderDescriptionTitle.text = "\(Utility.shared.getLanguage()?.value(forKey: "trip_expired_head") ?? "Booking is expired")"

                            // let BookingLabel = UILabel()
                            HeaderDescLabel.frame = CGRect(x: 5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+1, width: HeaderViewShadowView.frame.size.width-10, height: 60)
                            //HeaderDescLabel.backgroundColor = .blue
                            HeaderDescLabel.font = UIFont(name:"Volte-Regular", size:15)
                            HeaderDescLabel.text = "\(Utility.shared.getLanguage()?.value(forKey: "trip_expired_desc") ?? "Your booking is expired.")"
                            // HeaderViewShadowView.addSubview(BookingLabel)
                            HeaderActionBtn.frame = CGRect(x: 5, y: HeaderDescLabel.frame.size.height+HeaderDescLabel.frame.origin.y+10, width: 200, height: 40)
                            TimeLabel.frame = CGRect(x: HeaderActionBtn.frame.size.width+HeaderActionBtn.frame.origin.x+5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
                            TimeLabel.font =  UIFont(name:"Volte-Medium", size:15)
                            HeaderActionBtn.removeTarget(self, action: nil, for: .allEvents)
                            HeaderDeclineButton.removeTarget(self, action: nil, for: .allEvents)
                            CustomHeaderView.isHidden = false
                            isformViewUpdation = true
                            HeaderViewShadowView.isHidden = false
                            HeaderDescriptionTitle.isHidden = false
                            HeaderActionBtn.isHidden = true
                            TimeLabel.isHidden = true
                            HeaderDeclineButton.isHidden = true
                            HeaderDescLabel.isHidden = false
                        }else{
                            CustomHeaderView.frame = CGRect(x: 0, y: topView.frame.size.height+topView.frame.origin.y+5, width: FULLWIDTH, height: 100)
                            CustomHeaderView.backgroundColor = UIColor(named: "messageTopHeaderBG_Blue")
                            HeaderViewShadowView.frame = CGRect(x: 25, y: 2, width: CustomHeaderView.frame.size.width-50, height: CustomHeaderView.frame.size.height-4)
                            HeaderDescriptionTitle.frame = CGRect(x: 5, y: 6, width: HeaderViewShadowView.frame.size.width-10, height: 30)

                            HeaderDescriptionTitle.text = "\(Utility.shared.getLanguage()?.value(forKey: "trip_expired_head") ?? "Booking is expired")"

                            // let BookingLabel = UILabel()
                            HeaderDescLabel.frame = CGRect(x: 5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+1, width: HeaderViewShadowView.frame.size.width-10, height: 60)
                            //HeaderDescLabel.backgroundColor = .blue
                            HeaderDescLabel.font = UIFont(name:"Volte-Regular", size:15)
                            HeaderDescLabel.text = "\(Utility.shared.getLanguage()?.value(forKey: "trip_expired_desc") ?? "Your booking is expired.")"
                            // HeaderViewShadowView.addSubview(BookingLabel)
                            HeaderActionBtn.frame = CGRect(x: 5, y: HeaderDescLabel.frame.size.height+HeaderDescLabel.frame.origin.y+10, width: 200, height: 40)
                            TimeLabel.frame = CGRect(x: HeaderActionBtn.frame.size.width+HeaderActionBtn.frame.origin.x+5, y: HeaderDescriptionTitle.frame.size.height+HeaderDescriptionTitle.frame.origin.y+5, width: HeaderDescriptionTitle.frame.size.width-85, height: 40)
                            TimeLabel.font =  UIFont(name:"Volte-Medium", size:15)
                            HeaderActionBtn.removeTarget(self, action: nil, for: .allEvents)
                            HeaderDeclineButton.removeTarget(self, action: nil, for: .allEvents)
                            CustomHeaderView.isHidden = false
                            isformViewUpdation = true
                            HeaderViewShadowView.isHidden = false
                            HeaderDescriptionTitle.isHidden = false
                            HeaderActionBtn.isHidden = true
                            TimeLabel.isHidden = true
                            HeaderDeclineButton.isHidden = true
                            HeaderDescLabel.isHidden = false

                        }
                    }
                    
            //    }
                if CustomHeaderView.isHidden {
                    self.inboxlistingTable.frame.origin.y = 100
                    self.inboxlistingTable.frame.size.height = (self.bottomview.frame.origin.y - self.topView.frame.size.height-10)-5
                }else{
                    

                    self.inboxlistingTable.frame.origin.y = (CustomHeaderView.frame.height + CustomHeaderView.frame.origin.y)+5
                    self.inboxlistingTable.frame.size.height = ((self.bottomview.frame.origin.y-self.topView.frame.size.height-10) - CustomHeaderView.frame.size.height)-5
                }
                
            }else{
                self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey: "somethingwrong"))!)")
            }
            

        }else{
            DispatchQueue.main.async {
                self.view.bringSubviewToFront(self.offlineView)
                self.offlineView.isHidden = false
                //self.offlineView.backgroundColor = .black
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
                if IS_IPHONE_XR{
                    self.offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-85, width: FULLWIDTH, height: 55)
                }else{
                    self.offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-55, width: FULLWIDTH, height: 55)
                }
            }
            
        }
        
    }
    
    
  @objc  func CountDownDate(){
    
    let currentDate = Date()
    let calendar = Calendar.current
    print(currentDate)
    let newDate = calendar.date(byAdding: .day, value: 2, to: releaseDate! as Date)
    print(newDate)
    let diffDateComponents = calendar.dateComponents([.day, .hour, .minute, .second], from: releaseDate! as Date, to:currentDate)
    let countdown = "Days \(diffDateComponents.day ?? 0), Hours \(diffDateComponents.hour ?? 0), Minutes \(diffDateComponents.minute ?? 0), Seconds \(diffDateComponents.second ?? 0)"
    let count = "\(diffDateComponents.hour ?? 0):\(diffDateComponents.minute ?? 0):\(diffDateComponents.second ?? 0)"
    let editedText = count.replacingOccurrences(of: "-", with: "")
   // Label.text = editedText
    if(Utility.shared.host_message_isfromHost || Utility.shared.host_message_isfrommessage || Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification)
    {
         TimeLabel.textColor = UIColor(named: "searchPlaces_TextColor")
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string:"\((Utility.shared.getLanguage()?.value(forKey: "respondTime"))!) \(editedText) \((Utility.shared.getLanguage()?.value(forKey: "maintain"))!)")
       
       
        attributedString.setColor(color: Theme.SECONDARY_COLOR, forText:"\(editedText)")   // or use direct value for text "red"
        attributedString.setColor(color: UIColor(named: "searchPlaces_TextColor")!, forText:"\((Utility.shared.getLanguage()?.value(forKey: "respondTime"))!)")
        attributedString.setColor(color: UIColor(named: "searchPlaces_TextColor")!, forText: "\((Utility.shared.getLanguage()?.value(forKey: "maintain"))!)")
        // or use direct value f
        
        TimeLabel.attributedText = attributedString

        TimeLabel.numberOfLines = 2
        // TimeLabel.text = "\((Utility.shared.getLanguage()?.value(forKey: "respondTime"))!) \(editedText)"
    }else{
        TimeLabel.textColor = UIColor(named: "searchPlaces_TextColor")
        
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string:"\((Utility.shared.getLanguage()?.value(forKey: "WithinTime"))!) \(editedText) \((Utility.shared.getLanguage()?.value(forKey: "itwillexpire"))!)")
        attributedString.setColor(color: Theme.SECONDARY_COLOR, forText:"\(editedText)")   // or use direct value for text "red"
        attributedString.setColor(color: UIColor(named: "searchPlaces_TextColor")!, forText:"\((Utility.shared.getLanguage()?.value(forKey: "WithinTime"))!)")
        attributedString.setColor(color:UIColor(named: "searchPlaces_TextColor")!, forText: "\((Utility.shared.getLanguage()?.value(forKey: "itwillexpire"))!)")
        // or use direct value f
        TimeLabel.attributedText = attributedString
        TimeLabel.numberOfLines = 2
         //TimeLabel.text = "\((Utility.shared.getLanguage()?.value(forKey: "WithinTime"))!) \(editedText)"
    }
    
   
   // print(countdown)

    }

    func profileAPICall()
    {
        
        if(Utility.shared.getCurrentUserToken() != nil)
        {
            let profileQuery = GetProfileQuery()
            apollo_headerClient = {
                let cache = InMemoryNormalizedCache()
                let store1 = ApolloStore(cache: cache)
                let configuration = URLSessionConfiguration.default
                // Add additional headers as needed
                configuration.httpAdditionalHeaders = ["auth": "\(Utility.shared.getCurrentUserToken()!)"] // Replace `<token>`
                let url = URL(string:graphQLEndpoint)!
                let client1 = URLSessionClient(sessionConfiguration: configuration, callbackQueue: nil)
                let provider = DefaultInterceptorProvider(client: client1, shouldInvalidateClientOnDeinit: true, store: store1)
                let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                                         endpointURL: url)
                return ApolloClient(networkTransport: requestChainTransport,
                                    store: store1)
            }()
            apollo_headerClient.fetch(query:profileQuery,cachePolicy:.fetchIgnoringCacheData){(result,error) in
                
                guard (result?.data?.userAccount?.result) != nil else
                {
                    if result?.data?.userAccount?.status == 500{
                        let alert = UIAlertController(title: "\(Utility.shared.getLanguage()?.value(forKey: "oops") ?? "oops" )", message: result?.data?.userAccount?.errorMessage, preferredStyle: .alert)
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
                    }else{
                    print("Missing Data")
                    self.lottieView.isHidden = true
                        self.inboxlistingTable.hideSkeleton()
                        self.inboxlistingTable.isSkeletonable = false
                    self.HeaderActionBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey: "book"))!)", for: .normal)
                    return
                    }
                }
                self.lottieView.isHidden = true
                self.inboxlistingTable.hideSkeleton()
                self.inboxlistingTable.isSkeletonable = false
                self.HeaderActionBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey: "book"))!)", for: .normal)
                if (result?.data?.userAccount?.result?.picture) == nil {
                    Utility.shared.isprofilepictureVerified = true
                }else{
                    
                    Utility.shared.isprofilepictureVerified = false
                }
                
                Utility.shared.ProfileAPIArray = ((result?.data?.userAccount?.result)!)
                if(Utility.shared.ProfileAPIArray.verification?.isEmailConfirmed == true)
                {
                    
                    self.navigationAPICall()
                }
                else{
                        self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"emailverifyalert"))!)")
                }
                

                
                
                
            }
        }
    }
    
    func offlineView_func(){
        self.inboxlistingTable.isSkeletonable = true
        self.inboxlistingTable.showAnimatedGradientSkeleton()
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
    if IS_IPHONE_XR{
    self.offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-85, width: FULLWIDTH, height: 55)
    }else{
    self.offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-55, width: FULLWIDTH, height: 55)
    }
        
    }
    @objc func requesttoBookTapped(){
        if Utility.shared.isConnectedToNetwork(){
            Utility.shared.booking_message = ""
          //  self.offlineView.isHidden = true
            self.unreadView.isHidden = true
             self.isnewMessage = false
            self.countdownTimer.invalidate()
            
            let viewListing = UpdatedViewListing()
            viewListing.listID = Int(Utility.shared.ListID) ?? 0
            Utility.shared.unpublish_preview_check = false
            viewListing.modalPresentationStyle = .fullScreen
            self.present(viewListing, animated: true, completion: nil)
        }else{
           
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey: "error_field"))!)")
            
//                DispatchQueue.main.async {
//                    // enter code here
//                    self.offlineView_func()
//                }
//
//
//
//          //  Thread.current.isMainThread
//            print(Thread.current.isMainThread)
//            self.view.layoutIfNeeded()
//            self.view.bringSubviewToFront(self.offlineView)
            
            //            DispatchQueue.main.async(execute: { () -> Void in
            //
            //
            //            })
            //            DispatchQueue.main.async {
            //                }
        }
        


    }
    
    func navigationAPICall()
    {
      //  self.offlineView.isHidden = true
        
        var recentString = String()
        var endString = String()
        var PersonCap = Int()
        var reservartion = Int()
        
        self.unreadView.isHidden = true
         self.isnewMessage = false
        if(getmessageListquery.count > 0)
        {
            let array = getmessageListquery
            print("reverse Action \(array)")
            
            
            
            array.reversed().forEach { print($0) } // e,d,c,b,a
            
            print(Array(array.reversed()))
            let reversedArray = Array(array.reversed())
            
            print("reverse action preapproved \(reversedArray)")
            for i in reversedArray {
                if i.type == "inquiry"{
                    if(Utility.shared.host_message_isfromHost || Utility.shared.host_message_isfrommessage || Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification)
                    {
                        
                    }else{
                        
                    }
                }else if i.type == "preApproved"{
                    if(Utility.shared.host_message_isfromHost || Utility.shared.host_message_isfrommessage || Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification)
                    {
                        
                    }else{
                        if i.startDate != nil && i.endDate != nil{
                            
                            recentString = i.startDate!
                            endString = i.endDate!
                            PersonCap = i.personCapacity ?? 1
                            reservartion = i.reservationId ?? 0
                        }else{
                            
                        }
                        

                    }
                    
                }
                
            }
        }
        
        
        
        if(Utility.shared.host_message_isfromHost || Utility.shared.host_message_isfrommessage || Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification)
        {
            
        }else{
            
            print(recentString)
            let sDate = recentString  //getmessageListquery.first?.startDate
            let edate =  endString //getmessageListquery.first?.endDate
            
            let timeStampValueStart = Int(sDate) != nil  ? Int(sDate)!/1000 : 0
            let startingDate = Date(timeIntervalSince1970: TimeInterval(timeStampValueStart))
            let timeStampValueEnd = Int(edate) != nil  ? Int(edate)!/1000 : 0
            let EndingDate = Date(timeIntervalSince1970: TimeInterval(timeStampValueEnd))
            let dateFormaatter = DateFormatter()
            dateFormaatter.timeZone = TimeZone(abbreviation: "UTC")
            dateFormaatter.dateFormat = "yyyy-MM-dd"
            var datefetchedStart = String()
            var datefetchedEnd = String()
            
            datefetchedStart = dateFormaatter.string(from: startingDate)
            datefetchedEnd  = dateFormaatter.string(from: EndingDate)
            
            var currency = String()
            if(Utility.shared.getPreferredCurrency() != nil && Utility.shared.getPreferredCurrency() != "")
            {
                currency = Utility.shared.getPreferredCurrency()!
            }
            else
            {
                currency = Utility.shared.currencyvalue_from_API_base
            }
            
            let billingListquery = GetBillingCalculationQuery(listId:Int(Utility.shared.ListID)!, startDate:dateFormaatter.string(from: startingDate), endDate:dateFormaatter.string(from: EndingDate), guests: PersonCap, convertCurrency:currency)
            apollo_headerClient.fetch(query: billingListquery){(result,error) in
                guard (result?.data?.getBillingCalculation?.result) != nil else{
                    
                    
                   
                    
                    self.view.makeToast(result?.data?.getBillingCalculation?.errorMessage!)
                    return
                }
                self.getbillingArray = (result?.data?.getBillingCalculation?.result)!
                Utility.shared.guestCountToBeSend = self.getbillingArray.guests ?? Utility.shared.guestCountToBeSend
                let dateFormaatter1 = DateFormatter()
                dateFormaatter1.timeZone = TimeZone(abbreviation: "UTC")
                dateFormaatter1.dateFormat = "MMM dd"
                var datefetchedStart1 = String()
                var datefetchedEnd1 = String()
                datefetchedStart1 = dateFormaatter1.string(from: startingDate)
                datefetchedEnd1  = dateFormaatter1.string(from: EndingDate)
                
//                let bookingStep = BookingstepOneVC()
//                bookingStep.houserulesArray = self.viewListingArray.houseRules as! [ViewListingDetailsQuery.Data.ViewListing.Result.HouseRule]
//                bookingStep.viewListingArray = self.viewListingArray
//                Utility.shared.passbillingArray = self.getbillingArray
//                Utility.shared.bookingListimage = self.viewListingArray.listPhotoName != nil ? self.viewListingArray.listPhotoName! : ""
//                Utility.shared.bookingListname = self.viewListingArray.title != nil ? self.viewListingArray.title! : ""
//                bookingStep.addDateinLabel = datefetchedStart1
//                bookingStep.addDateoutLabel = datefetchedEnd1
//                Utility.shared.PreApprovedID = true
//                //                self.requestTable.reloadData()
//
//                Utility.shared.bookingdateLabel = "\(datefetchedStart1) - \(datefetchedEnd1), \(PersonCap) \((Utility.shared.getLanguage()?.value(forKey:"guest"))!)"
//                Utility.shared.numberofnights_Selected = self.getbillingArray.nights != nil ? self.getbillingArray.nights! : 0
//                var currencysymbol = String()
//                if(Utility.shared.getPreferredCurrency() != nil && Utility.shared.getPreferredCurrency() != "")
//                         {
//                             currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!)!
//                         }
//                         else
//                         {
//                            currencysymbol = Utility.shared.getSymbol(forCurrencyCode:Utility.shared.currencyvalue_from_API_base)!
//                         }
//                bookingStep.totalPriceLabel = "\(currencysymbol)\(self.getbillingArray.total != nil ? ((self.getbillingArray.total)!) : 0.0)"
//                bookingStep.modalPresentationStyle = .fullScreen
//                self.present(bookingStep, animated: true, completion: nil)
//
                
                
                
                let bookobj = RequestbookVC()
                Utility.shared.booking_message = ""
               
                    bookobj.viewListingArray = self.viewListingArray
                bookobj.isFromMessage = true
                bookobj.currency_Dict = Utility.shared.currency_Dict
                bookobj.selectedStartDate = startingDate
                bookobj.selectedEndDate = EndingDate
                bookobj.currencyvalue_from_API_base = Utility.shared.currencyvalue_from_API_base ?? ""
                if(bookobj.getbillingArray.checkIn == nil)
                {
                   
                        bookobj.getbillingArray = self.getbillingArray
                    
                }
                
                Utility.shared.passbillingArray = self.getbillingArray
                Utility.shared.bookingListimage = self.viewListingArray.listPhotoName != nil ? self.viewListingArray.listPhotoName! : ""
                Utility.shared.bookingListname = self.viewListingArray.title != nil ? self.viewListingArray.title! : ""
                Utility.shared.PreApprovedID = true
                //                self.requestTable.reloadData()
                
                Utility.shared.bookingdateLabel = "\(datefetchedStart1) - \(datefetchedEnd1), \(PersonCap) \((Utility.shared.getLanguage()?.value(forKey:"guest"))!)"
                Utility.shared.numberofnights_Selected = self.getbillingArray.nights != nil ? self.getbillingArray.nights! : 0
                var currencysymbol = String()
                if(Utility.shared.getPreferredCurrency() != nil && Utility.shared.getPreferredCurrency() != "")
                         {
                             currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!)!
                         }
                         else
                         {
                            currencysymbol = Utility.shared.getSymbol(forCurrencyCode:Utility.shared.currencyvalue_from_API_base)!
                         }
                bookobj.delegate = self
                bookobj.modalPresentationStyle = .fullScreen
                self.present(bookobj, animated: true, completion: nil)
                
            }
            
        }
    }
    func lottieViewanimation()
    {
        HeaderActionBtn.setTitle("", for:.normal)
        lottieView = LottieAnimationView.init(name: "animation_white")
        
        self.lottieView.isHidden = true
        self.lottieView.frame = CGRect(x:HeaderActionBtn.frame.size.width/2-60, y:-25, width:100, height:100)
        self.HeaderActionBtn.addSubview(self.lottieView)
        self.lottieView.backgroundColor = UIColor.clear
        self.lottieView.play()
        
    }
    
    @objc func NavigatetoBooking(){
        
        if Utility.shared.isConnectedToNetwork() {
            Utility.shared.booking_message = ""
             self.lottieViewanimation()
           self.profileAPICall()
            self.unreadView.isHidden = true
             self.isnewMessage = false
        }else{
//            self.offlineView_func()
//
//
//            self.view.layoutIfNeeded()
//            self.view.bringSubviewToFront(self.offlineView)
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey: "error_field"))!)")

        }
//        self.view.sendSubviewToBack(bottomview)
//        self.view.bringSubviewToFront(offlineView)
        
    }
    
    @objc func decline_btn_tapped(){
        
        if Utility.shared.isConnectedToNetwork() {
         //   self.offlineView.isHidden = true
            self.HeaderActionBtn.isUserInteractionEnabled = false
            self.HeaderDeclineButton.isUserInteractionEnabled = false
            self.readMessage()
            PageIndex = 0
            self.isnewMessage = true
           
            var recentString = String()
            var endString = String()
            var PersonCap = Int()
            var reservartion = Int()
            
            if(getmessageListquery.count > 0)
            {
                let array = getmessageListquery
                print("reverse Action \(array)")
                
                for element in array.reversed() {
                    print(element) // e,d,c,b,a
                }
                
                array.reversed().forEach { print($0) } // e,d,c,b,a
                
                print(Array(array.reversed()))
                let reversedArray = Array(array.reversed())
                
                print("reverse action preapproved \(reversedArray)")
                for i in reversedArray {
                    if i.type == "requestToBook"{
                        if(Utility.shared.host_message_isfromHost || Utility.shared.host_message_isfrommessage || Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification)
                        {
                            recentString = i.startDate!
                            endString = i.endDate!
                            PersonCap = i.personCapacity ?? 1
                            reservartion = i.reservationId ?? 0
                        }else if i.type == "preApproved"{
                            if(Utility.shared.host_message_isfromHost || Utility.shared.host_message_isfrommessage || Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification)
                            {
                                
                            }else{
                            }
                        }
                    }
                    
                }
            }
            
            print(recentString)
            if(Utility.shared.host_message_isfromHost || Utility.shared.host_message_isfrommessage || Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification)
            {
                if(getmessageListquery.count > 0)
                {
                    
                    let timestamp = Date().currentTimeMillis()
                    print(recentString)
                    
                    let sDate = recentString  //getmessageListquery.first?.startDate
                    let edate =  endString //getmessageListquery.first?.endDate
                    
                    
                    let array =   GetThreadsQuery.Data.GetThread.Result.ThreadItem.init(id:self.sendMessageArray.id, threadId:self.threadId, reservationId:reservartion, content:"", sentBy:Utility.shared.getCurrentUserID()! as String, type:"declined", startDate: sDate, endDate:edate, createdAt:"\(timestamp)")
                    
                    
                    //     print( getmessageListquery.first?.startDate)
                    
                    let timeStampValueStart = Int(sDate) != nil  ? Int(sDate)!/1000 : 0
                    let startingDate = Date(timeIntervalSince1970: TimeInterval(timeStampValueStart))
                    let timeStampValueEnd = Int(edate) != nil  ? Int(edate)!/1000 : 0
                    let EndingDate = Date(timeIntervalSince1970: TimeInterval(timeStampValueEnd))
                    let dateFormaatter = DateFormatter()
                    dateFormaatter.timeZone = TimeZone(abbreviation: "UTC")
                    dateFormaatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                    var datefetchedStart = String()
                    var datefetchedEnd = String()
                    
                    datefetchedStart = dateFormaatter.string(from: startingDate)
                    datefetchedEnd  = dateFormaatter.string(from: EndingDate)
                    
                    print(datefetchedStart)
                    print(datefetchedEnd)
                    
                    let reservationMutation = ReservationStatusMutation(threadId: threadId, content: "", type: "declined", startDate: datefetchedStart, endDate: datefetchedEnd, personCapacity: PersonCap, reservationId: reservartion, actionType: "declined")
                    apollo_headerClient.perform(mutation: reservationMutation){ (result, error) in
                        if result?.data?.reservationStatus?.status == 200{
                            print("success")
                            self.HeaderActionBtn.isUserInteractionEnabled = true
                            self.HeaderDeclineButton.isUserInteractionEnabled = true
                            self.getmessageListquery.insert(array, at: 0)
                            self.getMessageListAPICall(threadId: self.threadId)
                            self.inboxlistingTable.reloadData()
                            self.ViewUpdation()
                            self.countdownTimer.invalidate()
                        }else{
                            self.HeaderActionBtn.isUserInteractionEnabled = true
                            self.HeaderDeclineButton.isUserInteractionEnabled = true
                        }
                    }
                }
                
            }else{
            }
            
            
        }else{
            
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey: "error_field"))!)")
//            self.offlineView_func()
//
//
//            self.view.layoutIfNeeded()
//            self.view.bringSubviewToFront(self.offlineView)

        }
        
        
    }
    
    @objc func Approve_btn_tapped(){
        if Utility.shared.isConnectedToNetwork() {
        //    self.offlineView.isHidden = true
            self.HeaderActionBtn.isUserInteractionEnabled = false
            self.readMessage()
            PageIndex = 0
            self.isnewMessage = true
          
            var recentString = String()
            var endString = String()
            var PersonCap = Int()
            var reservartion = Int()
            
            if(getmessageListquery.count > 0)
            {
                let array = getmessageListquery
                print("reverse Action \(array)")
                
                for element in array.reversed() {
                    print(element) // e,d,c,b,a
                }
                
                array.reversed().forEach { print($0) } // e,d,c,b,a
                
                print(Array(array.reversed()))
                let reversedArray = Array(array.reversed())
                
                print("reverse action preapproved \(reversedArray)")
                for i in reversedArray {
                    if i.type == "requestToBook"{
                        if(Utility.shared.host_message_isfromHost || Utility.shared.host_message_isfrommessage || Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification)
                        {
                            recentString = i.startDate!
                            endString = i.endDate!
                            PersonCap = i.personCapacity ?? 1
                            reservartion = i.reservationId ?? 0
                        }else if i.type == "preApproved"{
                            if(Utility.shared.host_message_isfromHost || Utility.shared.host_message_isfrommessage || Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification)
                            {
                                
                            }else{
                            }
                        }
                    }
                    
                }
            }
            
            print(recentString)
            if(Utility.shared.host_message_isfromHost || Utility.shared.host_message_isfrommessage || Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification)
            {
                if(getmessageListquery.count > 0)
                {
                    
                    let timestamp = Date().currentTimeMillis()
                    print(recentString)
                    
                    let sDate = recentString  //getmessageListquery.first?.startDate
                    let edate =  endString //getmessageListquery.first?.endDate
                    
                    
                    let array =   GetThreadsQuery.Data.GetThread.Result.ThreadItem.init(id:self.sendMessageArray.id, threadId:self.threadId, reservationId:reservartion, content:"", sentBy:Utility.shared.getCurrentUserID()! as String, type:"approved", startDate: sDate, endDate:edate, createdAt:"\(timestamp)")
                    
                    
                    //     print( getmessageListquery.first?.startDate)
                    
                    let timeStampValueStart = Int(sDate) != nil  ? Int(sDate)!/1000 : 0
                    let startingDate = Date(timeIntervalSince1970: TimeInterval(timeStampValueStart))
                    let timeStampValueEnd = Int(edate) != nil  ? Int(edate)!/1000 : 0
                    let EndingDate = Date(timeIntervalSince1970: TimeInterval(timeStampValueEnd))
                    let dateFormaatter = DateFormatter()
                    dateFormaatter.timeZone = TimeZone(abbreviation: "UTC")
                    dateFormaatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                    var datefetchedStart = String()
                    var datefetchedEnd = String()
                    
                    datefetchedStart = dateFormaatter.string(from: startingDate)
                    datefetchedEnd  = dateFormaatter.string(from: EndingDate)
                    
                    print(datefetchedStart)
                    print(datefetchedEnd)
                    
                    let reservationMutation = ReservationStatusMutation(threadId: threadId, content: "", type: "approved", startDate: datefetchedStart, endDate: datefetchedEnd, personCapacity: PersonCap, reservationId: reservartion, actionType: "approved")
                    apollo_headerClient.perform(mutation: reservationMutation){ (result, error) in
                        if result?.data?.reservationStatus?.status == 200{
                            print("success")
                            self.getMessageListAPICall(threadId: self.threadId)
                            self.HeaderActionBtn.isUserInteractionEnabled = true
                            self.getmessageListquery.insert(array, at: 0)
                            self.inboxlistingTable.reloadData()
                            self.ViewUpdation()
                            self.countdownTimer.invalidate()
                        }else{
                            self.HeaderActionBtn.isUserInteractionEnabled = true
                        }
                    }
                }
                
            }else{
            }
            
            
        }else{
            
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey: "error_field"))!)")
//            self.offlineView_func()
//
//
//            self.view.layoutIfNeeded()
//            self.view.bringSubviewToFront(self.offlineView)

        }
        
        
        
    }
    
    @objc func PreApproveTapped(){
        
        if Utility.shared.isConnectedToNetwork() {
        //    self.offlineView.isHidden = true
//             self.isnewMessage = true
//           self.getMessageListAPICall(threadId: threadId)
//            self.getUnreadCountMessage()
//            self.readMessage()
            self.HeaderActionBtn.isUserInteractionEnabled = false
            self.lottieAnimation()
            self.readMessage()
            PageIndex = 0
            self.isnewMessage = true
          
            
          
            self.unreadView.isHidden = true
            var recentString = String()
            var endString = String()
            var PersonCap = Int()
            var reservartion = Int()
            
            if(getmessageListquery.count > 0)
            {
                let array = getmessageListquery
                print("reverse Action \(array)")
                
                for element in array.reversed() {
                    print(element) // e,d,c,b,a
                }
                
                array.reversed().forEach { print($0) } // e,d,c,b,a
                
                print(Array(array.reversed()))
                let reversedArray = Array(array.reversed())
                
                print("reverse action preapproved \(reversedArray)")
                for i in reversedArray {
                    if i.type == "inquiry"{
                        if(Utility.shared.host_message_isfromHost || Utility.shared.host_message_isfrommessage || Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification)
                        {
                            recentString = i.startDate!
                            endString = i.endDate!
                            PersonCap = i.personCapacity ?? 1
                            reservartion = i.reservationId ?? 0
                        }else if i.type == "preApproved"{
                            if(Utility.shared.host_message_isfromHost || Utility.shared.host_message_isfrommessage || Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification)
                            {
                                
                            }else{
                            }
                        }
                    }
                    
                }
            }
            
            print(recentString)
            if(Utility.shared.host_message_isfromHost || Utility.shared.host_message_isfrommessage || Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification)
            {
                if(getmessageListquery.count > 0)
                {
                    
                    let timestamp = Date().currentTimeMillis()
                    print(recentString)
                    
                    let sDate = recentString  //getmessageListquery.first?.startDate
                    let edate =  endString //getmessageListquery.first?.endDate
                    
                    
                    let array =   GetThreadsQuery.Data.GetThread.Result.ThreadItem.init(id:self.sendMessageArray.id, threadId:self.threadId, reservationId:reservartion, content:"", sentBy:Utility.shared.getCurrentUserID()! as String, type:"preApproved", startDate: sDate, endDate:edate, createdAt:"\(timestamp)")
                    
                    
                    //     print( getmessageListquery.first?.startDate)
                    
                    let timeStampValueStart = Int(sDate) != nil  ? Int(sDate)!/1000 : 0
                    let startingDate = Date(timeIntervalSince1970: TimeInterval(timeStampValueStart))
                    let timeStampValueEnd = Int(edate) != nil  ? Int(edate)!/1000 : 0
                    let EndingDate = Date(timeIntervalSince1970: TimeInterval(timeStampValueEnd))
                    let dateFormaatter = DateFormatter()
                    dateFormaatter.timeZone = TimeZone(abbreviation: "UTC")
                    dateFormaatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                    var datefetchedStart = String()
                    var datefetchedEnd = String()
                    
                    datefetchedStart = dateFormaatter.string(from: startingDate)
                    datefetchedEnd  = dateFormaatter.string(from: EndingDate)
                    
                    print(datefetchedStart)
                    
                    let preapproveMutation = PreapproveMutation(threadId: threadId, content: "", type: "preApproved", startDate: datefetchedStart, endDate: datefetchedEnd, personCapacity: PersonCap, reservationId: reservartion)
                    apollo_headerClient.perform(mutation: preapproveMutation){(result,error) in
                        
                        self.lottieView.isHidden = true
                        self.inboxlistingTable.hideSkeleton()
                        self.inboxlistingTable.isSkeletonable = false
                        if result?.data?.sendMessage?.status == 200{
                            print("Success")
                           self.HeaderActionBtn.isUserInteractionEnabled = true
                            self.HeaderActionBtn.isMultipleTouchEnabled = false
                            self.getMessageListAPICall(threadId: self.threadId)
                            self.getmessageListquery.insert(array, at:0)
                            self.inboxlistingTable.reloadData()
                            self.ViewUpdation()
                            self.countdownTimer.invalidate()
                            
                        }else{
                            self.HeaderActionBtn.isUserInteractionEnabled = true
                            self.HeaderActionBtn.isMultipleTouchEnabled = false
                        }
                    }
                }
                
            }else{
                //
                
                //
                //
                //
                //            self.HeaderActionBtn.isUserInteractionEnabled = true
                //            let approveAvtion = BookingstepOneVC()
                //           // approveAvtion.houserulesArray = viewListingArray.houseRules! as! [ViewListingDetailsQuery.Data.ViewListing.Result.HouseRule]
                //            self.present(approveAvtion, animated: false, completion: nil)
                //
            }
            

        }else{
            
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey: "error_field"))!)")
//            self.offlineView_func()
//
//
//            self.view.layoutIfNeeded()
//            self.view.bringSubviewToFront(self.offlineView)
        }
        
        
    }
    
    @objc func cancelReservationHost(){
        
        if Utility.shared.isConnectedToNetwork() {
            
       //     self.offlineView.isHidden = true
            // self.HeaderActionBtn.isUserInteractionEnabled = false
            self.readMessage()
            PageIndex = 0
            self.isnewMessage = true
//            self.getMessageListAPICall(threadId: threadId)
            var recentString = String()
            var endString = String()
            var PersonCap = Int()
            var reservartion = Int()
            
            if(getmessageListquery.count > 0)
            {
                let array = getmessageListquery
                //print("reverse Action cancel \(array)")
                
                for element in array.reversed() {
                    print(element) // e,d,c,b,a
                }
                
                array.reversed().forEach { print($0) } // e,d,c,b,a
                
                print(Array(array.reversed()))
                let reversedArray = Array(array.reversed())
                
                print("reverse action cancel \(reversedArray)")
                for i in reversedArray {
                    if i.type == "instantBooking" || i.type == "approved" || i.type == "intantBooking"{
                        if(Utility.shared.host_message_isfromHost || Utility.shared.host_message_isfrommessage || Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification)
                        {
                            recentString = i.startDate!
                            endString = i.endDate!
                            PersonCap = i.personCapacity ?? 1
                            reservartion = i.reservationId ?? 0
                        }else{
                            
                        }
                    }
                    
                }
            }
            
            print(recentString)
            if(Utility.shared.host_message_isfromHost || Utility.shared.host_message_isfrommessage || Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification)
            {
                if(getmessageListquery.count > 0)
                {
                    
                    let timestamp = Date().currentTimeMillis()
                    print(recentString)
                    
                    let sDate = recentString  //getmessageListquery.first?.startDate
                    let edate =  endString //getmessageListquery.first?.endDate
                    
                    
                    let array =   GetThreadsQuery.Data.GetThread.Result.ThreadItem.init(id:self.sendMessageArray.id, threadId:self.threadId, reservationId:reservartion, content:"", sentBy:Utility.shared.getCurrentUserID()! as String, type:"preApproved", startDate: sDate, endDate:edate, createdAt:"\(timestamp)")
                    
                    
                    //     print( getmessageListquery.first?.startDate)
                    
                    let timeStampValueStart = Int(sDate) != nil  ? Int(sDate)!/1000 : 0
                    let startingDate = Date(timeIntervalSince1970: TimeInterval(timeStampValueStart))
                    let timeStampValueEnd = Int(edate) != nil  ? Int(edate)!/1000 : 0
                    let EndingDate = Date(timeIntervalSince1970: TimeInterval(timeStampValueEnd))
                    let dateFormaatter = DateFormatter()
                    dateFormaatter.timeZone = TimeZone(abbreviation: "UTC")
                    dateFormaatter.dateFormat = "dd MMM yyyy"
                    var datefetchedStart = String()
                    var datefetchedEnd = String()
                    
                    datefetchedStart = dateFormaatter.string(from: startingDate)
                    datefetchedEnd  = dateFormaatter.string(from: EndingDate)
                    
                    print(datefetchedStart)
                    
                    print("Cancelled")
                    
                    let cancelVC =  TripsCancelVC()
                    cancelVC.listID = Int(Utility.shared.ListID)!
                    cancelVC.checkinDate = datefetchedStart
                    cancelVC.checkoutDate = datefetchedEnd
                    
                    var currency = String()
                    
                    if(Utility.shared.getPreferredCurrency() != nil && Utility.shared.getPreferredCurrency() != "")
                    {
                        currency = Utility.shared.getPreferredCurrency()!
                    }
                    else{
                        currency = Utility.shared.currencyvalue_from_API_base
                    }
                    cancelVC.getcancellationAPICall(reservationId: reservartion, userType:HOST, currency: currency)
                    Utility.shared.host_cancel_isfromCancel = true
                    Utility.shared.isFromMessageListingPage_host = true
                    cancelVC.modalPresentationStyle = .fullScreen
                    self.present(cancelVC, animated: true, completion: nil)
                }
                
            }else{
                
            }
        }else{
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey: "error_field"))!)")
//            self.offlineView_func()
//
//
//            self.view.layoutIfNeeded()
//            self.view.bringSubviewToFront(self.offlineView)
        }
        
    }
    
    @objc func cancelReservationGuest(){
        if Utility.shared.isConnectedToNetwork() {
            
        //    self.offlineView.isHidden = true
           // self.HeaderActionBtn.isUserInteractionEnabled = false
            self.readMessage()
            PageIndex = 0
            self.isnewMessage = true
//            self.getMessageListAPICall(threadId: threadId)
            var recentString = String()
            var endString = String()
            var PersonCap = Int()
            var reservartion = Int()
            
            if(getmessageListquery.count > 0)
            {
                let array = getmessageListquery
                //print("reverse Action cancel \(array)")
                
                for element in array.reversed() {
                    print(element) // e,d,c,b,a
                }
                
                array.reversed().forEach { print($0) } // e,d,c,b,a
                
                print(Array(array.reversed()))
                let reversedArray = Array(array.reversed())
                
                print("reverse action cancel \(reversedArray)")
                for i in reversedArray {
                    if i.type == "instantBooking" || i.type == "approved" || i.type == "intantBooking" {
                        if(Utility.shared.host_message_isfromHost || Utility.shared.host_message_isfrommessage || Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification)
                        {

                        }else{
                            recentString = i.startDate!
                            endString = i.endDate!
                            PersonCap = i.personCapacity ?? 1
                            reservartion = i.reservationId ?? 0
                        }
                    }
                    
                }
            }
            
            print(recentString)
            if(Utility.shared.host_message_isfromHost || Utility.shared.host_message_isfrommessage || Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification)
            {
                
                
            }else{
                if(getmessageListquery.count > 0)
                {
                    
                    let timestamp = Date().currentTimeMillis()
                    print(recentString)
                    
                    let sDate = recentString  //getmessageListquery.first?.startDate
                    let edate =  endString //getmessageListquery.first?.endDate
                    
                    
                    let array =   GetThreadsQuery.Data.GetThread.Result.ThreadItem.init(id:self.sendMessageArray.id, threadId:self.threadId, reservationId:reservartion, content:"", sentBy:Utility.shared.getCurrentUserID()! as String, type:"preApproved", startDate: sDate, endDate:edate, createdAt:"\(timestamp)")
                    
                    
                    //     print( getmessageListquery.first?.startDate)
                    
                    let timeStampValueStart = Int(sDate) != nil  ? Int(sDate)!/1000 : 0
                    let startingDate = Date(timeIntervalSince1970: TimeInterval(timeStampValueStart))
                    let timeStampValueEnd = Int(edate) != nil  ? Int(edate)!/1000 : 0
                    let EndingDate = Date(timeIntervalSince1970: TimeInterval(timeStampValueEnd))
                    let dateFormaatter = DateFormatter()
                    dateFormaatter.timeZone = TimeZone(abbreviation: "UTC")
                    dateFormaatter.dateFormat = "dd MMM YYYY"
                    var datefetchedStart = String()
                    var datefetchedEnd = String()
                    
                    datefetchedStart = dateFormaatter.string(from: startingDate)
                    datefetchedEnd  = dateFormaatter.string(from: EndingDate)
                    
                    print(datefetchedStart)
                    
                    print("Cancelled")
                    
                    let cancelVC =  TripsCancelVC()
                    cancelVC.listID = Int(Utility.shared.ListID)!
                    cancelVC.checkinDate = datefetchedStart
                    cancelVC.checkoutDate = datefetchedEnd
                    
                    var currency = String()
                    
                    if(Utility.shared.getPreferredCurrency() != nil && Utility.shared.getPreferredCurrency() != "")
                    {
                        currency = Utility.shared.getPreferredCurrency()!
                    }
                    else{
                        currency = Utility.shared.currencyvalue_from_API_base
                    }
                    cancelVC.getcancellationAPICall(reservationId: reservartion, userType:GUEST, currency: currency)
                    Utility.shared.host_cancel_isfromCancel = false
                    Utility.shared.isFromMessageListingPage_guest = true
                    cancelVC.modalPresentationStyle = .fullScreen
                    self.present(cancelVC, animated: true, completion: nil)
                }
            }
        }else{
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey: "error_field"))!)")
            
//            self.offlineView_func()
//
//
//            self.view.layoutIfNeeded()
//            self.view.bringSubviewToFront(self.offlineView)

        }
    }
    
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if(indexPath.row == 0)
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
                                print("currentpage2 \(self.PageIndex)")
                   if(!self.isnewMessage)
                   {
                    self.getMessageListAPICall(threadId:threadId)
                    }

                }
        }
    }
    
    func getdateValue(timestamp:String) -> String
    {
         if(Int(timestamp) != nil ) {
        let timestamValue = Int(timestamp)!/1000
        let showDate = Date(timeIntervalSince1970:TimeInterval(timestamValue))
        let dateFormatter = DateFormatter()
             dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "MMM dd yyyy"
//             if(Utility.shared.isRTLLanguage()) {
//        dateFormatter.locale = NSLocale(localeIdentifier:"en") as Locale
//             }
//             else {
//                 dateFormatter.locale = NSLocale(localeIdentifier:Utility.shared.getAppLanguageCode()!) as Locale
//             }
        let date = dateFormatter.string(from: showDate)
            return date } else {
            return Utility.shared.getdateformatter(date: timestamp) }
    }
    
    func getdayValue(timestamp:String) -> String
    {
         if(Int(timestamp) != nil ) {
        let timestamValue = Int(timestamp)!/1000
        let showDate = Date(timeIntervalSince1970:TimeInterval(timestamValue))
        let dateFormatter1 = DateFormatter()
             dateFormatter1.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter1.dateFormat = "EEE"
//             if(Utility.shared.isRTLLanguage()) {
//        dateFormatter1.locale = NSLocale(localeIdentifier:"en") as Locale
//             }
//             else {
//                 dateFormatter1.locale = NSLocale(localeIdentifier:Utility.shared.getAppLanguageCode()!) as Locale
//             }
        let day = dateFormatter1.string(from: showDate)
            return day } else {
          return Utility.shared.getdateformatter1(date: timestamp)
        }
    }
    
    //MARK: update tableview cell from bottom
    @objc func scrollToBottom() {
        if self.getmessageListquery.count != 0 {
            //            let indexPath = IndexPath(row: self.msgArray.count-1, section: 0)
            //            self.msgTableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
            
            DispatchQueue.main.async {
                let indexPath = IndexPath(row:0,section: 0)
                UIView.performWithoutAnimation {
                    self.inboxlistingTable.scrollToRow(at: indexPath, at: .none, animated: false)
                }
                
                
            }
        }
    }
   
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool
    {
        
        if Utility.shared.checkEmptyWithString(value: textView.text!+text)
        {
            configureNextBtn(enable: false)
        }
        else
        {
            configureNextBtn(enable: true)
        }
        return true
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
      //  if Utility().isConnectedToNetwork(){
        
        
        
        let info = sender.userInfo!
        let keyboardFrame: CGRect = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        self.bottomview.frame.origin.y = keyboardFrame.origin.y - 75
        CustomHeaderView.isHidden = true
       // if CustomHeaderView.isHidden {
      
        
            self.inboxlistingTable.frame.origin.y = 85
            self.inboxlistingTable.frame.size.height = (self.bottomview.frame.origin.y - self.topView.frame.size.height-10)
        
      //  }else{
          //  self.inboxlistingTable.frame.origin.y = (CustomHeaderView.frame.height + CustomHeaderView.frame.origin.y)+5
          //  self.inboxlistingTable.frame.size.height = ((self.bottomview.frame.origin.y-self.topView.frame.size.height) - CustomHeaderView.frame.size.height) - 20
       // }
        self.unreadView.frame.origin.y = self.bottomview.frame.origin.y - 65
        if self.getmessageListquery.count != 0 {
            self.viewDidLayoutSubviews()
        }
        
       // }
 
        
    }

    @objc func keyboardWillHide(sender: NSNotification) {
        
       // if Utility().isConnectedToNetwork(){
        let info = sender.userInfo!
        self.bottomview.frame.origin.y = (FULLHEIGHT - 75)
        if isformViewUpdation{
            CustomHeaderView.isHidden = false
        }else{
            CustomHeaderView.isHidden = true
        }
 
        if CustomHeaderView.isHidden {
       
            self.inboxlistingTable.frame.origin.y = 85
            self.inboxlistingTable.frame.size.height = (self.bottomview.frame.origin.y - self.topView.frame.size.height-10)-5
        
        }else{
    
            self.inboxlistingTable.frame.origin.y = (CustomHeaderView.frame.height + CustomHeaderView.frame.origin.y)+15
            self.inboxlistingTable.frame.size.height = ((self.bottomview.frame.origin.y-self.topView.frame.size.height-10) - CustomHeaderView.frame.size.height)-5
        }
        self.unreadView.frame.origin.y = FULLHEIGHT - 140
       // }
        

        
    }
    
    
    func numSections(in collectionSkeletonView: UITableView) -> Int {
        return 1
    }
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 10
    }
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier{
        if(indexPath.row % 2 == 0) {
            return "sendCell"
        }
        return "ReceiverMessageonlyCell"
    }
    func collectionSkeletonView(_ skeletonView: UITableView, skeletonCellForRowAt indexPath: IndexPath) -> UITableViewCell? {
        if(indexPath.row % 2 == 0) {
            let cell = skeletonView.dequeueReusableCell(withIdentifier: "sendCell", for: indexPath)as! sendCell
            cell.senderView.backgroundColor =  UIColor(named: "Button_Grey_Color")
            cell.curveView.isHidden = true
            return cell
        }
        
        let cell = skeletonView.dequeueReusableCell(withIdentifier: "ReceiverMessageonlyCell", for: indexPath)as! ReceiverMessageonlyCell
        cell.curveView.isHidden = true
        cell.receiverView.backgroundColor =  UIColor(named: "Button_Grey_Color")
        return cell
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
extension Date {
    func currentTimeMillis() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
}
extension UIView{
    func animShow(){
        UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseIn],
                       animations: {
                        self.center.y -= self.bounds.height
                        self.layoutIfNeeded()
        }, completion: nil)
        self.isHidden = false
    }
    func animHide(){
        UIView.animate(withDuration: 2, delay: 0, options: [.curveLinear],
                       animations: {
                        self.center.y += self.bounds.height
                        self.layoutIfNeeded()
                        
        },  completion: {(_ completed: Bool) -> Void in
            self.isHidden = true
        })
    }
}
extension Date {
    
    var startOfDay : Date {
        let calendar = Calendar.current
        let unitFlags = Set<Calendar.Component>([.year, .month, .day])
        let components = calendar.dateComponents(unitFlags, from: self)
        return calendar.date(from: components)!
    }
    
    var endOfDayTimer : Date {
        var components = DateComponents()
        components.day = 1
        let date = Calendar.current.date(byAdding: components, to: self.startOfDay)
        return (date?.addingTimeInterval(-1))!
    }
}
extension NSMutableAttributedString {
    
    func setColor(color: UIColor, forText stringValue: String) {
        let range: NSRange = self.mutableString.range(of: stringValue, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
    
}
extension UIButton
{
    func applyGradient(colors: [CGColor])
    {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}

