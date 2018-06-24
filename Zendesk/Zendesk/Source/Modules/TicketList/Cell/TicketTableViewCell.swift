//
//  TicketTableViewCell.swift
//  Zendesk
//
//  Created by Gian Nucci on 20/06/18.
//  Copyright © 2018 Nucci. All rights reserved.
//

import UIKit

class TicketTableViewCell: UITableViewCell, Identifiable {

    @IBOutlet weak var descriptionLabel: UILabel?
    @IBOutlet weak var subjectLabel: UILabel?
    @IBOutlet weak var identifierLabel: UILabel?
    @IBOutlet weak var statusView: StatusView?
    
    func setup(_ viewModel: TicketViewModel) {
        descriptionLabel?.text = viewModel.description
        subjectLabel?.text = viewModel.subject
        identifierLabel?.text = viewModel.identifier
        statusView?.status = viewModel.status
    }
}
