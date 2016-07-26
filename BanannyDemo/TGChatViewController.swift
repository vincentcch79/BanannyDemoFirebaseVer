//
//  TGChatViewController.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/15.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import Foundation
import NoChat
import NoChatTG

class TGChatViewController: ChatViewController {
    
    var searchChatDetail: searchResult!
    
    lazy var titleView: TitleView! = {
        let view = TitleView()
        return view
    }()
    
    lazy var reserveButton: ReserveButton! = {
        let button = ReserveButton()
        return button
    }()
    
    lazy var cancelButton: CancelButton! = {
        let leftButton = CancelButton()
        return leftButton
    }()
    
    override var title: String? {
        set {
            titleView.titleLabel.text = newValue
        }
        get {
            return titleView.titleLabel.text
        }
    }
    
    let messageLayoutCache = NSCache()
    
    override func viewDidLoad() {
        inverted = true
        super.viewDidLoad()
        
        wallpaperView.image = UIImage(named: "TGWallpaper")!
        
        navigationItem.titleView = titleView
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil)
        spacer.width = -12
        
        let right = UIBarButtonItem(customView: reserveButton)
        let left = UIBarButtonItem(customView: cancelButton)
        navigationItem.rightBarButtonItems = [spacer, right]
        navigationItem.leftBarButtonItems = [spacer, left]
        
        // addTarget reserveButton
        reserveButton.addTarget(self, action: #selector(TGChatViewController.tapReseveButton(_:)), forControlEvents: .TouchUpInside)
        cancelButton.addTarget(self, action: #selector(TGChatViewController.tapCancelButton(_:)), forControlEvents: .TouchUpInside)
        
        // titleLabel
        titleView.titleLabel.text = "\(searchChatDetail.nameResult)"
        
    }
    
    
    // Setup chat items
    override func createPresenterBuilders() -> [ChatItemType: [ChatItemPresenterBuilderProtocol]] {
        return [
            DateItem.itemType : [
                DateItemPresenterBuider()
            ],
            MessageType.Text.rawValue : [
                MessagePresenterBuilder<TextBubbleView, TGTextMessageViewModelBuilder>(
                    viewModelBuilder: TGTextMessageViewModelBuilder(),
                    layoutCache: messageLayoutCache
                )
            ]
        ]
    }
    
    // Setup chat input views
    override func createChatInputViewController() -> UIViewController {
        let inputController = NoChatTG.ChatInputViewController()
        
        inputController.onSendText = { [weak self] text in
            self?.sendText(text)
        }
        
        inputController.onChooseAttach = { [weak self] in
            self?.showAttachSheet()
        }
        
        return inputController
    }
    
    // tapReseveButton
    func tapReseveButton(sender: AnyObject) {
        
        let alert = UIAlertController(title: "預約保姆", message: "確定要預約這位保姆?", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "確定", style: UIAlertActionStyle.Default) {
            action -> Void in
            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let BookConfirmViewController: UIViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("BookConfirm")
            self.navigationController?.pushViewController(BookConfirmViewController, animated: true)
            })
        alert.addAction(UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    // tapCancelButton
    func tapCancelButton(sender: AnyObject) {
        
        let cancelAlert = UIAlertController(title: "取消對話", message: "將會取消跟這位保姆的對話，回到保姆介紹頁面", preferredStyle: UIAlertControllerStyle.Alert)
        cancelAlert.addAction(UIAlertAction(title: "確定", style: UIAlertActionStyle.Default) {
            action -> Void in
            
            self.navigationController?.popViewControllerAnimated(true)

//            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let SearchDetailViewController: UIViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("SearchDetailView")
//            self.navigationController?.popToViewController(SearchDetailViewController, animated: true)
        })
        cancelAlert.addAction(UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil))
        self.presentViewController(cancelAlert, animated: true, completion: nil)
        
    }

    
    
}

extension TGChatViewController {
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        messageLayoutCache.removeAllObjects()
        
        if size.width > size.height {
            titleView.horizontalLayout()
            reserveButton.horizontalLayout()
            cancelButton.horizontalLayout()
            
        } else {
            titleView.verticalLayout()
            reserveButton.verticalLayout()
            cancelButton.verticalLayout()
        }
        
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
    }
}

extension TGChatViewController {
    func sendText(text: String) {
        let message = TGMessageFactory.createTextMessage(text: text, senderId: "outgoing", isIncoming: false)
        (self.chatDataSource as! TGChatDataSource).addMessages([message])
    }
    
    func showAttachSheet() {
        let sheet = UIAlertController(title: "Choose attchment", message: "", preferredStyle: .ActionSheet)
        
        sheet.addAction(UIAlertAction(title: "Camera", style: .Default, handler: { _ in
        }))
        
        sheet.addAction(UIAlertAction(title: "Photos", style: .Default, handler: { _ in
        }))
        
        sheet.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
        presentViewController(sheet, animated: true, completion: nil)
    }
}

class TitleView: UIView {
    
    var titleLabel: UILabel!
    var detailLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let titleFont: UIFont
//        if #available(iOS 8.2, *) {
            titleFont = UIFont.systemFontOfSize(16, weight: UIFontWeightMedium)
//        } else {
//            titleFont = UIFont(name: "HelveticaNeue-Medium", size: 16)!
//        }
        
        titleLabel = UILabel()
        titleLabel.font = titleFont
        titleLabel.textColor = UIColor.blackColor()
        titleLabel.textAlignment = .Center
        addSubview(titleLabel)
        
        
        
        detailLabel = UILabel()
        detailLabel.font = UIFont.systemFontOfSize(12)
        detailLabel.textColor = UIColor.grayColor()
        detailLabel.textAlignment = .Center
        addSubview(detailLabel)
        
        detailLabel.text = "最後上線時間昨天5:56 PM"
        
        verticalLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func verticalLayout() {
        frame = CGRect(x: 0, y: 0, width: 200, height: 44)
        
        titleLabel.frame = CGRect(x: 0, y: 4, width: frame.width, height: 21)
        detailLabel.frame = CGRect(x: 0, y: titleLabel.frame.maxY + 2, width: frame.width, height: 15)
    }
    
    func horizontalLayout() {
        frame = CGRect(x: 0, y: 0, width: 300, height: 40)
        
        let titleSize = titleLabel.sizeThatFits(CGSize(width: CGFloat.max, height: 21))
        let detailSize = detailLabel.sizeThatFits(CGSize(width: CGFloat.max, height: 15))
        
        let contentWidth = titleSize.width + 6 + detailSize.width
        
        var currentX = frame.width / 2 - contentWidth / 2
        
        titleLabel.frame = CGRect(x: currentX, y: frame.height / 2 - titleSize.height / 2, width: titleSize.width, height: titleSize.height)
        
        currentX += titleSize.width + 6
        
        detailLabel.frame = CGRect(x: currentX, y: frame.height / 2 - detailSize.height / 2, width: detailSize.width, height: detailSize.height)
    }
    
}

class ReserveButton: UIButton {
    
    var searchDetail: searchResult!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setImage(UIImage(named: "calendar")!, forState: .Normal)
        
        verticalLayout()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func verticalLayout() {
        frame = CGRect(x: 0, y: 0, width: 37, height: 37)
    }
    
    func horizontalLayout() {
        frame = CGRect(x: 0, y: 0, width: 28, height: 28)
    }
    
}

class CancelButton: UIButton {
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        
        setImage(UIImage(named: "back_1")!,  forState: .Normal)
        
        verticalLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func verticalLayout() {
        frame = CGRect(x: 0, y: 0, width: 37, height: 37)
    }
    
    func horizontalLayout() {
        frame = CGRect(x: 0, y: 0, width: 28, height: 28)
    }

    
}






class TGTextMessageViewModel: TextMessageViewModel {
    
}

class TGTextMessageViewModelBuilder: MessageViewModelBuilderProtocol {
    
    private let messageViewModelBuilder = MessageViewModelBuilder()
    
    func createMessageViewModel(message message: MessageProtocol) -> MessageViewModelProtocol {
        let messageViewModel = messageViewModelBuilder.createMessageViewModel(message: message)
        messageViewModel.status.value = .Success
        let textMessageViewModel = TGTextMessageViewModel(text: message.content, messageViewModel: messageViewModel)
        return textMessageViewModel
    }
}