//
//  View.swift
//  Zendesk
//
//  Created by Gian Nucci on 20/06/18.
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
    
    @IBInspectable public var borderColor: UIColor? {
        get { return (layer.borderColor != nil) ? UIColor(cgColor: layer.borderColor!) : nil }
        set { layer.borderColor = newValue?.cgColor }
    }
}
