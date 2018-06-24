//
//  StatusView.swift
//  Zendesk
//
//  Created by Gian Nucci on 21/06/18.
//  Copyright © 2018 Nucci. All rights reserved.
//

import UIKit

class StatusView: UIView {
    
    @IBOutlet weak var statusLabel: UILabel?
    
    var status: TicketStatus = .new {
        didSet {
            switch status {
            case .open:
                statusLabel?.text = LocalizableStrings.statusOpen.localize()
                backgroundColor = .statusOpen
            case .pending:
                statusLabel?.text = LocalizableStrings.statusPending.localize()
                backgroundColor = .statusPending
            case .new:
                statusLabel?.text = LocalizableStrings.statusOpen.localize()
                backgroundColor = .statusNew
            }
        }
    }
}
