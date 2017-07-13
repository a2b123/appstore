//
//  SearchController.swift
//  AppStore
//
//  Created by Amar Bhatia on 7/7/17.
//  Copyright © 2017 AmarBhatia. All rights reserved.
//

import UIKit

class SearchController: UIViewController, UISearchBarDelegate, UISearchDisplayDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"
    let trending = ["twitter", "instagram", "snapchat", "facebook", "ballz", "games", "airbnb", "amazon", "uber"]
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.showsCancelButton = false
        searchBar.placeholder = "Search"
        searchBar.searchBarStyle = UISearchBarStyle.minimal
        searchBar.tintColor = UIColor(netHex: 0x96969b)
        searchBar.delegate = self
        return searchBar
    }()
    
    let trendingLabel: UILabel = {
        let label = UILabel()
        label.text = "Trending"
        label.font = .systemFont(ofSize: 22)
        return label
    }()

    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    func setupViews() {
        view.addSubview(trendingLabel)
        view.addSubview(collectionView)
        
        view.addConstraintWithFormat(format: "H:[v0(100)]", views: trendingLabel)
        view.addConstraintWithFormat(format: "H:|-30-[v0]-30-|", views: collectionView)

        view.addConstraintWithFormat(format: "V:|-80-[v0]-10-[v1]-30-|", views: trendingLabel,collectionView)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        collectionView.register(SearchCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceVertical = true


        
        view.backgroundColor = .white
        
        
        navigationItem.titleView = searchBar
        self.title = "Search"
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trending.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchCell
        cell.appButton.setTitle(trending[indexPath.item], for: UIControlState())
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 30)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text!)
    }

    
}

class SearchCell: BaseCell {
    
    let appButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("hello", for: UIControlState())
        button.tintColor = .blue
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(appButton)
        addConstraintWithFormat(format: "H:|[v0]|", views: appButton)
        addConstraintWithFormat(format: "V:|[v0]|", views: appButton)
        
//        addConstraintWithFormat(format: "H:[v0(30)]", views: appButton)
//        addConstraintWithFormat(format: "V:[v0(30)]", views: appButton)
//        
//        addConstraint(NSLayoutConstraint(item: appButton, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
}
