//
//  TicketListViewModel.swift
//  Zendesk
//
//  Created by Gian Nucci on 23/06/18.
//  Copyright © 2018 Nucci. All rights reserved.
//

import Foundation

class TicketListViewModel {
    
    private let service: TicketServiceProtocol
    private var tickets = [TicketViewModel]() {
        didSet {
        
        }
    }
    
    private var isLoading: Bool = false {
        didSet {
            
        }
    }
    
    init(service: TicketServiceProtocol = TicketService()) {
        self.service = service
    }
    
    func fetchTickets() {
        isLoading = true
        service.fetchTickets { [weak self] (result) in
            do {
                let tickets = try result()
                self?.processFetchedTickets(tickets)
            } catch {
                // some error threatment
            }
        }
    }
    
    private func processFetchedTickets(_ ticketsList: [Ticket]) {
        //self.tickets = tickets // Cache
        var vms = [TicketViewModel]()
        for ticket in ticketsList {
            //vms.append(TicketViewModel())
        }
        tickets = vms
    }
    
    subscript(index: Int) -> TicketViewModel {
        get {
            return tickets[index]
        }
    }
    
}
