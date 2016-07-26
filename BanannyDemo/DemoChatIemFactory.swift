//
//  DemoChatIemFactory.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/15.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import Foundation
import NoChat
import NoChatTG



typealias TGMessage = NoChatTG.Message
typealias TGMessageType = NoChatTG.MessageType

struct TGMessageFactory {
    static func createMessage(senderId: String, isIncoming: Bool, msgType: String) -> TGMessage {
        let message = TGMessage(
            msgId: NSUUID().UUIDString,
            msgType: msgType,
            senderId: senderId,
            isIncoming: isIncoming,
            date: NSDate(),
            deliveryStatus: .Delivering,
            attachments: [],
            content: ""
        )
        
        return message
    }
    
    static func createTextMessage(text text: String, senderId: String, isIncoming: Bool) -> TGMessage {
        let message = createMessage(senderId, isIncoming: isIncoming, msgType: TGMessageType.Text.rawValue)
        message.content = text
        return message
    }
}

class DemoChatItemFactory {
    private static let items = [
        ("text", "你昨天晚上還好嗎？"),
        ("text", "不錯！要不要去看電影？"),
        ("text", "好啊看什麼？"),
        ]
    
    static func createChatItemsTG() -> [ChatItemProtocol] {
        var result = [ChatItemProtocol]()
        
        for _ in 0..<1 {
            
            for (index, item) in items.enumerate() {
                if item.0 == "text" {
                    let senderId = (index % 2 == 0) ? "incoming" : "outgoing"
                    let isIncomming = (senderId == "incoming")
                    
                    let chatItem = TGMessageFactory.createTextMessage(text: item.1, senderId: senderId, isIncoming: isIncomming)
                    result.insert(chatItem, atIndex: 0)
                }
            }
            
        }
        
        return result
    }
    
}

