//
//  TicketViewModel.swift
//  Zendesk
//
//  Created by Anonymous User on 24/06/18.
//  Copyright © 2018 Nucci. All rights reserved.
//

import Foundation

struct TicketViewModel {
    let status: TicketStatus
    let description: String
    let subject: String
    let identifier: Int
    
    var formatedId: String {
        return "#\(identifier)"
    }
    
    init(_ ticket: Ticket) {
        status = ticket.status
        description = ticket.description ?? ""
        subject = ticket.subject ?? ""
        identifier = ticket.identifier
    }
}
