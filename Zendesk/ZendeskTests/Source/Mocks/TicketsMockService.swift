//
//  TicketsMockService.swift
//  ZendeskTests
//
//  Created by Anonymous User on 25/06/18.
//  Copyright © 2018 Nucci. All rights reserved.
//

import Foundation
@testable import Zendesk

class TicketsMockService: BaseMock, TicketServiceProtocol {
    
    var isFetchTicketsCalled = false
    private var completion: TicketListCallback?

    func fetchTickets(viewId: Int, _ completion: @escaping TicketListCallback) {
        isFetchTicketsCalled = true
        self.completion = completion
    }

    func callback() {
        completion? { try self.loadResponse() }
    }
}
