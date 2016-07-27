//
//  SearchDetailViewController.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/15.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit
import Cosmos
import NoChat
import JSQMessagesViewController

class SearchDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailStarRating: CosmosView!
    @IBOutlet weak var IntroDetailTableView: UITableView!
    @IBOutlet weak var introTableViewSeperator: UIView!
    @IBOutlet weak var introFooterView: UIView!
    @IBOutlet weak var introTopView: UIView!
    
    let customCellIdentifier = "SearchDetailTableViewCell"
    let secondCustomCellIdentifier = "SecondSearchDetailTableViewCell"
    
    var searchDetail: searchResult!
    
    //first detail cell class
    var firstIntros:[FirstIntro] = [
        FirstIntro(introTitle: "自我介紹"),
        FirstIntro(introTitle: "托育人員登記號碼"),
        FirstIntro(introTitle: "平日每小時收費"),
        FirstIntro(introTitle: "六日及國定假日每小時收費"),
        FirstIntro(introTitle: "特殊時段每小時加收費"),
        FirstIntro(introTitle: "特殊時段備註"),
        FirstIntro(introTitle: "每趟最低時限"),
        FirstIntro(introTitle: "托育經驗起始日"),
        FirstIntro(introTitle: "特殊托育經驗")
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailImageView.image = UIImage(named: searchDetail.imageResult)
        self.title = searchDetail.nameResult
        detailStarRating.rating = searchDetail.starResult
        
        //detailTableView
        IntroDetailTableView.delegate = self
        IntroDetailTableView.dataSource = self
        IntroDetailTableView.estimatedRowHeight = 80
        IntroDetailTableView.rowHeight = UITableViewAutomaticDimension
        IntroDetailTableView.registerNib(UINib(nibName: "SearchDetailTableViewCell", bundle: nil), forCellReuseIdentifier: customCellIdentifier)
        IntroDetailTableView.registerNib(UINib(nibName: "SecondSearchDetailTableViewCell", bundle: nil), forCellReuseIdentifier: secondCustomCellIdentifier)
        IntroDetailTableView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        // tableViewUISetting
        introTableViewSeperator.backgroundColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
        introTopView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        introFooterView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        self.view.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - DetailTableView datasource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firstIntros.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("SecondSearchDetailTableViewCell", forIndexPath: indexPath) as! SecondSearchDetailTableViewCell
            
            cell.secondIntroCellTitleLabel.text = firstIntros[indexPath.row].introTitle
            cell.secondIntroCellContentLabel.text = searchDetail.nannyIntro
            
            return cell
        } else if indexPath.row == 8 {
            let cell = tableView.dequeueReusableCellWithIdentifier("SecondSearchDetailTableViewCell", forIndexPath: indexPath) as! SecondSearchDetailTableViewCell
            
            cell.secondIntroCellTitleLabel.text = firstIntros[indexPath.row].introTitle
            cell.secondIntroCellContentLabel.text = searchDetail.specialExp
            
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("SearchDetailTableViewCell", forIndexPath: indexPath) as! SearchDetailTableViewCell
            
            cell.firstIntroCellTitleLabel.text = firstIntros[indexPath.row].introTitle
            cell.firstIntroCellContentLabel.text = searchDetail.nannyId
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCellWithIdentifier("SearchDetailTableViewCell", forIndexPath: indexPath) as! SearchDetailTableViewCell
            
            cell.firstIntroCellTitleLabel.text = firstIntros[indexPath.row].introTitle
            cell.firstIntroCellContentLabel.text = searchDetail.hourRseult
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCellWithIdentifier("SearchDetailTableViewCell", forIndexPath: indexPath) as! SearchDetailTableViewCell
            
            cell.firstIntroCellTitleLabel.text = firstIntros[indexPath.row].introTitle
            cell.firstIntroCellContentLabel.text = searchDetail.vacationRate
            return cell
        } else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCellWithIdentifier("SearchDetailTableViewCell", forIndexPath: indexPath) as! SearchDetailTableViewCell
            
            cell.firstIntroCellTitleLabel.text = firstIntros[indexPath.row].introTitle
            cell.firstIntroCellContentLabel.text = searchDetail.specialRate
            return cell
        } else if indexPath.row == 5 {
            let cell = tableView.dequeueReusableCellWithIdentifier("SearchDetailTableViewCell", forIndexPath: indexPath) as! SearchDetailTableViewCell
            
            cell.firstIntroCellTitleLabel.text = firstIntros[indexPath.row].introTitle
            cell.firstIntroCellContentLabel.text = searchDetail.specialText
            return cell
        } else if indexPath.row == 6 {
            let cell = tableView.dequeueReusableCellWithIdentifier("SearchDetailTableViewCell", forIndexPath: indexPath) as! SearchDetailTableViewCell
            
            cell.firstIntroCellTitleLabel.text = firstIntros[indexPath.row].introTitle
            cell.firstIntroCellContentLabel.text = searchDetail.minimalHour
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("SearchDetailTableViewCell", forIndexPath: indexPath) as! SearchDetailTableViewCell
            
            cell.firstIntroCellTitleLabel.text = firstIntros[indexPath.row].introTitle
            cell.firstIntroCellContentLabel.text = searchDetail.startDay
            return cell
        }

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
    
    @IBAction func ChatViewButton(sender: AnyObject) {
   // TGChatViewController
//        let chatItemsDecorator = TGChatItemsDecorator()
//        let demoDataSource = TGChatDataSource()
//        demoDataSource.chatItems = DemoChatItemFactory.createChatItemsTG()
//        
//        let chatVC = TGChatViewController()
//        chatVC.chatItemsDecorator = chatItemsDecorator
//        chatVC.chatDataSource = demoDataSource
//        chatVC.title = title
//        
//        // pass search data to chatVC
//        chatVC.searchChatDetail = self.searchDetail
//        self.navigationController?.pushViewController(chatVC, animated: true)
        
        
        // JSQChatView
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let naviVC = storyboard.instantiateViewControllerWithIdentifier("ChatNaviVC") as! UINavigationController
//        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        appDelegate.window?.rootViewController = naviVC
        let chatVC = NewChatViewController() as JSQMessagesViewController
        
        self.navigationController?.pushViewController(chatVC, animated: true)
        
       
        
        
    }
    
}
