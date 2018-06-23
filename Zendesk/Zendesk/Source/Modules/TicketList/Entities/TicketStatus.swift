//
//  TicketStatus.swift
//  Zendesk
//
//  Created by Gian Nucci on 21/06/18.
//  Copyright © 2018 Nucci. All rights reserved.
//

import Foundation

enum TicketStatus: String, Codable {
    case new
    case open
    case pending
}
