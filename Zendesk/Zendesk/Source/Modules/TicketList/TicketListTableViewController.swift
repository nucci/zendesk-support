//
//  TicketListTableViewController.swift
//  Zendesk
//
//  Created by Anonymous User on 20/06/18.
//  Copyright © 2018 Nucci. All rights reserved.
//

import UIKit

class TicketListTableViewController: UITableViewController {

    // MARK: Properties
    private lazy var viewModel: TicketListViewModel = TicketListViewModel()
    private var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        initViewModel()
    }
    
    // MARK: Private initializers
    private func initView() {
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
        view.bringSubview(toFront: activityIndicator)
    }

    private func initViewModel() {
        viewModel.tickets.bind { [weak self] (_) in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        viewModel.isLoading.bind { [weak self] (isLoading) in
            if isLoading {
                self?.activityIndicator.startAnimating()
            } else {
                self?.activityIndicator.stopAnimating()
            }
        }
        
        viewModel.errorMessage.bind { [weak self] (errorMessage) in
            let alert = UIAlertController(title: "=(", message: errorMessage, preferredStyle: .alert)
            alert.addAction( UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self?.present(alert, animated: true, completion: nil)
        }
        
        viewModel.fetchTickets()
    }
    
    // MARK: Actions
    @IBAction func refresh(_ sender: Any) {
        viewModel.fetchTickets()
    }
}

// MARK: TableView Datasource and Delegate
extension TicketListTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TicketTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        
        let ticketViewModel = viewModel[indexPath.row]
        cell.setup(ticketViewModel)
        
        return cell
    }
}
