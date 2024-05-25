//
//  CancellationVC.swift
//  App
//
//  Created by RadicalStart on 17/05/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit

class CancellationVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var cancellationTable: UITableView!
    
    @IBOutlet weak var headerView: UIView!
    var cancellationArray = NSMutableArray()
     var isShowmoreClicked:Bool = false
    var cancelpolicy = String()
    var cancelpolicy_content = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "colorController")
        
//        cancellationTable.estimatedRowHeight = 200//you can provide any
//        cancellationTable.rowHeight = UITableView.automaticDimension
        cancellationTable.register(UINib(nibName: "CancellationCell", bundle: nil), forCellReuseIdentifier: "CancellationCell")
        cancellationTable.register(UINib(nibName: "CancellationPolicyCell1", bundle: nil), forCellReuseIdentifier: "CancellationPolicyCell1")
        cancellationTable.register(UINib(nibName: "ReadmoreCell", bundle: nil), forCellReuseIdentifier: "ReadmoreCell")
        if IS_IPHONE_5{
            
            cancellationTable.frame = CGRect(x: 0, y:0, width: FULLWIDTH+55, height:FULLHEIGHT+25)
        }

        
//        let shadowSize : CGFloat = 3.0
//        let shadowPath = UIBezierPath(rect: CGRect(x: -shadowSize / 2,
//                                                   y: -shadowSize / 2,
//                                                   width: self.headerView.frame.size.width+40 + shadowSize,
//                                                   height: self.headerView.frame.size.height + shadowSize))
//
//        self.headerView.layer.masksToBounds = false
//        self.headerView.layer.shadowColor = Theme.TextLightColor.cgColor
//        self.headerView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
//        self.headerView.layer.shadowOpacity = 0.3
//        self.headerView.layer.shadowPath = shadowPath.cgPath

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK:*************************************** TABLEVIEW DELEGATE & DATASOURCE METHODS *************************************>
    
      func numberOfSections(in tableView: UITableView) -> Int {
//        if(!isShowmoreClicked)
//        {
            return 5
//        }
//        else
//        {
//            return 2
//        }
//
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(isShowmoreClicked)
        {
        if(section == 0)
        {
            return 1
        }
        return 1
        }
        else
        {
        return 1
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 3){
            return 120
        }
        
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0)
        {
           let cell = tableView.dequeueReusableCell(withIdentifier: "CancellationCell", for: indexPath)as! CancellationCell
            
            cell.lblCancellationPolicy.text = "Cancellation policy is '\(cancelpolicy)' and you can  \(cancelpolicy_content)"
            // String variable containing the text.
                 let fullString = cell.lblCancellationPolicy.text

                 // Choose wwhat you want to be colored.
                 let coloredString = "'\(cancelpolicy)'"

                 // Get the range of the colored string.
            let rangeOfColoredString = (fullString as! NSString).range(of: coloredString)

                 // Create the attributedString.
            let attributedString = NSMutableAttributedString(string:fullString!)
            attributedString.setAttributes([NSAttributedString.Key.foregroundColor: Theme.PRIMARY_COLOR],
                                         range: rangeOfColoredString)
            cell.lblCancellationPolicy.attributedText = attributedString
            cell.lblExample.text = "\(cancelpolicy)"
           
            if(cancelpolicy == "Flexible") {
               
                cell.lblExampleDescription.text = "\((Utility.shared.getLanguage()?.value(forKey:"FlexibleDescription"))!)"
                cell.lblExampleDescription1.text = "\((Utility.shared.getLanguage()?.value(forKey:"FlexibleExample"))!)"
                
            }
            else if (cancelpolicy == "Moderate") {
                cell.lblExampleDescription.text = "\((Utility.shared.getLanguage()?.value(forKey:"ModerateDescription1"))!)"
                cell.lblExampleDescription1.text = "\((Utility.shared.getLanguage()?.value(forKey:"ModerateExample"))!)"
                
            }
            else if (cancelpolicy == "Strict") {
                cell.lblExampleDescription.text = "\((Utility.shared.getLanguage()?.value(forKey:"StrictDescription1"))!)"
                cell.lblExampleDescription1.text =  "\((Utility.shared.getLanguage()?.value(forKey:"StrictExample"))!)"
                          
            }
            
          
            
            
           
            cell.selectionStyle = .none
           // isShowmoreClicked = false
            return cell
        }
        else if (indexPath.section == 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CancellationPolicyCell1", for: indexPath)as! CancellationPolicyCell1
            if(cancelpolicy == "Flexible") {
               
                cell.lblTitle.text = "\((Utility.shared.getLanguage()?.value(forKey:"FlexibleDays"))!)"
                cell.lblDescription.text = "\((Utility.shared.getLanguage()?.value(forKey:"FlexiblebeforeDescription"))!)"
                cell.lblExample.text = "\((Utility.shared.getLanguage()?.value(forKey:"FlexiblebeforeExample"))!)"
            }
            else if (cancelpolicy == "Moderate") {
                cell.lblTitle.text = "\((Utility.shared.getLanguage()?.value(forKey:"ModerateDays"))!)"
                cell.lblDescription.text = "\((Utility.shared.getLanguage()?.value(forKey:"ModeratebeforeDescription"))!)"
                cell.lblExample.text = "\((Utility.shared.getLanguage()?.value(forKey:"moderatebeforeExample"))!)"
                
            }
            else if (cancelpolicy == "Strict") {
                cell.lblTitle.text = "\((Utility.shared.getLanguage()?.value(forKey:"StrictDays"))!)"
                cell.lblDescription.text = "\((Utility.shared.getLanguage()?.value(forKey:"StrictbeforeDescription"))!)"
                cell.lblExample.text = "\((Utility.shared.getLanguage()?.value(forKey:"StrictbeforeExample"))!)"
                          
            }
            
            
           
 //            cell.flexibleLabel.text = "\(cancelpolicy): \(cancelpolicy_content)"
             cell.selectionStyle = .none
            // isShowmoreClicked = false
             return cell
            
        }else if (indexPath.section == 2){
            let cell = tableView.dequeueReusableCell(withIdentifier: "CancellationPolicyCell1", for: indexPath)as! CancellationPolicyCell1
    //            cell.flexibleLabel.text = "\(cancelpolicy): \(cancelpolicy_content)"
             cell.selectionStyle = .none
            cell.lblTitle.text = "\((Utility.shared.getLanguage()?.value(forKey:"Checkin1"))!)"
            if(cancelpolicy == "Flexible") {
               
               
                cell.lblDescription.text = "\((Utility.shared.getLanguage()?.value(forKey:"Flexiblecheckindescription"))!)"
                cell.lblExample.text = "\((Utility.shared.getLanguage()?.value(forKey:"FlexiblecheckinExample"))!)"
            }
            else if (cancelpolicy == "Moderate") {
             
                cell.lblDescription.text = "\((Utility.shared.getLanguage()?.value(forKey:"Moderatecheckindescription"))!)"
                cell.lblExample.text = "\((Utility.shared.getLanguage()?.value(forKey:"ModeratecheckinExample"))!)"
                
            }
            else if (cancelpolicy == "Strict") {
              
                cell.lblDescription.text = "\((Utility.shared.getLanguage()?.value(forKey:"Strictcheckindescription"))!)"
                cell.lblExample.text = "\((Utility.shared.getLanguage()?.value(forKey:"StrictcheckinExample"))!)"
                          
            }
            
            // isShowmoreClicked = false
            return cell

        }else if (indexPath.section == 3){
            let cell = tableView.dequeueReusableCell(withIdentifier: "CancellationPolicyCell1", for: indexPath)as! CancellationPolicyCell1
    //            cell.flexibleLabel.text = "\(cancelpolicy): \(cancelpolicy_content)"
             cell.selectionStyle = .none
            cell.lblTitle.text = "\(Utility.shared.getLanguage()?.value(forKey:"Checkout1") ?? "Check out:")"
            cell.lblExample.isHidden = true
            if(cancelpolicy == "Flexible") {
               
                cell.lblDescription.text = "\((Utility.shared.getLanguage()?.value(forKey:"Flexiblecheckout"))!)"
                cell.lblExample.text = "\((Utility.shared.getLanguage()?.value(forKey:"CancelpolicyExample"))!)"
            }
            else if (cancelpolicy == "Moderate") {
             
                cell.lblDescription.text = "\((Utility.shared.getLanguage()?.value(forKey:"Moderatecheckout"))!)"
                cell.lblExample.text = "\((Utility.shared.getLanguage()?.value(forKey:"CancelpolicyExample"))!)"
                
            }
            else if (cancelpolicy == "Strict") {
              
                cell.lblDescription.text = "\((Utility.shared.getLanguage()?.value(forKey:"Strictcheckout"))!)"
                cell.lblExample.text = "\((Utility.shared.getLanguage()?.value(forKey:"CancelpolicyExample"))!)"
                          
            }
            
            // isShowmoreClicked = false
            return cell

        }else{
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReadmoreCell", for: indexPath)as! ReadmoreCell
            let description = String(format:"\((Utility.shared.getLanguage()?.value(forKey:"cleaningdescription"))!)",appName,appName,appName,appName,appName)
            
            cell.descriptionLabel?.attributedText = NSAttributedString(string:description,
                                                                       attributes: [NSAttributedString.Key.foregroundColor:UIColor(named: "searchPlaces_TextColor")!])
        //cell.descriptionLabel.frame = CGRect(x: 50, y: 0, width: FULLWIDTH-20, height:1500)
       // cell.descriptionLabel.textColor = Theme.TextDarkColor
        cell.descriptionLabel.numberOfLines = 0
        cell.selectionStyle = .none
        return cell
        }

        
    }
    
    func add(stringList: [String],
             font: UIFont,
             bullet: String = "\u{2022}",
             indentation: CGFloat = 20,
             lineSpacing: CGFloat = 2,
             paragraphSpacing: CGFloat = 12,
             textColor: UIColor = .gray,
             bulletColor: UIColor =  UIColor(named: "Title_Header")!) -> NSAttributedString {
        
        let textAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: textColor]
        let bulletAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: bulletColor]
        
        let paragraphStyle = NSMutableParagraphStyle()
        let nonOptions = [NSTextTab.OptionKey: Any]()
        paragraphStyle.tabStops = [
            NSTextTab(textAlignment: .left, location: indentation, options: nonOptions)]
        paragraphStyle.defaultTabInterval = indentation
        //paragraphStyle.firstLineHeadIndent = 0
        //paragraphStyle.headIndent = 20
        //paragraphStyle.tailIndent = 1
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.paragraphSpacing = paragraphSpacing
        paragraphStyle.headIndent = indentation
        
        let bulletList = NSMutableAttributedString()
        for string in stringList {
            let formattedString = "\(bullet)\t\(string)\n"
            let attributedString = NSMutableAttributedString(string: formattedString)
            
            attributedString.addAttributes(
                [NSAttributedString.Key.paragraphStyle : paragraphStyle],
                range: NSMakeRange(0, attributedString.length))
            
            attributedString.addAttributes(
                textAttributes,
                range: NSMakeRange(0, attributedString.length))
            
            let string:NSString = NSString(string: formattedString)
            let rangeForBullet:NSRange = string.range(of: bullet)
            attributedString.addAttributes(bulletAttributes, range: rangeForBullet)
            bulletList.append(attributedString)
        }
        
        return bulletList
    }

    
    @objc func addBtnTapped(_ sender: UIButton){
        let btnsendtag: UIButton = sender
        btnsendtag.setTitle("", for: .normal)
        isShowmoreClicked = true
        cancellationTable.reloadData()
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

