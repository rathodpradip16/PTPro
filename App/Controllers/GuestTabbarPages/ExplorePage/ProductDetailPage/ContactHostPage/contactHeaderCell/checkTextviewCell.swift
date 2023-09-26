//
//  checkTextviewCell.swift
//  App
//
//  Created by RadicalStart on 17/05/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit
protocol checkTextviewCellDelegate: AnyObject {
    func didChangeText(text: String?, cell: checkTextviewCell)
}

class checkTextviewCell: UITableViewCell,UITextViewDelegate {

    
    @IBOutlet weak var messageLabel: UILabel!
    weak var delegate: checkTextviewCellDelegate?
    var placeholderLabel : UILabel!
    @IBOutlet weak var checkTxtview: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        checkTxtview.delegate = self
        checkTxtview.isEditable = true
        checkTxtview.text = ""
        checkTxtview.isScrollEnabled = true
        checkTxtview.autocorrectionType = UITextAutocorrectionType.no
        
        //checkTxtview.contentInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        
        checkTxtview.font = UIFont(name: APP_FONT, size: 14)
        placeholderLabel = UILabel()
        placeholderLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"yourmessage"))!)"
        placeholderLabel.font = checkTxtview.font
        placeholderLabel.numberOfLines = 0
       // placeholderLabel.sizeToFit()
        checkTxtview.addSubview(placeholderLabel)
        placeholderLabel.frame = CGRect(x:5, y: 0, width:FULLWIDTH-20, height:30)
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.isHidden = !checkTxtview.text.isEmpty
        messageLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"tellhost"))!)"
        messageLabel.textColor =  UIColor(named: "Title_Header")
        
        
        checkTxtview.layer.borderColor = UIColor(named: "text_borderColor")?.cgColor
        checkTxtview.layer.borderWidth = 1.0
        checkTxtview.layer.cornerRadius = 5.0
        checkTxtview.layer.masksToBounds = true
        
        checkTxtview.textColor = UIColor(named: "Title_Header")
        messageLabel.font = UIFont(name: APP_FONT_SEMIBOLD, size: 14)
        if(Utility.shared.isRTLLanguage()) {
            checkTxtview.textAlignment = .right
        }
        // Initialization code
    }
    
    
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
        delegate?.didChangeText(text: textView.text, cell: self)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(!Utility.shared.checkEmptyWithString(value:textView.text!)) {
          
            
        }

        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
       // IQKeyboardManager.shared.enable = true
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
