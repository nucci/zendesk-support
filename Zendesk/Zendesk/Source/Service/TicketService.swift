//
//  TicketService.swift
//  Zendesk
//
//  Created by Anonymous User on 23/06/18.
//  Copyright © 2018 Nucci. All rights reserved.
//

import Foundation
import Alamofire

typealias TicketListCallback = (() throws -> Data) -> Void
typealias ServiceCredentials = (username: String, password: String)

protocol TicketServiceProtocol {
    func fetchTickets(viewId: Int, _ completion: @escaping TicketListCallback)
}

class TicketService: TicketServiceProtocol {
    
    private let credentials: ServiceCredentials
    
    /// Init with credentials
    /// Mocked credentials
    /// - Parameter credentials: crendentials use to authenticate. Defaults to
    init(credentials: ServiceCredentials = ("xxxxxx", "xxxxxxs")) {
        self.credentials = credentials
    }

    /// Fetch tickets from ther server
    ///
    /// - Parameters:
    ///   - viewId: Int
    ///   - completion: TicketListCallback
    func fetchTickets(viewId: Int, _ completion: @escaping TicketListCallback) {
        Alamofire.request(ticketsUrl(viewId))
                 .validate()
                 .authenticate(user: credentials.username, password: credentials.password)
                 .responseData { (response) in
                    debugPrint("All Response Info: \(response)")
                    
                    switch response.result {
                    case .success(let data):
                        completion { data }
                    case .failure(let error):
                        completion { throw error }
                    }
        }
    }
    
    private func ticketsUrl(_ viewId: Int) -> String {
        return "https://mxtechtest.zendesk.com/api/v2/views/\(viewId)/tickets.json"
    }
}
