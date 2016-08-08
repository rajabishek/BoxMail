//
//  PrimaryEmailViewController.swift
//  BoxMail
//
//  Created by Raj Abishek on 08/08/16.
//  Copyright © 2016 Raj Abishek. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import Fakery

class PrimaryEmailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, IndicatorInfoProvider {
    
    @IBOutlet weak var tableView: UITableView!
    
    var itemInfo = IndicatorInfo(title: "Primary")
    
    var emails = [Email]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
        loadEmailData()
    }
    
    func configureTableView() {
        
        //Sets the color of the seperator lines between the table view cells
        tableView.separatorColor = Color.wildSand
        
        //Don't show the lines for empty table cells
        tableView.tableFooterView = UIView(frame: CGRectZero)
    }
    
    func loadEmailData() {
        
        let faker = Faker(locale: "en")
        
        //Adds fake email data
        for i in 1...10 {
            
            //Show the first 2 emails as unread
            let read = (i == 1 || i == 2) ? false : true
            
            let person = Contact(name: faker.name.name(), emailAddress: faker.internet.safeEmail(), profileImageName: i)
            let email = Email(from: person, subject: faker.lorem.sentence(wordsAmount: 4), message: faker.lorem.paragraph(sentencesAmount: 2), time: NSDate(), read: read)
            
            emails.append(email)
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func indicatorInfoForPagerTabStrip(pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emails.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PrimaryEmailCell", forIndexPath: indexPath) as! PrimaryEmailTableViewCell
        
        cell.email = emails[indexPath.row]
        return cell
    }
}
