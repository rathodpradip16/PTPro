//
//  ViewAddMoreBed.swift
//  App
//
//  Created by Phycom on 22/10/24.
//  Copyright © 2024 RADICAL START. All rights reserved.
//

import UIKit

import UIKit

class ViewAddMoreBed: UIView {

    @IBOutlet weak var btnAddBed: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    
    // Required initializer for loading from .xib
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    private func commonInit() {
        // Load the view from the .xib file
        let nib = UINib(nibName: "ViewAddMoreBed", bundle: Bundle.main)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = self.bounds
        addSubview(view)
    }
}
