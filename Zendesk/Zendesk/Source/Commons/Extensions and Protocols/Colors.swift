//
//  Colors.swift
//  Zendesk
//
//  Created by Gian Nucci on 20/06/18.
//  Copyright © 2018 Nucci. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var statusOpen: UIColor {
        return UIColor(named: "statusOpen") ?? UIColor.white
    }
    
    static var statusPending: UIColor {
        return UIColor(named: "statusPending") ?? UIColor.white
    }
    
    static var statusNew: UIColor {
        return UIColor(named: "statusNew") ?? UIColor.white
    }
}
