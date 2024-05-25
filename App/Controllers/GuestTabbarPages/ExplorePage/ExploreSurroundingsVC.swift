//
//  ExploreSurroundingsVC.swift
//  App
//
//  Created by Phycom Mac Pro on 26/11/23.
//  Copyright © 2023 RADICAL START. All rights reserved.
//

import UIKit
import WebKit

class ExploreSurroundingsVC: UIViewController,WKNavigationDelegate, WKUIDelegate, UIScrollViewDelegate {
    
    @IBOutlet var webView: WKWebView!

    var strCity = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.loadHTMLString("<html>\n" +
                               "<head>\n" +
                               "<script async defer src=\"https://widget.getyourguide.com/dist/pa.umd.production.min.js\" data-gyg-partner-id=\"\(dataPartnerId)\"></script>\n" +
                               "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, initial-scale=1.0\">\n" +
                               "</head>\n" +
                               "<body>\n" +
                               "<div data-gyg-href=\"https://widget.getyourguide.com/default/activities.frame\" data-gyg-locale-code=\"en-US\" data-gyg-widget=\"activities\" data-gyg-number-of-items=\"200\" data-gyg-partner-id=\"\(dataPartnerId)\" data-gyg-q=\"\(strCity)\"></div>\n" +
                               "</body>\n" +
                               "</html>\n", baseURL: nil)
            
        webView.navigationDelegate = self
        webView.uiDelegate = self
        
        webView.scrollView.delegate = self; // set delegate method of UISrollView

    }

    @IBAction func onClickBack(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (_: WKNavigationActionPolicy) -> Void) {
      if navigationAction.navigationType == .linkActivated,
        let reqURL = navigationAction.request.url {
        UIApplication.shared.open(reqURL, options: [:], completionHandler: nil)
        decisionHandler(.cancel)

      } else {
        decisionHandler(.allow)
      }
    }
    

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.scrollView.maximumZoomScale = 1; // set as you want.
        webView.scrollView.minimumZoomScale = 1; // set as you want.
    }
}
