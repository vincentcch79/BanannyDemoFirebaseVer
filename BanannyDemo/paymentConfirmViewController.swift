//
//  paymentConfirmViewController.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/20.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit

class paymentConfirmViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var paymentTableHeader: UIView!
    @IBOutlet weak var paymentTableView: UITableView!
    @IBOutlet weak var paymentButton: UIButton!
    @IBOutlet weak var paymentTableFooter: UIView!
    let customCellIdentifier = "ConfirmTableViewCell"
    
    var confirmDetail:[paymentClass] = [
        paymentClass(paymentTitle: "托育人員", paymentContent: "王保姆"),
        paymentClass(paymentTitle: "托育日期", paymentContent: "6月7日"),
        paymentClass(paymentTitle: "托育時間", paymentContent: "14:00 - 19:00(5hr)"),
        paymentClass(paymentTitle: "每小時收費", paymentContent: "500/hr"),
        paymentClass(paymentTitle: "總金額", paymentContent: "$2500"),
        paymentClass(paymentTitle: "托育地址", paymentContent: "新北市淡水區中正東路二段100巷3號"),
        paymentClass(paymentTitle: "備註", paymentContent: "我家小孩很愛流口水")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = "預約完成！請付款"
        
        //confirmTableView
        paymentTableView.delegate = self
        paymentTableView.dataSource = self
        paymentTableView.estimatedRowHeight = 80
        paymentTableView.rowHeight = UITableViewAutomaticDimension
        paymentTableView.registerNib(UINib(nibName: "ConfirmTableViewCell", bundle: nil), forCellReuseIdentifier: customCellIdentifier)
        paymentTableView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        paymentTableHeader.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        paymentTableFooter.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        paymentButton.backgroundColor = UIColor(red: 99/255, green: 108/255, blue: 163/255, alpha: 1)
        
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
        return 7
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ConfirmTableViewCell", forIndexPath: indexPath) as! ConfirmTableViewCell
        
        cell.confirmTitle.text = confirmDetail[indexPath.row].paymentTitle
        cell.confirmContent.text = confirmDetail[indexPath.row].paymentContent
        
        
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
