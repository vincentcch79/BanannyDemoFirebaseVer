//
//  ParentDashboardViewController.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/14.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit
import Cosmos

class ParentDashboardViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var parentDashImageView: UIImageView!
    @IBOutlet weak var parentDashNameLabel: UILabel!
    @IBOutlet weak var parentDashStarRating: CosmosView!
    @IBOutlet weak var parentDateDashTextField: UITextField!
    @IBOutlet weak var parentStartTimeTextField: UITextField!
    @IBOutlet weak var parentFinishedTimeTextField: UITextField!
    @IBOutlet weak var parentLocationTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var typingLabel: UILabel!
    // monitor textfield
    var activeTextField:UITextField?
    
    // pickerview data
    
    let cityLocation = ["中正區", "大同區", "中山區", "松山區", "大安區", "萬華區", "信義區", "士林區", "北投區", "內湖區", "南港區", "文山區"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        
        // trasparent navigation bar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        
        // Textfield Delegate
        parentDateDashTextField.delegate = self
        parentStartTimeTextField.delegate = self
        parentFinishedTimeTextField.delegate = self
        parentLocationTextField.delegate = self
        
        //UI Setting
        
        
        typingLabel.tintColor = UIColor(red: 162/255, green: 162/255, blue: 162/255, alpha: 1)
        
        parentDateDashTextField.layer.masksToBounds = true
        parentDateDashTextField.layer.borderColor = UIColor(red: 167/255, green: 167/255, blue: 167/255, alpha: 1).CGColor
        parentDateDashTextField.layer.borderWidth = 1.0
    

        
        parentStartTimeTextField.layer.masksToBounds = true
        parentStartTimeTextField.layer.borderColor = UIColor(red: 167/255, green: 167/255, blue: 167/255, alpha: 1).CGColor
        parentStartTimeTextField.layer.borderWidth = 1.0

        
        
        parentFinishedTimeTextField.layer.masksToBounds = true
        parentFinishedTimeTextField.layer.borderColor = UIColor(red: 167/255, green: 167/255, blue: 167/255, alpha: 1).CGColor
        parentFinishedTimeTextField.layer.borderWidth = 1.0
        
        
        
        parentLocationTextField.layer.masksToBounds = true
        parentLocationTextField.layer.borderColor = UIColor(red: 167/255, green: 167/255, blue: 167/255, alpha: 1).CGColor
        parentLocationTextField.layer.borderWidth = 1.0

        searchButton.backgroundColor = UIColor(red: 99/255, green: 108/255, blue: 163/255, alpha: 1)
        
        
//        // textfield padding
//        let paddingView = UIView(frame: CGRectMake(0, 0, 19, 49))
//        parentDateDashTextField.leftView = paddingView
//        parentDateDashTextField.leftViewMode = UITextFieldViewMode.Always
//        parentStartTimeTextField.leftView = paddingView
//        parentStartTimeTextField.leftViewMode = UITextFieldViewMode.Always
//        parentFinishedTimeTextField.leftView = paddingView
//        parentFinishedTimeTextField.leftViewMode = UITextFieldViewMode.Always
//        parentLocationTextField.leftView = paddingView
//        parentLocationTextField.leftViewMode = UITextFieldViewMode.Always
        
        
        
        
        // Toolbar
        
        let DashboardToolBar = UIToolbar()
        DashboardToolBar.barStyle = UIBarStyle.Default
        DashboardToolBar.translucent = true
        DashboardToolBar.tintColor = UIColor.blackColor()
        let doneButton = UIBarButtonItem(title: "完成", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(ParentDashboardViewController.donePressed))
        DashboardToolBar.setItems([doneButton], animated: false)
        DashboardToolBar.userInteractionEnabled = true
        DashboardToolBar.sizeToFit()
        
        // datepicker for parentDateDashTextField
        let parentDatePicker: UIDatePicker = UIDatePicker()
        parentDatePicker.addTarget(self, action: #selector(ParentDashboardViewController.onDidChangeDate(_:)), forControlEvents: .ValueChanged)
        parentDateDashTextField.inputView = parentDatePicker
        parentDateDashTextField.inputAccessoryView = DashboardToolBar
        parentDatePicker.datePickerMode = UIDatePickerMode.Date
        parentDatePicker.locale = NSLocale(localeIdentifier: "zh_Hant_TW")
        parentDatePicker.backgroundColor = UIColor.whiteColor()
        
        // datepicker for parentStartTimeTextField
        let startDatePicker: UIDatePicker = UIDatePicker()
        startDatePicker.addTarget(self, action: #selector(ParentDashboardViewController.onDidChangeStartTime(_:)), forControlEvents: .ValueChanged)
        parentStartTimeTextField.inputView = startDatePicker
        parentStartTimeTextField.inputAccessoryView = DashboardToolBar
        startDatePicker.datePickerMode = UIDatePickerMode.Time
        startDatePicker.locale = NSLocale(localeIdentifier: "zh_Hant_TW")
        startDatePicker.backgroundColor = UIColor.whiteColor()
        startDatePicker.minuteInterval = 30
        
        // datepicker for parentFinishedTimeTextField
        let endDatePicker: UIDatePicker = UIDatePicker()
        endDatePicker.addTarget(self, action: #selector(ParentDashboardViewController.onDidChangeEndTime(_:)), forControlEvents: .ValueChanged)
        parentFinishedTimeTextField.inputView = endDatePicker
        parentFinishedTimeTextField.inputAccessoryView = DashboardToolBar
        endDatePicker.datePickerMode = UIDatePickerMode.Time
        endDatePicker.locale = NSLocale(localeIdentifier: "zh_Hant_TW")
        endDatePicker.backgroundColor = UIColor.whiteColor()
        endDatePicker.minuteInterval = 30
        
        // pickerview for parentLocationTextField
        let locationPicker: UIPickerView = UIPickerView()
        locationPicker.delegate = self
        locationPicker.dataSource = self
        parentLocationTextField.inputView = locationPicker
        parentLocationTextField.inputAccessoryView = DashboardToolBar
        locationPicker.backgroundColor = UIColor.whiteColor()



    }
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        
        // clear textField
        parentDateDashTextField.text = ""
        parentStartTimeTextField.text = ""
        parentFinishedTimeTextField.text = ""
        parentLocationTextField.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - DatePickerViewFunc
    @IBAction func onDidChangeDateByOnStoryboard(sender: UIDatePicker) {
        self.onDidChangeDate(sender)
    }
    
    internal func onDidChangeDate(sender: UIDatePicker){
        
        // date format
        let parentDateFormatter: NSDateFormatter = NSDateFormatter()
        parentDateFormatter.dateFormat = "MM/dd/yyyy"
        
        // get the date string applied date format
        let parentSelectedDate: NSString = parentDateFormatter.stringFromDate(sender.date)
        parentDateDashTextField.text = parentSelectedDate as String
        
    }
    
    // MARK: - startTime DatePickerFunc
    @IBAction func onDidChangeStartTimeByOnStoryboard(sender: UIDatePicker) {
        self.onDidChangeStartTime(sender)
    }
    
    internal func onDidChangeStartTime(sender: UIDatePicker){
        
        // date format
        let startTimeFormatter: NSDateFormatter = NSDateFormatter()
        startTimeFormatter.dateFormat = "hh:mm a"
        
        // get the date string applied date format
        let selectedStartTime: NSString = startTimeFormatter.stringFromDate(sender.date)
        parentStartTimeTextField.text = selectedStartTime as String
        
    }
    // MARK: - endTime DatePickerFunc
    @IBAction func onDidChangeEndTimeByOnStoryboard(sender: UIDatePicker) {
        self.onDidChangeEndTime(sender)
    }
    
    internal func onDidChangeEndTime(sender: UIDatePicker){
        
        // date format
        let endTimeFormatter: NSDateFormatter = NSDateFormatter()
        endTimeFormatter.dateFormat = "hh:mm a"
        
        // get the date string applied date format
        let selectedEndTime: NSString = endTimeFormatter.stringFromDate(sender.date)
        parentFinishedTimeTextField.text = selectedEndTime as String
        
    }
    // MARK: - textfield Delegate
    func textFieldDidBeginEditing(textField: UITextField) {
        activeTextField = textField
    }
    
    func donePressed() {
        activeTextField?.resignFirstResponder()
    }
    
    // MARK: - pickerview func
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cityLocation.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cityLocation[row]
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        parentLocationTextField.text = cityLocation[row]
    }



    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func parentSearchDashButton(sender: AnyObject) {

    }

}

class TextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 5);
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRectForBounds(bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
}
