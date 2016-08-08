//
//  NavigationStripTabViewController.swift
//  BoxMail
//
//  Created by Raj Abishek on 08/08/16.
//  Copyright © 2016 Raj Abishek. All rights reserved.
//

import UIKit
import XLPagerTabStrip

public class NavigationStripTabViewController: ButtonBarPagerTabStripViewController {
    
    public override func viewDidLoad() {
        
        customizeTabBarStrip()
        
        setNaviagtionBarTitle()
        
        navigationController?.navigationBar.barStyle = .Black
        
        super.viewDidLoad()
    }
    
    func customizeTabBarStrip() {
        // change selected bar color
        settings.style.buttonBarBackgroundColor = Color.wildSand
        settings.style.buttonBarItemBackgroundColor = Color.wildSand
        settings.style.selectedBarBackgroundColor = Color.cardinalRed
        settings.style.buttonBarItemFont = UIFont(name: "FiraSans-Regular", size:12) ?? UIFont.systemFontOfSize(14)
        settings.style.selectedBarHeight = 2
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .blackColor()
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 175
        
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = Color.pureBlack
            newCell?.label.textColor = Color.pureBlack
        }
    }
    
    func setNaviagtionBarTitle() {
        
        let mainTitle = NSMutableAttributedString(string:"Inbox", attributes:[NSFontAttributeName: UIFont(name: "FiraSans-Regular", size:16) ?? UIFont.systemFontOfSize(16), NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        let subTitle = NSAttributedString(string:"\nrajabishek@hotmail.com", attributes:[NSFontAttributeName: UIFont(name: "FiraSans-Regular", size:12) ?? UIFont.systemFontOfSize(12), NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        mainTitle.appendAttributedString(subTitle)
        
        let mainLabel = UILabel(frame: CGRectMake(0, 0, 440, 44))
        mainLabel.attributedText = mainTitle
        mainLabel.numberOfLines = 0
        mainLabel.backgroundColor = UIColor.clearColor()
        mainLabel.textAlignment = .Center
        mainLabel.sizeToFit()
        
        self.navigationItem.titleView = mainLabel
    }
    
    public override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    public override func viewControllersForPagerTabStrip(pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let primaryEmailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("PrimaryEmailViewController") as! PrimaryEmailViewController
        
        let secondViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("SecondViewController") as! SecondViewController
        
        let thirdViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ThirdViewController") as! ThirdViewController
        
        return [primaryEmailViewController, secondViewController, thirdViewController]
        
    }
}
