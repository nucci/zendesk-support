//
//  TableView.swift
//  Zendesk
//
//  Created by Anonymous User on 20/06/18.
//  Copyright © 2018 Nucci. All rights reserved.
//

import UIKit

extension UITableView {
    
    /**
     Returns a reusable `UITableViewCell` object for the class inferred by the return-type
     - parameter indexPath: The index path specifying the location of the cell.
     - parameter cellType: The cell class to dequeue
     - returns: A `Identifiable`, `UITableViewCell` instance
     - note: The `cellType` parameter can generally be omitted and infered by the return type,
     except when your type is in a variable and cannot be determined at compile time.
     */
    final func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath,
                                                       cellType: T.Type = T.self) -> T where T: Identifiable {
        guard let cell = self.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(cellType.reuseIdentifier)")
        }
        return cell
    }
}
