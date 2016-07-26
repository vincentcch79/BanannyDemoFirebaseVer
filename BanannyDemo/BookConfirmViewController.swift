//
//  BookConfirmViewController.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/19.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit

class BookConfirmViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var confirmTableFooter: UIView!
    @IBOutlet weak var blurView: UIView!
    @IBOutlet weak var confirmTableView: UITableView!
    @IBOutlet weak var confirmButtonOutlet: UIButton!
    
    let customCellIdentifier = "ConfirmTableViewCell"
    
    var confirmDetail:[paymentClass] = [
    paymentClass(paymentTitle: "托育日期", paymentContent: "6月7日"),
    paymentClass(paymentTitle: "托育時間", paymentContent: "14:00 - 19:00(5hr)"),
    paymentClass(paymentTitle: "每小時收費", paymentContent: "500/hr"),
    paymentClass(paymentTitle: "總金額", paymentContent: "$2500"),
    paymentClass(paymentTitle: "托育地址", paymentContent: "新北市淡水區中正東路二段100巷3號"),
    paymentClass(paymentTitle: "備註", paymentContent: "我家小孩很愛流口水")
    ]
    
    var confirmImageView = ["icon_details_01", "icon_details_02", "icon_details_02", "icon_details_03", "icon_details_04", "icon_details_05"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = "預約確認"
        self.view.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        //confirmTableView
        confirmTableView.delegate = self
        confirmTableView.dataSource = self
        confirmTableView.estimatedRowHeight = 80
        confirmTableView.rowHeight = UITableViewAutomaticDimension
        confirmTableView.registerNib(UINib(nibName: "ConfirmTableViewCell", bundle: nil), forCellReuseIdentifier: customCellIdentifier)
        confirmTableView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        confirmTableFooter.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        //ui setting
        confirmButtonOutlet.backgroundColor = UIColor(red: 99/255, green: 108/255, blue: 163/255, alpha: 1)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - confrimTableView datasource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ConfirmTableViewCell", forIndexPath: indexPath) as! ConfirmTableViewCell
        
        cell.confirmTitle.text = confirmDetail[indexPath.row].paymentTitle
        cell.confirmContent.text = confirmDetail[indexPath.row].paymentContent
        cell.confirmImage.image = UIImage(named: confirmImageView[indexPath.row])
        
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
    @IBAction func bookButton(sender: AnyObject) {
        
        self.blurView.hidden = false
        let alertView = NSBundle.mainBundle().loadNibNamed("ConfirmAlertView", owner: nil, options: nil).first as! ConfirmAlertView
        alertView.frame.size = CGSize(width: 300, height: 250)
        alertView.center = CGPoint(x: UIScreen.mainScreen().bounds.midX, y: UIScreen.mainScreen().bounds.height * 0.4)
        self.view.addSubview(alertView)
        
        alertView.setActionHandler("cancel") { () -> Void in
            self.blurView.hidden = true
            alertView.removeFromSuperview()
        }
        alertView.setActionHandler("OK") { () -> Void in
            alertView.removeFromSuperview()
            let secondAlertView = NSBundle.mainBundle().loadNibNamed("ConfirmMsgView", owner: nil, options: nil).first as! ConfirmMsgView
            secondAlertView.frame.size = CGSize(width: 300, height: 380)
            secondAlertView.center = CGPoint(x: UIScreen.mainScreen().bounds.midX, y: UIScreen.mainScreen().bounds.height * 0.4)
            self.view.addSubview(secondAlertView)
            
            secondAlertView.setActionHandler("secondConfirm") { () -> Void in
                self.blurView.hidden = true
                secondAlertView.removeFromSuperview()
//                let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                let DashTabBarViewController: UIViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("DashTabBar")
//                self.presentViewController(DashTabBarViewController, animated: true, completion: nil)
                self.navigationController?.popToRootViewControllerAnimated(true)
            }
            
        }

    }

}
