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
    
    deinit {
        NSLog("ViewController deinit.")
    }
    
    private var banner: GXBanner = {
        let width = UIScreen.main.bounds.size.width
        let frame: CGRect = CGRect(x: 0, y: 100, width: width, height: 120)
        return GXBanner(frame: frame, margin: 60, minScale: GXBanner.Scale(sx: 0.9, sy: 0.7))
    }()
    
    private var banner1: GXBanner = {
        let width = UIScreen.main.bounds.size.width
        let frame: CGRect = CGRect(x: 0, y: 250, width: width, height: 120)
        return GXBanner(frame: frame, margin: 60, minScale: GXBanner.Scale(scale: 0.8))
    }()
    
    private var banner2: GXBanner = {
        let width = UIScreen.main.bounds.size.width
        let frame: CGRect = CGRect(x: 0, y: 400, width: width, height: 120)
        return GXBanner(frame: frame, margin: 0, lineSpacing: 10)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.banner)
        self.banner.backgroundColor = UIColor.green
        self.banner.autoTimeInterval = 2.0
        self.banner.dataSource = self
        self.banner.delegate = self
        self.banner.register(classCellType: GXBannerTestCell.self)
        self.banner.reloadData()
        
        self.view.addSubview(self.banner1)
        self.banner1.backgroundColor = UIColor.green
        self.banner1.autoTimeInterval = 2.0
        self.banner1.dataSource = self
        self.banner1.delegate = self
        self.banner1.register(classCellType: GXBannerTestCell.self)
        self.banner1.reloadData()
        
        self.view.addSubview(self.banner2)
        self.banner2.backgroundColor = UIColor.purple
        self.banner2.autoTimeInterval = 2.0
        self.banner2.dataSource = self
        self.banner2.delegate = self
        self.banner2.register(classCellType: GXBannerTestCell.self)
        self.banner2.reloadData()
    }
}

extension ViewController: GXBannerDataSource, GXBannerDelegate {
    
    // MARK: - GXBannerDataSource
    
    func numberOfItems() -> Int {
        return 3
    }
    
    func banner(_ banner: GXBanner, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: GXBannerTestCell = banner.dequeueReusableCell(for: indexPath)
        cell.contentView.layer.masksToBounds = true
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.backgroundColor = UIColor.red
        cell.iconIView.image = UIImage(named: String(format: "banner%d.jpeg", indexPath.row))
        cell.textLabel.text = String(indexPath.row)
        
        return cell
    }

    // MARK: - GXBannerDelegate

    func banner(_ banner: GXBanner, didSelectItemAt indexPath: IndexPath) {
        NSLog("didSelectItemAt %d", indexPath.row)
    }
}

