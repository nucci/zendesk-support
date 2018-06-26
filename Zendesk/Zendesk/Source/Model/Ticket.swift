//
//  Ticket.swift
//  Zendesk
//
//  Created by Anonymous User on 23/06/18.
//  Copyright © 2018 Nucci. All rights reserved.
//

import Foundation

struct Ticket: Codable {
    
    let identifier: Int
    let description: String?
    let subject: String?
    let status: TicketStatus
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case description
        case subject
        case status
    }
}
