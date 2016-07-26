//
//  SearchResultViewController.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/14.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit

class SearchResultViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var searchTableView: UITableView!
    
    let customCellIdentifier = "SearchResultTableViewCell"
    
    var searchResults:[searchResult] = [
        searchResult(nameResult: "王彩霞", imageResult: "nanny_profile_01", starResult: 4, numResult: "(90)", hourResult: "$350/hr", finishResult: "240", startDay: "1999/06/23", nannyId: "123456", vacationRate: "$500/hr", specialRate: "$500/hr", specialText: "24小時", minimalHour: "6小時", specialExp: "我有帶過自閉症兒童，過動兒", nannyIntro: "親愛的爸爸媽媽你們好，我有過十年以上的托育經驗。我自己非常愛小孩子，家中有四個小孩，最大的已經高中。希望有機會合作！", startYear: "1999"),
        searchResult(nameResult: "吳情美", imageResult: "nanny_profile_02", starResult: 4.5, numResult: "(50)", hourResult: "$300/hr", finishResult: "157", startDay: "1989/01/23", nannyId: "123456", vacationRate: "$500/hr", specialRate: "$500/hr", specialText: "24小時", minimalHour: "6小時", specialExp: "我有帶過自閉症兒童，過動兒", nannyIntro: "親愛的爸爸媽媽你們好，我有過十年以上的托育經驗。我自己非常愛小孩子，家中有四個小孩，最大的已經高中。希望有機會合作！", startYear: "1999"),
        searchResult(nameResult: "周麗美", imageResult: "nanny_profile_03", starResult: 5, numResult: "(40)", hourResult: "$500/hr", finishResult: "135", startDay: "1990/05/27",nannyId: "123456", vacationRate: "$500/hr", specialRate: "$500/hr", specialText: "24小時", minimalHour: "6小時", specialExp: "我有帶過自閉症兒童，過動兒", nannyIntro: "親愛的爸爸媽媽你們好，我有過十年以上的托育經驗。我自己非常愛小孩子，家中有四個小孩，最大的已經高中。希望有機會合作！", startYear: "1999")
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green: 238/255, blue: 184/255, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor(red: 138/255, green: 132/255, blue: 101/255, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = ([NSFontAttributeName: UIFont(name: "PingFangTC-SemiBold", size: 18)!, NSForegroundColorAttributeName: UIColor(red: 138/255, green: 132/255, blue: 101/255, alpha: 1)])
        self.navigationController?.navigationBar.layer.shadowRadius = 2.0
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.18
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.title = "搜尋"

        
        // searchTableView and customCell
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.estimatedRowHeight = 180
        searchTableView.rowHeight = UITableViewAutomaticDimension
        searchTableView.registerNib(UINib(nibName: "SearchResultTableViewCell", bundle: nil), forCellReuseIdentifier: customCellIdentifier)
        
        
    }
    
//    override func viewWillAppear(animated: Bool) {
//        if let index = searchTableView.indexPathForSelectedRow{
//            searchTableView.deselectRowAtIndexPath(index, animated: true)
//        }
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SearchResultTableViewCell", forIndexPath: indexPath) as! SearchResultTableViewCell
        
        cell.ResultNameLabel.text = searchResults[indexPath.row].nameResult
        cell.ResultCellImageView.image = UIImage(named: searchResults[indexPath.row].imageResult)
        cell.ResultStarRating.rating = searchResults[indexPath.row].starResult
        cell.ResultHourlyNum.text = searchResults[indexPath.row].hourRseult
        cell.ResultFinishedNum.text = searchResults[indexPath.row].finishResult
        cell.ResultStartNum.text = searchResults[indexPath.row].startDay
        cell.layer.cornerRadius = 15
        cell.contentView.layer.masksToBounds = true
        

        
        return cell
    }

    // MARK: - perform Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "detailResultSegue"{
            
            if let indexPath = searchTableView.indexPathForSelectedRow{
                let destinationViewController = segue.destinationViewController as! SearchDetailViewController
                destinationViewController.searchDetail = searchResults[indexPath.row]
            }
        }
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("detailResultSegue", sender: searchResults[indexPath.row])
        
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
