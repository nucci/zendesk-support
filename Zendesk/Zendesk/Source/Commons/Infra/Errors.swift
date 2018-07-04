//
//  Errors.swift
//  Zendesk
//
//  Created by Anonymous User on 25/06/18.
//  Copyright © 2018 Nucci. All rights reserved.
//

import Foundation

enum ServiceError: Error {
    case requestFailed(String)
    case parse(String)
}
