//
//  Localizable.swift
//  Zendesk
//
//  Created by Gian Nucci on 21/06/18.
//  Copyright © 2018 Nucci. All rights reserved.
//

import Foundation

extension String {
    
    /**
     Get localized string without comment
     
     - returns: localized string
     */
    func localize() -> String {
        return NSLocalizedString(self,
                                 tableName: nil,
                                 bundle: Bundle.main,
                                 value: "",
                                 comment: "")
    }
}
