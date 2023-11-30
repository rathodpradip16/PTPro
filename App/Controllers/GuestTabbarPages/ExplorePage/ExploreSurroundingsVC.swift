//
//  ExploreSurroundingsVC.swift
//  App
//
//  Created by Phycom Mac Pro on 26/11/23.
//  Copyright © 2023 RADICAL START. All rights reserved.
//

import UIKit
import WebKit

class ExploreSurroundingsVC: UIViewController {
    
    @IBOutlet var webView: WKWebView!

    var strCity = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.loadHTMLString("<html>\n" +
                                "<head>\n" +
                                "    <script async defer src=\"https://widget.getyourguide.com/dist/pa.umd.production.min.js\" data-gyg-partner-id=\"YLJCUN5\"></script>\n" +
                                "</head>\n" +
                                "<body>\n" +
                                "<div data-gyg-href=\"https://widget.getyourguide.com/default/activities.frame\" data-gyg-locale-code=\"en-US\" data-gyg-widget=\"activities\" data-gyg-number-of-items=\"200\" data-gyg-partner-id=\"YLJCUN5\" data-gyg-q=\"\(strCity)\"></div>\n" +
                                "</body>\n" +
                                "</html>\n", baseURL: nil)

    }

    @IBAction func onClickBack(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
