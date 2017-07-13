//
//  BaseCell.swift
//  AppStore
//
//  Created by Amar Bhatia on 7/2/17.
//  Copyright © 2017 AmarBhatia. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
}
