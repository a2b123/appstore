//
//  AppDetailHeader.swift
//  AppStore
//
//  Created by Amar Bhatia on 7/8/17.
//  Copyright © 2017 AmarBhatia. All rights reserved.
//

import UIKit

class AppDetailHeader: BaseCell {
    
    var app: App? {
        didSet {
            if let imageName = app?.imageName {
                imageView.image = UIImage(named: imageName)
            }
            
            nameLabel.text = app?.name
            
            if let price = app?.price?.stringValue {
                buyButton.setTitle("$\(price)", for: .normal)
            }
        }
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "")
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 16
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Details", "Reviews", "Related"])
        sc.tintColor = UIColor.darkGray
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "NAME"
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    let buyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("BUY", for: .normal)
        button.layer.borderColor = UIColor(red: 0, green: 129/255, blue: 250/255, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(imageView)
        addSubview(segmentedControl)
        addSubview(nameLabel)
        addSubview(buyButton)
        addSubview(dividerLineView)
        
        addConstraintWithFormat(format: "H:|-14-[v0(100)]-8-[v1]|", views: imageView, nameLabel)
        addConstraintWithFormat(format: "V:|-14-[v0(100)]", views: imageView)
        addConstraintWithFormat(format: "V:|-14-[v0(20)]", views: nameLabel)
        
        
        
        addConstraintWithFormat(format: "H:|-40-[v0]-40-|", views: segmentedControl)
        addConstraintWithFormat(format: "V:[v0(34)]-8-|", views: segmentedControl)
        
        addConstraintWithFormat(format: "H:[v0(60)]-14-|", views: buyButton)
        addConstraintWithFormat(format: "V:[v0(32)]-56-|", views: buyButton)
        
        addConstraintWithFormat(format: "H:|[v0]|", views: dividerLineView)
        addConstraintWithFormat(format: "V:[v0(0.5)]|", views: dividerLineView)
        
        
        
    }
    
}


