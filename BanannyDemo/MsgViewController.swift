//
//  MsgViewController.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/20.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit

class MsgViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var msgTableView: UITableView!
    @IBOutlet weak var msgTableFooter: UIView!
    
    let customCellIdentifier = "MsgCustomTableViewCell"
    
    var msgCustomCells: [MsgViewClass] = [
        MsgViewClass(msgImage: "bananny_msg_profilepic", msgTitle: "Bananny官方訊息", msgDate: "2016/08/03", msgContent: "你好請幫我克服這個問題，我看不到這個保姆的資料..."),
        MsgViewClass(msgImage: "nanny_profile_01", msgTitle: "王彩霞 保母", msgDate: "2016/08/03", msgContent: "你好，我想請問你的托育經驗..."),
        MsgViewClass(msgImage: "nanny_profile_02", msgTitle: "郭虹惟 保母", msgDate: "2016/07/02", msgContent: "你好，我家小孩有一些比較需要注意的狀況..."),
        MsgViewClass(msgImage: "nanny_profile_03", msgTitle: "周麗利 保母", msgDate: "2016/06/25", msgContent: "請問上次溝通的時間還可以嗎？ ...")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        //navigationBar setting
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green: 238/255, blue: 184/255, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor(red: 139/255, green: 133/255, blue: 101/255, alpha: 1)
        self.title = "訊息"
        self.navigationController?.navigationBar.titleTextAttributes = ([NSFontAttributeName: UIFont(name: "PingFangTC-SemiBold", size: 18)!, NSForegroundColorAttributeName: UIColor(red: 138/255, green: 132/255, blue: 101/255, alpha: 1)])
        self.navigationController?.navigationBar.layer.shadowRadius = 2.0
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.18
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2)
        // tableview setting
        msgTableView.delegate = self
        msgTableView.dataSource = self
        msgTableView.estimatedRowHeight = 96
        msgTableView.rowHeight = UITableViewAutomaticDimension
        msgTableView.registerNib(UINib(nibName: "MsgCustomTableViewCell", bundle: nil), forCellReuseIdentifier: customCellIdentifier)
        msgTableView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        msgTableFooter.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        if let index = msgTableView.indexPathForSelectedRow{
            msgTableView.deselectRowAtIndexPath(index, animated: false)
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
        return msgCustomCells.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MsgCustomTableViewCell", forIndexPath: indexPath) as! MsgCustomTableViewCell
        cell.msgImageView.image = UIImage(named: msgCustomCells[indexPath.row].msgImage)
        cell.msgTitleLabel.text = msgCustomCells[indexPath.row].msgTitle
        cell.msgDateLabel.text = msgCustomCells[indexPath.row].msgDate
        cell.msgContentLabel.text = msgCustomCells[indexPath.row].msgContent
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.separatorInset = UIEdgeInsetsZero
        cell.layoutMargins = UIEdgeInsetsZero
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
