//
//  Localizable.swift
//  Zendesk
//
//  Created by Anonymous User on 21/06/18.
//  Copyright © 2018 Nucci. All rights reserved.
//

import Foundation

extension String {
    
    /// Get localized string without comment
    ///
    /// - Returns: localized string
    func localize() -> String {
        return NSLocalizedString(self,
                                 tableName: nil,
                                 bundle: Bundle.main,
                                 value: "",
                                 comment: "")
    }
}
