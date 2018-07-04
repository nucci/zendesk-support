//
//  StatusView.swift
//  Zendesk
//
//  Created by Anonymous User on 21/06/18.
//  Copyright © 2018 Nucci. All rights reserved.
//

import UIKit

class StatusView: UIView {
    
    @IBOutlet weak var statusLabel: UILabel?
    
    var status: TicketStatus = .new {
        didSet {
            switch status {
            case .new:
                statusLabel?.text = LocalizableStrings.statusNew.localize()
                backgroundColor = .statusNew
            case .open:
                statusLabel?.text = LocalizableStrings.statusOpen.localize()
                backgroundColor = .statusOpen
            case .pending:
                statusLabel?.text = LocalizableStrings.statusPending.localize()
                backgroundColor = .statusPending
            
            }
        }
    }
}
