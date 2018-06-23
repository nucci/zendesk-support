//
//  TicketTableViewCell.swift
//  Zendesk
//
//  Created by Gian Nucci on 20/06/18.
//  Copyright © 2018 Nucci. All rights reserved.
//

import UIKit

class TicketTableViewCell: UITableViewCell, Identifiable {

    @IBOutlet weak var statusLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
