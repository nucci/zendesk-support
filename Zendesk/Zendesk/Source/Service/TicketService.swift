//
//  TicketService.swift
//  Zendesk
//
//  Created by Gian Nucci on 23/06/18.
//  Copyright © 2018 Nucci. All rights reserved.
//

import Foundation
import Alamofire

typealias TicketListCallback = (() throws -> [Ticket]) -> Void

protocol TicketServiceProtocol {
    func fetchTickets(_ completion: @escaping TicketListCallback)
}

class TicketService: TicketServiceProtocol {
    
    func fetchTickets(_ completion: @escaping TicketListCallback) {
        Alamofire.request("")
                 .validate()
                 .authenticate(user: "", password: "")
                 .responseData { (response) in
                    debugPrint("All Response Info: \(response)")
                    
                    do {
                        switch response.result {
                        case .success(let data):
                            let ticketResponse = try JSONDecoder().decode(TicketsResponse.self, from: data)
                            completion { ticketResponse.tickets }
                        case .failure(let error):
                            throw error
                        }
                    } catch {
                        completion { throw error }
                    }
        }
    }
}
