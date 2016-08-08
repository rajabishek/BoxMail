//
//  ThirdViewController.swift
//  BoxMail
//
//  Created by Raj Abishek on 08/08/16.
//  Copyright © 2016 Raj Abishek. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ThirdViewController: UIViewController, IndicatorInfoProvider {
    
    var itemInfo = IndicatorInfo(title: "Third")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(itemInfo: IndicatorInfo) {
        self.itemInfo = itemInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func indicatorInfoForPagerTabStrip(pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}