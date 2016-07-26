//
//  NotifViewController.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/16.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit

class NotifViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var notifTableView: UITableView!
    @IBOutlet weak var notifTableFooter: UIView!
    var notifViewClasses: [NotifViewClass] = [
        NotifViewClass(notifTitle: "Bananny官方通知", notifDate: "2016/08/03", notifContent: "親愛的用戶你好，你的試用期已到。"),
        NotifViewClass(notifTitle: "預約通知", notifDate: "2016/08/03", notifContent: "王保姆 已經接受了你的預約，預約細節如下："),
        NotifViewClass(notifTitle: "評價通知", notifDate: "2016/08/02", notifContent: "張保姆 已經評價了你，請點選查看細節...")
    ]
    

    let customCellIdentifier = "NotifTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationBar setting
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green: 238/255, blue: 184/255, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor(red: 139/255, green: 133/255, blue: 101/255, alpha: 1)
        self.title = "通知"
        self.navigationController?.navigationBar.titleTextAttributes = ([NSFontAttributeName: UIFont(name: "PingFangTC-SemiBold", size: 18)!, NSForegroundColorAttributeName: UIColor(red: 138/255, green: 132/255, blue: 101/255, alpha: 1)])
        self.navigationController?.navigationBar.layer.shadowRadius = 2.0
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.18
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2)

        
        // tableview setting
        notifTableView.delegate = self
        notifTableView.dataSource = self
        notifTableView.estimatedRowHeight = 150
        notifTableView.rowHeight = UITableViewAutomaticDimension
        notifTableView.registerNib(UINib(nibName: "NotifTableViewCell", bundle: nil), forCellReuseIdentifier: customCellIdentifier)
        notifTableView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        notifTableFooter.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
    
    }
    
    override func viewWillAppear(animated: Bool) {
        if let index = notifTableView.indexPathForSelectedRow{
            notifTableView.deselectRowAtIndexPath(index, animated: false)
        }
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
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("NotifTableViewCell", forIndexPath: indexPath) as! NotifTableViewCell
        cell.notifCellTitleLabel.text = notifViewClasses[indexPath.row].notifTitle
        cell.notifCellDateLabel.text = notifViewClasses[indexPath.row].notifDate
        cell.notifCellContentLabel.text = notifViewClasses[indexPath.row].notifContent
    
        return cell
    
    }
    
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.separatorInset = UIEdgeInsetsZero
        cell.layoutMargins = UIEdgeInsetsZero
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            self.performSegueWithIdentifier("officialNotifSegue", sender: self)
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
        case 1:
            self.performSegueWithIdentifier("bookNotifSegue", sender: self)
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
        case 2:
            self.performSegueWithIdentifier("ratingNotifSegue", sender: self)
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
