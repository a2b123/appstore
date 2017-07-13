//
//  AppDetailDescriptionCell.swift
//  AppStore
//
//  Created by Amar Bhatia on 7/8/17.
//  Copyright © 2017 AmarBhatia. All rights reserved.
//

import UIKit

class AppDetailDescriptionCell: BaseCell {
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.text = "SAMPLE DESCRIPTION"
        return tv
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        return view
    }()
    
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(textView)
        addSubview(dividerLineView)
        addConstraintWithFormat(format: "H:|-8-[v0]-8-|", views: textView)
        addConstraintWithFormat(format: "H:|-14-[v0]|", views: dividerLineView)
        addConstraintWithFormat(format: "V:|-4-[v0]-4-[v1(1)]|", views: textView, dividerLineView)
        
        
        
    }
}

