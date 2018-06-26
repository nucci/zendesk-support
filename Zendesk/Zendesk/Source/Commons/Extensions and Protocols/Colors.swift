//
//  Colors.swift
//  Zendesk
//
//  Created by Anonymous User on 20/06/18.
//  Copyright © 2018 Nucci. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var statusNew: UIColor {
        return UIColor(named: "status-new") ?? UIColor.green
    }
    
    static var statusOpen: UIColor {
        return UIColor(named: "status-open") ?? UIColor.orange
    }
    
    static var statusPending: UIColor {
        return UIColor(named: "status-pending") ?? UIColor.blue
    }
    
}
