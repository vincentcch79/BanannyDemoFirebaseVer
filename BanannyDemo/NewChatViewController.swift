//
//  NewChatViewController.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/26.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit
import JSQMessagesViewController
import MobileCoreServices
import AVKit
import FirebaseDatabase
import FirebaseAuth
import FBSDKCoreKit
import SDWebImage

class NewChatViewController: JSQMessagesViewController {
    
    var messages = [JSQMessage]()
    var searchChatDetail: searchResult!
    var messageRef = FIRDatabase.database().reference().child("messages")
    var incomingAvatar: JSQMessagesAvatarImage!
    var outgoingAvatar: JSQMessagesAvatarImage!
   

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "\(searchChatDetail.nameResult)保姆 訊息"
        self.senderId = "one"
        self.senderDisplayName = "Vinny"
//        self.senderId = "two"
//        self.senderDisplayName = "Jane"
        self.view.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        
        self.tabBarController?.tabBar.hidden = true
        
        
        
        //define Firebase Database
        observeMessages()
        
        //download image from data
        if let user = FIRAuth.auth()?.currentUser {
            if user.photoURL != nil {
            
                let url =  user.photoURL
                if let data = NSData(contentsOfURL: url!) {
                    self.outgoingAvatar = JSQMessagesAvatarImageFactory.avatarImageWithImage(UIImage(data: data), diameter: 64)
                }
            }
        }
        
        
        
        // setting avatar image
        self.incomingAvatar = JSQMessagesAvatarImageFactory.avatarImageWithImage(UIImage(named: searchChatDetail.imageResult)!, diameter: 64)
//        self.outgoingAvatar = JSQMessagesAvatarImageFactory.avatarImageWithImage(UIImage(named: "user_profile")!, diameter: 64)
        
        // add navigation bar item
        let bookNavButton = UIButton()
        bookNavButton.frame = CGRectMake(0, 0, 90, 38)
        bookNavButton.backgroundColor = UIColor(red: 99/255, green: 108/255, blue: 163/255, alpha: 1)
        bookNavButton.setTitle("預約", forState: UIControlState.Normal)
        bookNavButton.tintColor = UIColor.whiteColor()
        bookNavButton.addTarget(self, action: #selector(NewChatViewController.bookInChatView(_:)), forControlEvents: .TouchUpInside)
        self.navigationItem.setRightBarButtonItem(UIBarButtonItem(customView: bookNavButton), animated: true)
        // get rid of backbaritem's description
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        
    }
    
    
    func bookInChatView (sender: UIButton!) {
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let BookConfirmViewController: UIViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("BookConfirm")
        self.navigationController?.pushViewController(BookConfirmViewController, animated: true)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        collectionView?.collectionViewLayout.springinessEnabled=true
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.automaticallyScrollsToMostRecentMessage = true
    }
    
    
    
    func observeMessages() {
        messageRef.observeEventType(.ChildAdded, withBlock: { snapshot in
            if let dict = snapshot.value as? [String: AnyObject] {
                _ = dict["MediaType"] as! String
                let senderId = dict["senderId"] as! String
                let senderName = dict["senderName"] as! String
                let text = dict["text"] as! String
                self.messages.append(JSQMessage(senderId: senderId, displayName: senderName, text: text))
                dispatch_async(dispatch_get_main_queue(), {
                    
                    self.collectionView.reloadData()

                })
                
                self.automaticallyScrollsToMostRecentMessage = true
                self.finishReceivingMessageAnimated(true)
            }
        })
    }
    
    override func didPressSendButton(button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: NSDate!) {

        inputToolbar.contentView.textView.text = ""
        let newMessage = messageRef.childByAutoId()
        let messageData = ["text": text, "senderId": senderId, "senderName": senderDisplayName, "MediaType": "TEXT"]
        newMessage.setValue(messageData)
        JSQSystemSoundPlayer.jsq_playMessageSentSound()
        self.automaticallyScrollsToMostRecentMessage = true
        
    }
    
    
    
    override func didPressAccessoryButton(sender: UIButton!) {
        print("didPressAccessoryButton")
        
        let sheet = UIAlertController(title: "傳送影音檔案", message: "請選擇你要傳送的檔案", preferredStyle: UIAlertControllerStyle.ActionSheet)
        let cancel = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel) { (alert: UIAlertAction) in
        }
        let photoLibrary = UIAlertAction(title: "傳送照片", style: UIAlertActionStyle.Default) { (alert: UIAlertAction) in
            self.getMediaFrom(kUTTypeImage)
        }
        let videoLibrary = UIAlertAction(title: "傳送影片", style: UIAlertActionStyle.Default) { (alert: UIAlertAction) in
            self.getMediaFrom(kUTTypeMovie)
        }
        
        sheet.addAction(photoLibrary)
        sheet.addAction(videoLibrary)
        sheet.addAction(cancel)
        self.presentViewController(sheet, animated: true, completion: nil)
        
        
    }
    func getMediaFrom(type: CFString) {
        let mediaPicker = UIImagePickerController()
        mediaPicker.delegate = self
        mediaPicker.mediaTypes = [type as String]
        self.presentViewController(mediaPicker, animated: true, completion: nil)
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, didTapMessageBubbleAtIndexPath indexPath: NSIndexPath!) {
        print ("didTapMessagebubbleAtIndexPath:\(indexPath.item)")
        let message = messages[indexPath.item]
        if message.isMediaMessage {
            if let mediaItem = message.media as? JSQVideoMediaItem {
                let player = AVPlayer(URL: mediaItem.fileURL)
                let playerViewController = AVPlayerViewController()
                playerViewController.player = player
                self.presentViewController(playerViewController, animated: true, completion: nil)
            }
         
        }
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, messageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageData! {
        return messages[indexPath.item]
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageBubbleImageDataSource! {
        
//        let bubbleFactory = JSQMessagesBubbleImageFactory()
//        return bubbleFactory.outgoingMessagesBubbleImageWithColor(.lightGrayColor())
        if messages[indexPath.item].senderId == senderId {
            return
            JSQMessagesBubbleImageFactory().outgoingMessagesBubbleImageWithColor(UIColor(red: 220/255, green: 220/255, blue: 233/255, alpha: 1))
            
        } else {
            return
            JSQMessagesBubbleImageFactory().incomingMessagesBubbleImageWithColor(UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1))
        }
        
        
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageAvatarImageDataSource! {
        let message = self.messages[indexPath.item]
        if message.senderId == self.senderId {
            return self.outgoingAvatar
        }
        return incomingAvatar
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = super.collectionView(collectionView, cellForItemAtIndexPath: indexPath) as! JSQMessagesCollectionViewCell
        if messages[indexPath.item].senderId == senderId {
            
            cell.textView?.textColor = UIColor.blackColor()
            
        } else {
            
            cell.textView?.textColor = UIColor.darkGrayColor()
        }
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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



extension NewChatViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        print("did finish picking")
        //get the image
        
        if  let picture = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
        let photo = JSQPhotoMediaItem(image: picture)
        messages.append(JSQMessage(senderId: senderId, displayName: senderDisplayName, media: photo))
            
        } else if let video = info[UIImagePickerControllerMediaURL] as? NSURL {
            
            let videoItem = JSQVideoMediaItem(fileURL: video, isReadyToPlay: true)
            messages.append(JSQMessage(senderId: senderId, displayName: senderDisplayName, media: videoItem))
            
        }
        self.dismissViewControllerAnimated(true, completion: nil)
        collectionView.reloadData()
    }
    
}
