//
//  LocalizableStrings.swift
//  Zendesk
//
//  Created by Anonymous User on 21/06/18.
//  Copyright © 2018 Nucci. All rights reserved.
//

import Foundation

enum LocalizableStrings: String {
    
    // Status
    case statusNew
    case statusOpen
    case statusPending
    
    // Ticket List
    case ticketListTitle
    case defaultErrorMessage
    
    /// This method localizes the raw value of the object
    ///
    /// - Returns: Return the localized string for that key
    func localize() -> String {
        return self.rawValue.localize()
    }
}
