//
//  DemoChatItemsDecorator.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/15.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import Foundation
import NoChat
import NoChatTG



typealias TGDateItem = NoChatTG.DateItem
typealias TGChatItemDecorationAttributes = NoChatTG.ChatItemDecorationAttributes

class TGChatItemsDecorator: ChatItemsDecoratorProtocol {
    lazy var dateItem: TGDateItem = {
        let dateUid = NSUUID().UUIDString
        return TGDateItem(uid: dateUid, date: NSDate())
    }()
    
    func decorateItems(chatItems: [ChatItemProtocol], inverted: Bool) -> [DecoratedChatItem] {
        let bottomMargin: CGFloat = 2
        
        var decoratedChatItems = [DecoratedChatItem]()
        
        for chatItem in chatItems {
            decoratedChatItems.append(
                DecoratedChatItem(
                    chatItem: chatItem,
                    decorationAttributes: TGChatItemDecorationAttributes(bottomMargin: bottomMargin, showsTail: true)
                )
            )
        }
        
        if chatItems.isEmpty == false {
            let decoratedDateItem = DecoratedChatItem(
                chatItem: dateItem,
                decorationAttributes: TGChatItemDecorationAttributes(bottomMargin: bottomMargin, showsTail: false)
            )
            decoratedChatItems.append(decoratedDateItem)
        }
        
        return decoratedChatItems
    }
}

