//
//  ViewController.swift
//  GXBannerSample
//
//  Created by Gin on 2020/7/23.
//  Copyright © 2020 gin. All rights reserved.
//

import UIKit

let GXCellID = NSStringFromClass(GXBannerTestCell.classForCoder())

class ViewController: UIViewController {
    
    private var banner: GXBanner = {
        let width = UIScreen.main.bounds.size.width
        let frame: CGRect = CGRect(x: 0, y: 100, width: width, height: 120)
        return GXBanner(frame: frame, margin: 60, minScale: 0.8)
    }()
    
    private var banner1: GXBanner = {
        let width = UIScreen.main.bounds.size.width
        let frame: CGRect = CGRect(x: 0, y: 300, width: width, height: 120)
        return GXBanner(frame: frame, margin: 0, minScale: 1.0)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.banner)
        self.banner.backgroundColor = UIColor.green
        self.banner.autoTimeInterval = 2.0
        self.banner.dataSource = self
        self.banner.delegate = self
        self.banner.register(GXBannerTestCell.self, forCellWithReuseIdentifier: GXCellID)
        self.banner.reloadData()
        
        self.view.addSubview(self.banner1)
        self.banner1.backgroundColor = UIColor.purple
        self.banner1.autoTimeInterval = 2.0
        self.banner1.dataSource = self
        self.banner1.delegate = self
        self.banner1.register(GXBannerTestCell.self, forCellWithReuseIdentifier: GXCellID)
        self.banner1.reloadData()
    }
}

extension ViewController: GXBannerDataSource, GXBannerDelegate {
    func numberOfItems() -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: GXBannerTestCell = collectionView.dequeueReusableCell(withReuseIdentifier: GXCellID, for: indexPath) as! GXBannerTestCell
        cell.contentView.backgroundColor = UIColor.red
        cell.textLabel.text = String(indexPath.row)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
