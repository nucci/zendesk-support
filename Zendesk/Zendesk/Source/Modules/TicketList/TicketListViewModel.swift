//
//  TicketListViewModel.swift
//  Zendesk
//
//  Created by Anonymous User on 23/06/18.
//  Copyright © 2018 Nucci. All rights reserved.
//

import Foundation

class TicketListViewModel {
    
    // MARK: Private Properties
    private let viewId = 39551161
    private let service: TicketServiceProtocol
    
    // MARK: Bindlable Properties
    var tickets = Bindable([TicketViewModel]())
    var isLoading = Bindable(false)
    var errorMessage = Bindable(String())
    
    // MARK: Initializers
    /// Init with service
    ///
    /// - Parameter service: TicketServiceProtocol. Defaults to TicketService()
    init(service: TicketServiceProtocol = TicketService()) {
        self.service = service
    }
    
    // MARK: Public methods
    /// Number of cell to be shown on table view
    var numberOfCells: Int {
        return tickets.value.count
    }
    
    /// fetch tickets from server using current ticket service
    func fetchTickets() {
        isLoading.value = true
        tickets.value = [TicketViewModel]()
        service.fetchTickets(viewId: viewId) { [weak self] (result) in
            self?.isLoading.value = false
            do {
                let dataResult = try result()
                self?.processFetchedTickets(dataResult)
            } catch {
                debugPrint(error.localizedDescription)
                self?.errorMessage.value = LocalizableStrings.defaultErrorMessage.localize()
            }
        }
    }
    
    // MARK: Private methods
    /// Configure FetchedTickets and create view models for cells
    ///
    /// - Parameter ticketsData: data representing TicketsResponse model
    private func processFetchedTickets(_ ticketsData: Data) {
        guard let ticketResponse = try? JSONDecoder().decode(TicketsResponse.self, from: ticketsData) else {
            // error threadtment
            return
        }
        
        var vms = [TicketViewModel]()
        for ticket in ticketResponse.tickets {
            vms.append(TicketViewModel(ticket))
        }
        tickets.value = vms
    }
    
    subscript(index: Int) -> TicketViewModel {
        get {
            return tickets.value[index]
        }
    }
    
}
