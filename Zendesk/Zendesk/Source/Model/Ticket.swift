//
//  Ticket.swift
//  Zendesk
//
//  Created by Gian Nucci on 23/06/18.
//  Copyright © 2018 Nucci. All rights reserved.
//

import Foundation

struct Ticket: Codable {
    
    let identifier: String
    let description: String?
    let subject: String?
    let status: TicketStatus
    
}
