//
//  WhishlistPageVC.swift
//  App
//
//  Created by RadicalStart on 03/07/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit
import Apollo
import Lottie

protocol WhishlistPageVCProtocol
{
    func APIMethodCall(listId:Int, status:Bool)
    func didupdateWhishlistStatus(status:Bool)
    
    
}

class WhishlistPageVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UIGestureRecognizerDelegate, UICollectionViewDelegateFlowLayout,CreateListVCProtocol {
    func updateWhishlistStatus(status: Bool, title:String) {
        self.Whishlist_status = status
    }
    
    
    
    //MARK*********************************** IBOUTLET CONNECTIONS & GLOBAL VARIABLE DECLARATIONS *******************************************>
    
    @IBOutlet weak var noWhishlistView: UILabel!
    @IBOutlet weak var whishlistView: UIView!
    @IBOutlet weak var chooseLabel: UILabel!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var whishlistCollection: UICollectionView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: "WhishlistPageVC", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var whishlistarray = [PTProAPI.GetAllWishListGroupQuery.Data.GetAllWishListGroup.Result]()
    var whishlistarrayReverse = [PTProAPI.GetAllWishListGroupQuery.Data.GetAllWishListGroup.Result]()
    var listID = Int()
    var listimage = String()
    var senderID = Int()
    var Whishlist_status = Bool()
    var lottieView: LottieAnimationView!
    
    var delegate: WhishlistPageVCProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
        
        if Utility.shared.isRTLLanguage() {
            addBtn.titleLabel?.textAlignment = .left
        }
        
        addBtn.layer.cornerRadius = addBtn.frame.size.height / 2
        addBtn.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.lottieAnimation()
        self.whishlistarray.removeAll()
        self.whishlistarrayReverse.removeAll()
        self.WhishlistAPICall()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.whishlistView.halfroundedCorners(corners: [.topLeft, .topRight], radius: 20.0)
    }
  func initialSetup()
  {
      self.whishlistView.backgroundColor = UIColor(named: "colorController")
      whishlistCollection.register(UINib(nibName: "WhishlistCell", bundle: nil), forCellWithReuseIdentifier: "WhishlistCell")
      self.chooseLabel.textColor  = UIColor(named: "Title_Header")
      whishlistView.halfroundedCorners(corners: [.topLeft, .topRight], radius: 20.0)
    noWhishlistView.isHidden = true
    if let flowLayout = whishlistCollection.collectionViewLayout as? UICollectionViewFlowLayout {
        flowLayout.itemSize = CGSize(width: whishlistCollection.frame.size.width*0.65, height: whishlistCollection.frame.size.height)
        flowLayout.scrollDirection = .horizontal
    }
    chooseLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"saved") ?? "Saved")"
    noWhishlistView.text = "\((Utility.shared.getLanguage()?.value(forKey:"nowhishlistdesc"))!)"
      self.noWhishlistView.textColor  = UIColor(named: "Title_Header")
     
      chooseLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
      chooseLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 24)
      noWhishlistView.font = UIFont(name: APP_FONT, size:14)
}
    func lottieAnimation(){
        lottieView = LottieAnimationView.init(name:"animation")
        lottieView.isHidden = false
        self.lottieView.frame = CGRect(x:(FULLWIDTH-120)/2, y:(whishlistCollection.frame.size.height - 200 )/2, width:100, height:100)
        self.whishlistCollection.addSubview(self.lottieView)
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
    func WhishlistAPICall()
    {
        let whishlistQuery = PTProAPI.GetAllWishListGroupQuery(currentPage: .none)
        Network.shared.apollo_headerClient.fetch(query: whishlistQuery,cachePolicy:.fetchIgnoringCacheData){  response in
            switch response {
            case .success(let result):
                guard (result.data?.getAllWishListGroup?.results) != nil else{
                    
                    self.Whishlist_status = false
                    self.lottieView.isHidden = true
                    self.noWhishlistView.isHidden = false
                    self.whishlistCollection.isHidden = true
                    return
                }
                self.whishlistarrayReverse = ((result.data?.getAllWishListGroup?.results)!) as! [PTProAPI.GetAllWishListGroupQuery.Data.GetAllWishListGroup.Result]
                
                self.whishlistarray  = self.whishlistarrayReverse.reversed()
                
                
                if(self.whishlistarray.count>0)
                {
                    self.lottieView.isHidden = true
                    self.noWhishlistView.isHidden = true
                    self.whishlistCollection.isHidden = false
                    let cell = self.view.viewWithTag(2000) as? WhishlistCell
                    cell?.lottieView1 = LottieAnimationView.init(name:"animation_white")
                    cell?.lottieView1.isHidden = true
                    self.whishlistCollection.reloadData()
                    let indexPaths = IndexPath(item: 0, section: 0)
                    self.whishlistCollection.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: false)
                    
                    
                }
                else
                {
                    self.lottieView.isHidden = true
                    self.noWhishlistView.isHidden = false
                    self.whishlistCollection.isHidden = true
                }
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
            }
        }
    }
    
    func createWhishlistAPICall(listId:Int,wishListGroupId:Int,eventKey:Bool)
    {
        let createWhishlistMutation = PTProAPI.CreateWishListMutation(listId: listId, wishListGroupId:.some(wishListGroupId), eventKey: .some(eventKey))
        Network.shared.apollo_headerClient.perform(mutation: createWhishlistMutation){  response in
            switch response {
            case .success(let result):
                if let data = result.data?.createWishList?.status,data == 200 {
                    self.WhishlistAPICall()
                } else {
                    self.view.makeToast(result.data?.createWishList?.errorMessage)
                    let seconds = 2.0
                    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                        self.dismissView()
                    }
                }
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
                let seconds = 2.0
                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                    self.dismissView()
                }
            }
        }
    }
    
    @IBAction func addBtnTapped(_ sender: Any) {
        let createListObj = CreateListVC()
        createListObj.listID = self.listID
        createListObj.delegate  = self
        createListObj.modalPresentationStyle = .fullScreen
        self.present(createListObj, animated: true, completion: nil)
    }
    
    @objc func dismissView()
    {
        delegate?.didupdateWhishlistStatus(status:Whishlist_status)
        delegate?.APIMethodCall(listId:self.listID, status:Whishlist_status)
        self.dismiss(animated: false, completion: nil)
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if whishlistView.bounds.contains(touch.location(in: whishlistView)) {
            return false
        }
        return true
    }
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return whishlistarray.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width*0.67, height: collectionView.frame.size.height)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WhishlistCell", for: indexPath)as! WhishlistCell
        cell.tag = indexPath.item + 2000

        if(whishlistarray.count>0)
        {
            cell.titleLabel.text = whishlistarray[indexPath.row].name ?? ""
            cell.countLabel.text = " (\(whishlistarray[indexPath.row].wishListCount ?? 0)) "
            cell.likeImage.isHidden = false
            cell.lottieView1 = LottieAnimationView.init(name:"animation")
            cell.lottieView1.isHidden = true
            if(whishlistarray[indexPath.row].wishListCount!>0)
            {
                if let listimages = whishlistarray[indexPath.row].wishListCover?.listData?.listPhotoName
               {
                    cell.whishImage.sd_setImage(with: URL(string: "\(IMAGE_LISTING_MEDIUM)\(listimages)"), placeholderImage: #imageLiteral(resourceName: "box-with-like"))
                    cell.whishImage.contentMode = .scaleAspectFill
                }
                else{
                    cell.whishImage.image = #imageLiteral(resourceName: "box-with-like")
                }
            
                if((whishlistarray[indexPath.row].wishListIds?.contains(listID))!)
                {
                    cell.likeImage.isHidden = false
                    cell.likeImage.image = #imageLiteral(resourceName: "whish_red_like")
                }else{
                    cell.likeImage.isHidden = false
                    cell.likeImage.image = #imageLiteral(resourceName: "whishlike")
                }
            }else{
                cell.likeImage.isHidden = true
                cell.whishImage.image = #imageLiteral(resourceName: "box-with-like")
            }
        }
        
        cell.layoutIfNeeded()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         if Utility.shared.isConnectedToNetwork(){
        let cell = view.viewWithTag(indexPath.item + 2000) as? WhishlistCell
           cell?.lottieLottieAnimationView()
        // Timer.scheduledTimer(timeInterval:0.3, target: self, selector: #selector(cell?.autoscroll), userInfo: nil, repeats: true)
            //cell?.likeImage.isHidden = false
            
         if(whishlistarray.count > 0)
         {
        if((whishlistarray[indexPath.row].wishListIds?.contains(listID))!)
        {
        self.createWhishlistAPICall(listId: listID, wishListGroupId: whishlistarray[indexPath.row].id!, eventKey: false)
        Whishlist_status = false
        }
        else
        {
        self.createWhishlistAPICall(listId: listID, wishListGroupId: whishlistarray[indexPath.row].id!, eventKey: true)
        Whishlist_status = true

        }
        }
        }
         else{
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"error_field"))!)")
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
