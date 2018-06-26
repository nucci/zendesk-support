//
//  Identifiable.swift
//  Zendesk
//
//  Created by Anonymous User on 20/06/18.
//  Copyright © 2018 Nucci. All rights reserved.
//

import Foundation

import UIKit

// MARK: - Identifiable protocol
/// Used to UIViewController that are stored in Storyboard
protocol Identifiable: class { }

// MARK: - Identifiable Extension on UITableViewCell
extension Identifiable where Self: UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
