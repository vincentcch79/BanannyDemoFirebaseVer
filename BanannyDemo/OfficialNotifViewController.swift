//
//  OfficialNotifViewController.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/19.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit

class OfficialNotifViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var officialNotifTableView: UITableView!
    @IBOutlet weak var officialNotifFooter: UIView!
    let customCellIdentifier = "NotifTableViewCell"
    
    var officialNotifs: [NotifViewClass] = [
    NotifViewClass(notifTitle: "Bananny歡迎你！", notifDate: "2016/08/03", notifContent: "恭喜你註冊為Bananny正式會員，感謝你的支持..."),
    NotifViewClass(notifTitle: "試用期快到了喔！", notifDate: "2016/08/03", notifContent: "親愛的會員你好，你的試用期將在一個月後到期。"),
    NotifViewClass(notifTitle: "想直接洽詢嗎？", notifDate: "2016/08/03", notifContent: "親愛的會員，如果想直接與我們聯繫，歡迎直接在線上諮詢喔"),
    NotifViewClass(notifTitle: "保母推薦", notifDate: "2016/08/02", notifContent: "你有認識很讚的保姆嗎？有想要推薦的優質保姆嗎？歡迎跟我們說。")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "官方通知"
        self.view.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        //tableView
        officialNotifTableView.delegate = self
        officialNotifTableView.dataSource = self
        officialNotifTableView.estimatedRowHeight = 150
        officialNotifTableView.rowHeight = UITableViewAutomaticDimension
        officialNotifTableView.registerNib(UINib(nibName: "NotifTableViewCell", bundle: nil), forCellReuseIdentifier: customCellIdentifier)
        officialNotifTableView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        
        officialNotifFooter.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
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
        cell.notifCellTitleLabel.text = officialNotifs[indexPath.row].notifTitle
        cell.notifCellDateLabel.text = officialNotifs[indexPath.row].notifDate
        cell.notifCellContentLabel.text = officialNotifs[indexPath.row].notifContent
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
            self.performSegueWithIdentifier("officialWelcomeSegue", sender: self)
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
