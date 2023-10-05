//
//  CustomAffiliateTabbar.swift
//  App
//
//  Created by RadicalStart on 24/07/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit

class CustomAffiliateTabbar: UITabBarController,UITabBarControllerDelegate {
    
    let semiCircleLayer = CAShapeLayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTabBarView()
        self.tabBar.tintColor = Theme.affiliatePurpleColor
        self.tabBar.unselectedItemTintColor =  UIColor(named: "Title_Header")
        self.delegate = self
        
        // self.tabBar.isTranslucent = false
        //  bannerViewConfig()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.configBtn()
    }
    
    // MARK: setup tab bar colors
    func configureTabBarView()  {
        tabBar.layer.shadowRadius = 2
        tabBar.layer.shadowColor = UIColor.lightGray.cgColor
        tabBar.layer.shadowOpacity = 0.2
        
        self.tabBar.backgroundColor =   UIColor(named: "colorController")
        self.tabBar.barTintColor  =   UIColor(named: "colorController")
        self.view.backgroundColor =   UIColor(named: "colorController")
        self.ConfigureView()
    }
    
    func configBtn(){
        if (IS_IPHONE_XR || IS_IPHONE_X || IS_IPHONE_XS_MAX) {
            self.tabBar.frame.size.height = 83
            tabBar.frame.origin.y = view.frame.height - 83
        }else{
            self.tabBar.frame.size.height = 49
            tabBar.frame.origin.y = view.frame.height - 49
        }
        
        let middleView = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        
        var  menuButtonFrame = middleView.frame
        menuButtonFrame.origin.y = self.tabBar.frame.origin.y - 30
        menuButtonFrame.origin.x = view.bounds.width/2 - menuButtonFrame.size.width/2
        middleView.frame = menuButtonFrame
        
        middleView.backgroundColor = .clear
        middleView.layer.cornerRadius = menuButtonFrame.height/2
        
        let bottomWhiteView = UIView()
        bottomWhiteView.frame = CGRect(x: 0, y: ((middleView.frame.size.height/2)-3), width: middleView.frame.size.width, height: middleView.frame.size.height/2)
        bottomWhiteView.backgroundColor = .clear
        
        //         middleView.addSubview(bottomWhiteView)
        
        view.addSubview(middleView)
        
        let middleButton = UIButton(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
        
        menuButtonFrame = middleButton.frame
        menuButtonFrame.origin.y =  self.tabBar.frame.origin.y - (middleButton.frame.size.height/2)
        menuButtonFrame.origin.x = view.bounds.width/2 - menuButtonFrame.size.width/2
        middleButton.frame = menuButtonFrame
        middleButton.backgroundColor = Theme.affiliatePurpleColor
        middleButton.layer.cornerRadius = menuButtonFrame.height/2
        
        semiCircleLayer.removeFromSuperlayer()
        
        let center = CGPoint (x: middleButton.frame.size.width / 2, y: middleButton.frame.size.height / 2)
        let circleRadius = middleButton.frame.size.width / 2
        let circlePath = UIBezierPath(arcCenter: center, radius: circleRadius + 1.5, startAngle: CGFloat(Double.pi * 2), endAngle: CGFloat(Double.pi), clockwise: true)
        
        semiCircleLayer.path = circlePath.cgPath
        semiCircleLayer.strokeColor = UIColor.clear.cgColor
        semiCircleLayer.fillColor = UIColor.clear.cgColor
        semiCircleLayer.lineWidth = 8
        semiCircleLayer.shadowColor = UIColor.lightGray.cgColor
        semiCircleLayer.shadowRadius = 0
        semiCircleLayer.shadowOpacity = 0.5
        semiCircleLayer.shadowPath = circlePath.cgPath.copy(strokingWithWidth:5, lineCap: .round, lineJoin: .miter, miterLimit: 0)
        
        semiCircleLayer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        middleButton.layer.addSublayer(semiCircleLayer)
        
        
        view.addSubview(middleButton)
        
        middleButton.setImage(UIImage(named: "updatedTabbarTrip"), for: .normal)
        middleButton.addTarget(self, action: #selector(goToTripsPage), for: .touchUpInside)
        
        view.layoutIfNeeded()
        
        
    }
    @objc func goToTripsPage(){
        if((Utility.shared.getCurrentUserToken()) == nil || (Utility.shared.getCurrentUserToken()) == "")
        {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let welcomeObj = WelcomePageVC()
            appDelegate.setInitialViewController(initialView: welcomeObj)
        }else{
            self.selectedIndex = 2
        }
        
    }
    //MARK: setup bottom tab bar
    func ConfigureView() {
        // Create a reference to the the appropriate storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        // Instantiate the desired view controller from the storyboard using the view controllers identifier
        // Cast is as the custom view controller type you created in order to access it's properties and methods
        //AffiliateLinkManagerVC
        let affiliateLinkManagerVC = storyboard.instantiateViewController(withIdentifier: "AffiliateLinkManagerVC") as! AffiliateLinkManagerVC
        self.config(viewController:affiliateLinkManagerVC, selImg:#imageLiteral(resourceName: "link"),unselectImg:#imageLiteral(resourceName: "link"), index:0,title:"\(Utility.shared.getLanguage()?.value(forKey:"LinkManager") ?? "Link Manager")")
        //AffiliateSearchLinkVC
        let affiliateSearchLinkVC = storyboard.instantiateViewController(withIdentifier: "AffiliateSearchLinkVC") as! AffiliateSearchLinkVC
        self.config(viewController:affiliateSearchLinkVC, selImg: #imageLiteral(resourceName: "tabsearch_red"),unselectImg:#imageLiteral(resourceName: "tabsearch"), index:1,title:"\(Utility.shared.getLanguage()?.value(forKey:"SearchLink") ?? "Search Link")")
        // affiliateOverviewVC
        let affiliateOverviewVC = storyboard.instantiateViewController(withIdentifier: "AffiliateOverviewVC") as! AffiliateOverviewVC
        self.config(viewController:affiliateOverviewVC,selImg:UIImage(),unselectImg:UIImage(), index:2,title:"\(Utility.shared.getLanguage()?.value(forKey:"Overview") ?? "Overview")")
        // TripsMessageVC
        let messgaeObj = TripsMessageVC()
        self.config(viewController:messgaeObj,selImg:#imageLiteral(resourceName: "tabchat_red"),unselectImg:#imageLiteral(resourceName: "tabchat"), index:3,title:"\(Utility.shared.getLanguage()?.value(forKey:"tabinbox") ?? "Inbox")")
        //ProfilePageVC
        let profileObj = ProfilePageVC()
        self.config(viewController:profileObj,selImg:#imageLiteral(resourceName: "tabprofile_red"),unselectImg:#imageLiteral(resourceName: "tabprofile"), index:4,title:"\(Utility.shared.getLanguage()?.value(forKey:"tabprofile") ?? "Profile")")
        
        let tabBarList = [affiliateLinkManagerVC,affiliateSearchLinkVC,affiliateOverviewVC,messgaeObj,profileObj]
        viewControllers = tabBarList
        self.selectedIndex  = Utility.shared.tabAffiliateIndex()
        
    }
    
    //configure tabBarItem
    func config(viewController:UIViewController,selImg:UIImage, unselectImg:UIImage,index:Int,title:String) {
        let iconImageView = UIImageView()
        iconImageView.image = unselectImg
        let customBarItem = UITabBarItem.init(title:title, image: unselectImg, selectedImage: selImg.withTintColor(Theme.affiliatePurpleColor))
//        self.tabBar.items?[3].titlePositionAdjustment = UIOffset(horizontal: -15.0 , vertical: 0.0)
//        self.tabBar.items?[4].titlePositionAdjustment = UIOffset(horizontal: 15.0 , vertical: 0.0)
        // change and adjust center icon by using image insets
        customBarItem.imageInsets = UIEdgeInsets(top:2, left: 0, bottom: -2, right: 0)
        viewController.tabBarItem = customBarItem
    }
    
    //table view delegate
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        //DispatchQueue.main.async {
        //apply spring animation
        let index = self.tabBar.items?.firstIndex(of: item)
        let subView = tabBar.subviews[index!+1].subviews.first as! UIImageView
        self.performSpringAnimation(imgView: subView)
        // }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if ((viewController is ProfilePageVC) || (viewController is TripsMessageVC) || (viewController is HostProgressVC) || (viewController is HostCalendarVC))
        {
            if((Utility.shared.getCurrentUserToken()) == nil || (Utility.shared.getCurrentUserToken()) == "")
            {
                let welcomeObj = WelcomePageVC()
                welcomeObj.modalPresentationStyle = .fullScreen
                self.present(welcomeObj, animated:false, completion: nil)
                //  appDelegate.setInitialViewController(initialView: welcomeObj)
            }
            
        }
    }
    
    //func to perform spring animation on imageview
    func performSpringAnimation(imgView: UIImageView) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            imgView.transform = CGAffineTransform.init(scaleX: 1.1, y: 1.1)
            //reducing the size
            UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                imgView.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            }) { (flag) in
            }
        }) { (flag) in
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
