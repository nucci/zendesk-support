//
//  TicketTableViewCell.swift
//  Zendesk
//
//  Created by Anonymous User on 20/06/18.
//  Copyright © 2018 Nucci. All rights reserved.
//

import UIKit

class TicketTableViewCell: UITableViewCell, Identifiable {

    @IBOutlet weak var descriptionLabel: UILabel?
    @IBOutlet weak var subjectLabel: UILabel?
    @IBOutlet weak var identifierLabel: UILabel?
    @IBOutlet weak var statusView: StatusView?
    
    /// Setup Cell with its viewModel representation
    ///
    /// - Parameter viewModel: TicketViewModel
    func setup(_ viewModel: TicketViewModel) {
        descriptionLabel?.text = viewModel.description
        subjectLabel?.text = viewModel.subject
        identifierLabel?.text = viewModel.formatedId
        statusView?.status = viewModel.status
    }
}
