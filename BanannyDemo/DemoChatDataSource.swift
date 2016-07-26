//
//  DemoChatDataSource.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/15.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import Foundation
import NoChat
import NoChatTG


class TGChatDataSource: ChatDataSourceProtocol {
    var hasMoreNext: Bool = false
    var hasMorePrevious: Bool = false
    var chatItems: [ChatItemProtocol] = []
    weak var delegate: ChatDataSourceDelegateProtocol?
    
    func loadNext(completion: () -> Void) {
        completion()
    }
    
    func loadPrevious(completion: () -> Void) {
        completion()
    }
    
    func adjustNumberOfMessages(preferredMaxCount preferredMaxCount: Int?, focusPosition: Double, completion:(didAdjust: Bool) -> Void) {
        completion(didAdjust: false)
    }
    
    
    func addMessages(messages: [TGMessage]) {
        chatItems.insertContentsOf(messages.reverse().map { $0 as ChatItemProtocol }, at: 0)
        delegate?.chatDataSourceDidUpdate(self)
    }
    
}
