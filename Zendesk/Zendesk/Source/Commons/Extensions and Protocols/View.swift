//
//  View.swift
//  Zendesk
//
//  Created by Anonymous User on 20/06/18.
//  Copyright © 2018 Nucci. All rights reserved.
//

import UIKit

public extension UIView {
    
    @IBInspectable public var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    
    // MARK: border variables
    
    @IBInspectable public var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }

}
