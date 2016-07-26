//
//  RatingNotifViewController.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/19.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit

class RatingNotifViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var ratingNotifTableView: UITableView!
    @IBOutlet weak var ratingNotifFooter: UIView!
    let customCellIdentifier = "NotifTableViewCell"
    
    var ratingNotifs: [NotifViewClass] = [
        NotifViewClass(notifTitle: "張保姆評價了你", notifDate: "2016/08/03", notifContent: "張保姆在08/03評價了你，請點選查看細節..."),
        NotifViewClass(notifTitle: "請評價王保姆", notifDate: "2016/08/03", notifContent: "王保姆在08/02完成了托育，請點這裡評價..."),
        NotifViewClass(notifTitle: "郭保姆評價了你", notifDate: "2016/08/03", notifContent: "郭保姆在08/03評價了你，請點選查看細節..."),
        NotifViewClass(notifTitle: "李保姆評價了你", notifDate: "2016/08/02", notifContent: "李保姆在08/03評價了你，請點選查看細節...")
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "評價通知"
        
        //tableView
        ratingNotifTableView.delegate = self
        ratingNotifTableView.dataSource = self
        ratingNotifTableView.estimatedRowHeight = 150
        ratingNotifTableView.rowHeight = UITableViewAutomaticDimension
        ratingNotifTableView.registerNib(UINib(nibName: "NotifTableViewCell", bundle: nil), forCellReuseIdentifier: customCellIdentifier)
        ratingNotifTableView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        ratingNotifFooter.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)

        // Do any additional setup after loading the view.
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - tableview datasource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("NotifTableViewCell", forIndexPath: indexPath) as! NotifTableViewCell
        cell.notifCellTitleLabel.text = ratingNotifs[indexPath.row].notifTitle
        cell.notifCellDateLabel.text = ratingNotifs[indexPath.row].notifDate
        cell.notifCellContentLabel.text = ratingNotifs[indexPath.row].notifContent
        cell.newNotifButton.hidden = true
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.separatorInset = UIEdgeInsetsZero
        cell.layoutMargins = UIEdgeInsetsZero
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            self.performSegueWithIdentifier("otherRatingSegue", sender: self)
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
        case 1:
            self.performSegueWithIdentifier("ratingActionSegue", sender: self)
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
            
        default:
            break
        }
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
