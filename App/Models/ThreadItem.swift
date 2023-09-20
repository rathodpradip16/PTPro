//
//  ThreadItem.swift
//  App
//
//  Created by Phycom Mac Pro on 17/09/23.
//  Copyright © 2023 RADICAL START. All rights reserved.
//

import Foundation
import Apollo

struct ThreadItems {
    var id: Int = 0
    var threadId: Int = 0
    var reservationId: Int = 0
    var sentBy: String = ""
    var content: String = ""
    var type: String = ""
    var startDate: String = ""
    var endDate: String = ""
    var createdAt: String = ""
    
    init(id: Int, threadId: Int, reservationId: Int, sentBy: String, content: String, type: String, startDate: String, endDate: String, createdAt: String) {
        self.id = id
        self.threadId = threadId
        self.reservationId = reservationId
        self.sentBy = sentBy
        self.content = content
        self.type = type
        self.startDate = startDate
        self.endDate = endDate
        self.createdAt = createdAt
    }
}
