//
//  AffiliateRegistrationDocument.swift
//  App
//
//  Created by Phycom Mac Pro on 13/09/23.
//  Copyright © 2023 RADICAL START. All rights reserved.
//

import UIKit
import SkeletonView
import Lottie
import Alamofire

class AffiliateRegistrationDocument: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var imagePicker = UIImagePickerController()
    var imageData = NSData()

    @IBOutlet weak var offlineView: UIView!
    var lottieWholeView = UIView()
    var lottieView: LottieAnimationView!
    @IBOutlet weak var retryBtn: UIButton!
    @IBOutlet weak var errorLabel: UILabel!

    @IBOutlet weak var lblDocument: UILabel!
    @IBOutlet weak var lblUploadYour: UILabel!
    
    @IBOutlet weak var uploadOuterView: UIView!
    @IBOutlet weak var lblUploadPhotos: UILabel!
    @IBOutlet weak var imgPlus: UIImageView!
    @IBOutlet weak var btnUploadPhotos: UIButton!
    @IBOutlet weak var viewUploadPhotos: UIView!
    
    @IBOutlet weak var documentCV: UICollectionView!
    
    @IBOutlet weak var btnReadConditions: UIButton!
    @IBOutlet weak var imgDownArrow: UIImageView!
    @IBOutlet weak var lblReadBelowCondition: UILabel!
    @IBOutlet weak var stackviewTerms: UIStackView!
    
    @IBOutlet weak var viewTerms1: UIView!
    @IBOutlet weak var viewTerms2: UIView!
    @IBOutlet weak var viewTerms3: UIView!
    @IBOutlet weak var viewTerms4: UIView!
    @IBOutlet weak var stackviewEmpty1: UIStackView!
    @IBOutlet weak var stackviewEmpty2: UIStackView!
    
    @IBOutlet weak var lblTerms1: UILabel!
    @IBOutlet weak var lblTerms2: UILabel!
    @IBOutlet weak var lblTerms3: UILabel!
    @IBOutlet weak var lblTerms4: UILabel!
    
    @IBOutlet weak var imgTerms1: UIImageView!
    @IBOutlet weak var imgTerms2: UIImageView!
    @IBOutlet weak var imgTerms3: UIImageView!
    @IBOutlet weak var imgTerms4: UIImageView!
    
    @IBOutlet weak var btnAgreeTermsAndConditions: UIButton!
    @IBOutlet weak var btnFinish: UIButton!
    @IBOutlet weak var btnPrevious: UIButton!
    
    var isTermsSelected = false

    var arrDocList = [PTProAPI.AffiliateShowDocumentListQuery.Data.AffiliateShowDocumentList?]()
    var docFile = [String:Any]()
    override func viewDidLoad() {
        super.viewDidLoad()
        documentCV.delegate = self
        imagePicker.delegate = self
        lottieView = LottieAnimationView.init(name: "loading_qwe")
        self.initialSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.initializeView()
        self.getDocumentListAPICall()
    }
    
    //MARK: - customMethod
    func initialSetup()
    {
        offlineView.backgroundColor =  UIColor(named: "Button_Grey_Color")
        self.offlineView.isHidden = true
        errorLabel.textColor =  UIColor(named: "Title_Header")
        retryBtn.setTitleColor(Theme.PRIMARY_COLOR, for: .normal)
        errorLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"error_field"))!)"
        retryBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"retry"))!)", for:.normal)
        errorLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 15)
        retryBtn.titleLabel?.font = UIFont(name: APP_FONT, size: 15)
    }
    
    func initializeView(){
        if #available(iOS 15.0, *) {
            btnAgreeTermsAndConditions.configuration?.imagePadding = 10
        } else {
            btnAgreeTermsAndConditions.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        }
        
        btnAgreeTermsAndConditions.setImage(#imageLiteral(resourceName: isTermsSelected ? "checked" : "unchecked"), for: .normal)
        
        btnUploadPhotos.setTitle("", for: .normal)
        btnReadConditions.setTitle( "", for: .normal)
        
        let borderLayer = CAShapeLayer()
        
        borderLayer.strokeColor = UIColor.lightGray.cgColor
        borderLayer.lineDashPattern = [2,5]
        borderLayer.frame = viewUploadPhotos.bounds
        borderLayer.fillColor = nil
        borderLayer.path = UIBezierPath(roundedRect: viewUploadPhotos.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 15, height: 15)).cgPath
        viewUploadPhotos.layer.addSublayer(borderLayer)
        
        stackviewTerms.isHidden = true
        viewTerms1.isHidden = true
        viewTerms2.isHidden = true
        viewTerms3.isHidden = true
        viewTerms4.isHidden = true
        stackviewEmpty1.isHidden = true
        stackviewEmpty2.isHidden = true
    }
    
    func initializeLocalizations(){
        lblUploadYour.text =  "\((Utility.shared.getLanguage()?.value(forKey:"UploadYour")) ?? "Upload your")"
        lblDocument.text =  "\((Utility.shared.getLanguage()?.value(forKey:"Documents")) ?? "Documents")"
        lblUploadPhotos.text =  "\((Utility.shared.getLanguage()?.value(forKey:"UploadPhotos")) ?? "Upload photos")"
        lblReadBelowCondition.text =  "\((Utility.shared.getLanguage()?.value(forKey:"ReadBelowConditions")) ?? "Read below conditions to quickly verify.")"
        lblTerms1.text =  "\((Utility.shared.getLanguage()?.value(forKey:"PassportDriverlicenceOrNationalID")) ?? "Passport, Driver licence, or national ID.")"
        lblTerms2.text =  "\((Utility.shared.getLanguage()?.value(forKey:"BankStatementMust")) ?? "Bank statement must contain the business address and show customer transactions must be dated within the last 180 days.")"
        lblTerms3.text =  "\((Utility.shared.getLanguage()?.value(forKey:"BusinessNameAndDetails")) ?? "Business name and details (address, registration number, and entity type) must be visible")"
        lblTerms4.text =  "\((Utility.shared.getLanguage()?.value(forKey:"WaterElectricityGasInternetTelecomBill")) ?? "Water, electricity, gas, internet, telecom bill issued by the utility company, or a mobile phone bill(your options will display in a drop-down on the page)")"
        //"\((Utility.shared.getLanguage()?.value(forKey:"IAgreeWithTheTermsAndCondtitions")) ?? "I agree with the terms and condtitions")"
        btnFinish.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"FINISH")) ?? "FINISH")", for: .normal)
        btnPrevious.setTitle( "\((Utility.shared.getLanguage()?.value(forKey:"PREVIOUS")) ?? "PREVIOUS")", for: .normal)
    }
    
    //MARK: - actions
    @IBAction func retryBtnTapped(_ sender: Any){
        if Utility.shared.isConnectedToNetwork(){
            self.offlineView.isHidden = true
        }
    }
    
    @IBAction func onClickUploadDocumnet(_ sender: Any) {
        self.imagePickerAlert()
    }
    
    @IBAction func onClickReadTermAndConditions(_ sender: Any) {
        stackviewTerms.isHidden = !stackviewTerms.isHidden
        viewTerms1.isHidden = !viewTerms1.isHidden
        viewTerms2.isHidden = !viewTerms2.isHidden
        viewTerms3.isHidden = !viewTerms3.isHidden
        viewTerms4.isHidden = !viewTerms4.isHidden
        stackviewEmpty1.isHidden = !stackviewEmpty1.isHidden
        stackviewEmpty2.isHidden = !stackviewEmpty2.isHidden
    }
    
    @IBAction func onClickBtnAgreeTermsAndConditions(_ sender: Any) {
        isTermsSelected = !isTermsSelected
        btnAgreeTermsAndConditions.setImage(#imageLiteral(resourceName: isTermsSelected ? "checked" : "unchecked"), for: .normal)
    }
    
    @IBAction func onClickFinish(_ sender: Any) {
        if arrDocList.count == 0{
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"PleaseSelectPhotosToUpload")) ?? "Please Select Photos to Upload")")
        }else if !isTermsSelected{
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"PleaseAgreeWithTheTermsAndConditions")) ?? "Please agree with the terms and conditions")")
        }else{
            self.getAffiliateUserStepSuccessAPICall()
        }
    }
    
    @IBAction func onClickPrevious(_ sender: Any) {
        if let parent = parent as? AffiliateRegistration{
            parent.delegate?.userStepInfoUpdate()
            parent.showWebsiteview()
        }
    }
    //MARK: - UICollectionView Delegate
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrDocList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DocCVC", for: indexPath) as! DocCVC
        cell.btnCross.tag = indexPath.row
        cell.btnCross.setTitle("", for: .normal)
        cell.btnCross.addTarget(self, action: #selector(deleteDoc(sender:)), for: .touchUpInside)
        cell.imgDoc.sd_setImage(with: URL(string:"\(AffiliateDocument_URL)\(arrDocList[indexPath.row]?.fileName ?? "")"), completed: nil)
        cell.contentView.layer.cornerRadius = 8
        return cell
    }
    
    @objc func deleteDoc(sender: Any){
        print("tickedOffPressed !")
        if let button = sender as? UIButton {
            self.docDeleteConfirmationAlert(intIndex: button.tag)
        }
    }

    func docDeleteConfirmationAlert(intIndex: Int) {
        let alert = UIAlertController(title: "Delete Photo", message: "Are you sure you want to delete this item?", preferredStyle: .alert)

        // yes action
        let yesAction = UIAlertAction(title: "Yes", style: .default) { _ in
            self.removeAffiliateDocumentListAPICall(intId: self.arrDocList[intIndex]!.id!)
        }

        alert.addAction(yesAction)

        // cancel action
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

        present(alert, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.view.frame.size.width - 50)/2, height: ((self.view.frame.size.width - 50)/2)*0.6)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
                        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }
    
    //MARK: - ImagePicker Delegate
    func imagePickerAlert(){
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallary()
        }))
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        
        /*If you want work actionsheet on ipad
         then you have to use popoverPresentationController to present the actionsheet,
         otherwise app will crash on iPad */
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            alert.popoverPresentationController?.sourceView = self.view
            alert.popoverPresentationController?.sourceRect = self.view.bounds
            alert.popoverPresentationController?.permittedArrowDirections = .up
        default:
            break
        }
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func openCamera()
    {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
        {
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func openGallary()
    {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if Utility.shared.isConnectedToNetwork() {
            if let pickedImage = info[.originalImage] as? UIImage {
                
                self.imageData = pickedImage.jpegData(compressionQuality: 0.0)! as NSData

                self.uploadDocImageService(imageBase64: self.imageData as Data)
            }
            self.dismiss(animated: true, completion: nil)
        }else{
            self.view.makeToast("Please connect to intenet and try again")
        }
    }
    
    func uploadDocImageService(imageBase64:Data)
    {
        
        if Utility.shared.isConnectedToNetwork(){
            self.uploadDocPic(profileimage:imageBase64,onSuccess:{response in
           
        })
        }
        else
        {
            self.lottieView.isHidden = true
            self.lottieWholeView.isHidden = true
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
    
    func uploadDocPic(profileimage:Data,onSuccess success: @escaping (NSDictionary) -> Void) {
        if Utility.shared.isConnectedToNetwork(){
            self.lottieAnimation()
            let BaseUrl = URL(string: AffiliateDocument_UPLOAD_PHOTO)
            print("BASE URL : \(AffiliateDocument_UPLOAD_PHOTO)")

            let header = ["auth": "\(Utility.shared.getCurrentUserToken()!)"]
            
            
            AF.upload(multipartFormData: { (multipartFormData) in
                multipartFormData.append(profileimage, withName: "file", fileName: "file.jpeg", mimeType: "image/jpeg")
            },to: BaseUrl!, usingThreshold: UInt64.init(),
                  method: .post,
                      headers: HTTPHeaders.init(header)).responseData(completionHandler: { responseData in
                if(responseData.error == nil){
                    self.checkUploadStatus(rseposneData: responseData.data!)
                }else{
                    self.lottieView.isHidden = true
                    self.lottieWholeView.isHidden = true
                }
            })
        }
        else {
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
    
    func checkUploadStatus(rseposneData: Data) {
        do {
            let obj = try JSONSerialization.jsonObject(with: rseposneData, options: .mutableContainers) as! NSDictionary
            if obj.value(forKey: "status") as! Int == 200 {
                if let dic = obj.object(forKey: "files") as? [[String:Any]],dic.count != 0 {
                    createDocumentAffiliateUser(fileName: dic[0]["filename"] as! String, fileType: dic[0]["mimetype"] as! String)
                }else{
                    self.getDocumentListAPICall()
                }
            }else {
                self.getDocumentListAPICall()
            }
        }catch {
            self.getDocumentListAPICall()
        }
    self.lottieView.isHidden = true
    self.lottieWholeView.isHidden = true
    }
    
    //MARK: - API CALL
    func createDocumentAffiliateUser(fileName:String,fileType:String){
        if Utility.shared.isConnectedToNetwork(){
            self.lottieAnimation()
            let createDocumentAffiliateUserMutation = PTProAPI.CreateDocumentAffiliateUserMutation(userId: Utility.shared.ProfileAPIArray?.userId ?? "", fileName: .some(fileName), fileType: .some(fileType))
            Network.shared.apollo_headerClient.perform(mutation: createDocumentAffiliateUserMutation){ response in
                switch response {
                case .success(let result): 
                    if let status = result.data?.createDocumentAffiliateUser?.status,status == 200{
                    }
                    self.getDocumentListAPICall()
                case .failure(_):
                    self.getDocumentListAPICall()
                    break
                }
            }
        }else{
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
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-85, width: FULLWIDTH, height: 55)
            }else{
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-55, width: FULLWIDTH, height: 55)
            }
        }
    }
    
    func removeAffiliateDocumentListAPICall(intId:Int){
        if Utility.shared.isConnectedToNetwork(){
            self.lottieAnimation()
            let removeAffiliateDocumentListMutation = PTProAPI.RemoveAffiliateDocumentListMutation(id: .some(intId), userId: .some(Utility.shared.ProfileAPIArray?.userId ?? ""))
            Network.shared.apollo_headerClient.perform(mutation: removeAffiliateDocumentListMutation){ response in
                switch response {
                case .success(let result):
                    if let status = result.data?.removeAffiliateDocumentList?.status,status == 200{
                    }
                    self.getDocumentListAPICall()
                case .failure(_):
                    self.getDocumentListAPICall()
                    break
                }
            }
        }else{
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
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-85, width: FULLWIDTH, height: 55)
            }else{
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-55, width: FULLWIDTH, height: 55)
            }
        }
    }
    
    func getDocumentListAPICall(){
        if Utility.shared.isConnectedToNetwork(){
            self.lottieAnimation()
            let affiliateDocumentListQuery = PTProAPI.AffiliateShowDocumentListQuery(userId: .some(Utility.shared.ProfileAPIArray?.userId ?? ""))
            Network.shared.apollo_headerClient.fetch(query: affiliateDocumentListQuery){ response in
                switch response {
                case .success(let result):
                    if let list = result.data?.affiliateShowDocumentList{
                        self.arrDocList = list
                    }
                    self.lottieView.isHidden = true
                    self.lottieWholeView.isHidden = true
                    DispatchQueue.main.async {
                        self.documentCV.reloadData()
                   }
                case .failure(_):
                    self.lottieView.isHidden = true
                    self.lottieWholeView.isHidden = true
                    DispatchQueue.main.async {
                        self.documentCV.reloadData()
                   }
                    break
                }
            }
        }else{
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
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-85, width: FULLWIDTH, height: 55)
            }else{
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-55, width: FULLWIDTH, height: 55)
            }
        }
    }
    
    func getAffiliateUserStepSuccessAPICall(){
        if Utility.shared.isConnectedToNetwork(){
            self.lottieAnimation()
            let getAffiliateUserStepSuccessQuery = PTProAPI.GetAffiliateUserStepSuccessQuery(userId: .some(Utility.shared.ProfileAPIArray?.userId ?? ""))
            Network.shared.apollo_headerClient.fetch(query: getAffiliateUserStepSuccessQuery){ response in
                switch response {
                case .success(let result):
                    if let status = result.data?.getAffiliateUserStepSuccess?.status,status == 200 {
                        if let parent = self.parent as? AffiliateRegistration{
                            parent.delegate?.userStepInfoUpdate()
                            parent.dismiss(animated: true)
                        }
                    }else{
                        self.view.makeToast(result.data?.getAffiliateUserStepSuccess?.errorMessage)
                    }
                    self.lottieView.isHidden = true
                    self.lottieWholeView.isHidden = true
                case .failure(let error):
                    self.view.makeToast(error.localizedDescription)
                    self.lottieView.isHidden = true
                    self.lottieWholeView.isHidden = true
                }
            }
        }else{
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
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-85, width: FULLWIDTH, height: 55)
            }else{
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-55, width: FULLWIDTH, height: 55)
            }
        }
    }
    
    
    //MARK: - Animation
    func lottieAnimation()
    {
        self.lottieView.isHidden = false
        self.lottieWholeView.isHidden = false
        self.lottieWholeView.frame = CGRect(x: 0, y: 0, width: FULLWIDTH, height: FULLHEIGHT)
        self.lottieWholeView.backgroundColor =  UIColor.black.withAlphaComponent(0.5)
        self.view.addSubview(lottieWholeView)
        self.lottieView.frame = CGRect(x:FULLWIDTH/2-50, y: FULLHEIGHT/2-180, width: 100, height: 100)
        self.lottieWholeView.addSubview(self.lottieView)
        self.lottieView.backgroundColor = UIColor(named: "lottie-bg")
      
        self.lottieView.layer.cornerRadius = 6.0
        self.lottieView.clipsToBounds = true
        self.lottieView.play()
        Timer.scheduledTimer(timeInterval:0.3, target: self, selector: #selector(autoscroll), userInfo: nil, repeats: true)
    }
    
    @objc func autoscroll()
    {
        self.lottieView.play()
    }
}
