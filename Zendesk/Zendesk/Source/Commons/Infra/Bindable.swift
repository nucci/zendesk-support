//
//  Bindable.swift
//  Zendesk
//
//  Created by Anonymous User on 24/06/18.
//  Copyright © 2018 Nucci. All rights reserved.
//

import Foundation

class Bindable<T> {
    
    private var closure: (T) -> Void = { _ in }
    
    /// value property
    var value: T {
        didSet {
            closure(value)
        }
    }
    
    /// Init with generic type
    ///
    /// - Parameter v: Custom generic type value
    init(_ value: T) {
        self.value = value
    }
    
    /// Binding closure
    ///
    /// - Parameter closure: this closure will be called when value property changes
    func bind(_ closure: @escaping (T) -> Void) {
        self.closure = closure
    }
}
