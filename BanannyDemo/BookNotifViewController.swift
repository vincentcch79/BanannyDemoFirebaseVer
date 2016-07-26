//
//  BookNotifViewController.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/19.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit

class BookNotifViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var bookNotifTableView: UITableView!
    @IBOutlet weak var bookNotifFooter: UIView!
    
    var bookNotifs:[NotifViewClass] = [
        NotifViewClass(notifTitle: "預約完成！請付款", notifDate: "2016/08/03", notifContent: "你好，你的預約已完成，請按這邊完成付款手續。"),
        NotifViewClass(notifTitle: "王保姆接受了預約", notifDate: "2016/08/03", notifContent: "你的預約已在20:00被王保姆接受！點選查看細節..."),
        NotifViewClass(notifTitle: "預約送出！等待回覆中", notifDate: "2016/08/03", notifContent: "你好！你的預約已送出，等待王保姆回覆中..."),
        NotifViewClass(notifTitle: "郭保姆婉拒了你的預約", notifDate: "2016/08/02", notifContent: "你好，郭保姆婉拒了你的預約，歡迎你繼續使用我們的平台找更多優質的保姆喔。")
    ]

    
    let customCellIdentifier = "NotifTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "預約通知"
        
        //tableView
        bookNotifTableView.delegate = self
        bookNotifTableView.dataSource = self
        bookNotifTableView.estimatedRowHeight = 150
        bookNotifTableView.rowHeight = UITableViewAutomaticDimension
        bookNotifTableView.registerNib(UINib(nibName: "NotifTableViewCell", bundle: nil), forCellReuseIdentifier: customCellIdentifier)
        bookNotifTableView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        bookNotifFooter.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        
        // Do any additional setup after loading the view.
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - tableView
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("NotifTableViewCell", forIndexPath: indexPath) as! NotifTableViewCell
        cell.notifCellTitleLabel.text = bookNotifs[indexPath.row].notifTitle
        cell.notifCellDateLabel.text = bookNotifs[indexPath.row].notifDate
        cell.notifCellContentLabel.text = bookNotifs[indexPath.row].notifContent
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
            self.performSegueWithIdentifier("bookDetailConfirmSegue", sender: self)
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
