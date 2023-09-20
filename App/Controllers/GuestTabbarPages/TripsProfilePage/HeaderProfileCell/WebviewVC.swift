//
//  WebviewVC.swift
//  App
//
//  Created by RadicalStart on 17/06/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit
import WebKit
import Lottie
import Apollo

protocol WebviewVCDelegate {
    func setPayoutCall(accountid:String)
    func onSuccessPayPalPayment(isSuccess: Bool, toastermsg: String, successURL: URL?)
}

class WebviewVC: UIViewController,WKNavigationDelegate {
    @IBOutlet var lblContent: UILabel!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var backBtn:UIButton!
    var webview = WKWebView()
    @IBOutlet var scrollView: UIScrollView!
    var lottieView: LottieAnimationView!
    var webstring = String()
    var succesURL = String()
    var failureURL = String()
    var preferences = WKPreferences()
    var delegate:WebviewVCDelegate!
    var accountID = String()
    var isFromStaticContent : Bool = false
    @IBOutlet weak var pageTitleLabel: UILabel!
    var pageTitle = ""
    var isForPayPal: Bool = false
    var id:Int = 0
    var staticContentArray = [GetStaticPageContentQuery.Data.GetStaticPageContent.Result]()
    
    @IBOutlet var textContent: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor =   UIColor(named: "colorController")
        scrollView.showsVerticalScrollIndicator = false
        lottieView = LottieAnimationView.init(name:"animation")
        if IS_IPHONE_XR
        {
            webview.frame = CGRect(x: 0, y:(self.topView.frame.maxY+(UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20.0)), width: FULLWIDTH, height: FULLHEIGHT-60)
        }
        else{
            webview.frame = CGRect(x: 0, y:(self.topView.frame.maxY+(UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20.0)), width: FULLWIDTH, height: FULLHEIGHT-60)
        }
        
        if(!isFromStaticContent) {
            scrollView.isHidden = true
            self.view.addSubview(webview)
        }
        else {
            scrollView.isHidden = false
            scrollView.showsVerticalScrollIndicator = false
            scrollView.showsHorizontalScrollIndicator = false
            self.staticContentAPICall()
        }
        
        self.backBtn.setImage(UIImage(named: "left_arrow"), for: .normal)
        self.backBtn.setTitle("", for: .normal)
        self.backBtn.backgroundColor = Theme.ButtonBack_BG
        self.backBtn.layer.cornerRadius = self.backBtn.frame.size.height/2
        self.backBtn.clipsToBounds = true
        
        if(Utility.shared.isRTLLanguage()) {
            backBtn.imageView?.performRTLTransform()
        }
        
        self.pageTitleLabel.text = pageTitle
        self.pageTitleLabel.textColor = UIColor(named: "Title_Header")
        self.pageTitleLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        self.pageTitleLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 18)
        
        // Do any additional setup after loading the view.
    }
    func lottieAnimation(){
        
        lottieView = LottieAnimationView.init(name:"animation")
        lottieView.isHidden = false
        self.lottieView.frame = CGRect(x:FULLWIDTH/2-40, y:FULLHEIGHT/2-150, width:100, height:100)
        self.webview.addSubview(self.lottieView)
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
    @IBAction func backBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
        if self.isForPayPal{
            delegate.onSuccessPayPalPayment(isSuccess: false, toastermsg: "\(Utility.shared.getLanguage()?.value(forKey: "User_Cancelled") ?? "User Cancelled")", successURL: nil)
        }
    }
    func webviewRedirection(webviewString:String)
    {
        webview.navigationDelegate = self
        let url = URL (string: webviewString)
        let requestObj = URLRequest(url: url!)
        preferences = WKPreferences()
        preferences.javaScriptEnabled = false
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        self.webview.load(requestObj)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!)
    {
        self.lottieAnimation()
    }// show indicator
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!)
    {
        //preferences.javaScriptEnabled = true
        // Create a configuration for the preferences
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        let removeElementIdScript = "javascript:(function() { " + "document.getElementsByClassName('rentAllHeader')[0].style.display='none';})()"
        webView.evaluateJavaScript(removeElementIdScript) { (response, error) in
            debugPrint("Am here")
            
        }
        
        let elementID = "intercom-container"
        let removeElementIdScript1 = "var element = document.getElementById('\(elementID)'); element.parentElement.removeChild(element);"
        webView.evaluateJavaScript(removeElementIdScript1) { (response, error) in
            debugPrint("Am here")
        }
        
        lottieView.isHidden = true
        
        
    }
    func webView(
        _ webView: WKWebView,
        decidePolicyFor navigationAction: WKNavigationAction,
        decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            
            print("pradee \(navigationAction.request.url)")
            
            guard let url = navigationAction.request.url else {
                decisionHandler(.allow)
                return
            }
            
            if self.isForPayPal{
                if url.absoluteString.contains("/success?"){
                    decisionHandler(.cancel)
                    self.dismiss(animated: true, completion: nil)
                    delegate.onSuccessPayPalPayment(isSuccess: true,toastermsg: "", successURL: url.absoluteURL)
                }else if url.absoluteString.contains("/cancel"){
                    decisionHandler(.cancel)
                    self.dismiss(animated: true, completion: nil)
                    delegate.onSuccessPayPalPayment(isSuccess: false,toastermsg: "\(Utility.shared.getLanguage()?.value(forKey: "somethingwrong") ?? "Something went wrong")", successURL: nil)
                }else{
                    decisionHandler(.allow)
                }
            }else{
                let Cur_URL = URL(fileURLWithPath: succesURL)
                
                
                //now u and ur server team can decide on what url will they redirect and what will be url string on login success
                //lets say u and ur server team decides url to be https://some_base_url/login/success
                
                if url.absoluteString.contains("/payout/success") {
                    // this means login successful
                    decisionHandler(.cancel)
                    let accountIDVal = self.getQueryStringParameter(url:succesURL, param: "account")
                    
                    delegate?.setPayoutCall(accountid:accountIDVal!)
                    _ = self.dismiss(animated: true, completion: nil)
                }
                else if url.absoluteString.contains("/payout/failure"){
                    
                    decisionHandler(.cancel)
                    
                    let alert = UIAlertController(title: "Oops", message: "\((Utility.shared.getLanguage()?.value(forKey:"stripe_connection_failed"))!)", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                        let accountIDVal = self.getQueryStringParameter(url:self.failureURL, param: "account")
                        let payoutObj = PayoutPreferenceVC()
                        Utility.shared.isfrom_payoutcurrency = true
                        payoutObj.modalPresentationStyle = .fullScreen
                        self.present(payoutObj, animated: true, completion: nil)
                        //                        self.delegate?.setPayoutCall(accountid:accountIDVal!)
                        //                         _ = self.dismiss(animated: true, completion: nil)
                    }))
                    self.present(alert, animated: true) {
                        // self.LottieAnimationView.stop()
                    }
                    
                    
                }
                else {
                    if navigationAction.navigationType == .linkActivated {
                        guard let url = navigationAction.request.url else {return}
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                    decisionHandler(.allow)
                    //                self.view.makeToast("Connecting your bank account with the platform verification is failed")
                    //
                    //                let payoutObj = PayoutPreferenceVC()
                    //                                                                   Utility.shared.isfrom_payoutcurrency = true
                    //                                                                    payoutObj.modalPresentationStyle = .fullScreen
                    //                                                                   self.present(payoutObj, animated: true, completion: nil)
                    
                }
            }
        }
    
    func getQueryStringParameter(url: String, param: String) -> String? {
        guard let url = URLComponents(string: url) else { return nil }
        return url.queryItems?.first(where: { $0.name == param })?.value
    }
    
    
    func staticContentAPICall()
    {
        if Utility.shared.isConnectedToNetwork(){
            let staticContentQuery = GetStaticPageContentQuery(id: .some(self.id))
            Network.shared.apollo_headerClient.fetch(query:staticContentQuery,cachePolicy: .fetchIgnoringCacheData){ [self] response in
                switch response {
                case .success(let result):
                    if let data = result.data?.getStaticPageContent?.status,data == 200 {
                        //                    self.staticContentArray = result.data?.getStaticPageContent?.result as! [GetStaticPageContentQuery.Data.GetStaticPageContent.Result]
                        let content = result.data?.getStaticPageContent?.result?.content
                        print(content?.htmlToAttributedString ?? "")
                        textContent.attributedText = content?.htmlToAttributedString
                        textContent.font = UIFont(name: APP_FONT, size: 15)
                        textContent.textColor = UIColor(named: "searchPlaces_TextColor")
                        textContent.showsVerticalScrollIndicator = false
                        textContent.showsHorizontalScrollIndicator = false
                        
                    } else {
                        self.view.makeToast(result.data?.getStaticPageContent?.errorMessage!)
                    }
                case .failure(let error):
                    self.view.makeToast(error.localizedDescription)
                }
            }
            
            //  let siteSettingsquery = siteSe
            
        }
    }
    
}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
