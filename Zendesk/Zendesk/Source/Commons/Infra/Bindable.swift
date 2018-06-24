//
//  Bindable.swift
//  Zendesk
//
//  Created by Gian Nucci on 24/06/18.
//  Copyright © 2018 Nucci. All rights reserved.
//

import Foundation

class Bindable<T> {
    
    var bind :(T) -> () = { _ in }
    
    var value :T? {
        didSet {
            bind(value!)
        }
    }
    
    init(_ v :T) {
        value = v
    }
    
}
