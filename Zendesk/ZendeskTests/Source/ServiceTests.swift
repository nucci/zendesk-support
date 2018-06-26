//
//  ServiceTests.swift
//  ZendeskTests
//
//  Created by Anonymous User on 25/06/18.
//  Copyright © 2018 Nucci. All rights reserved.
//

import XCTest
@testable import Zendesk

class ServiceTests: XCTestCase {
    
    var service: TicketService?
    
    override func setUp() {
        super.setUp()
        service = TicketService()
    }
    
    override func tearDown() {
        service = nil
        super.tearDown()
    }
    
    func testFetchTicketsSuccess() {
        
        // Arrange
        let service = self.service
        let viewId = 39551161
        
        // When fetch popular photo
        let expectation = XCTestExpectation(description: "fetch_success")
        
        service?.fetchTickets(viewId: viewId) { (result) in
            
            do {
                let ticketsData = try result()
                XCTAssertNotNil(ticketsData)
            } catch {
                XCTFail("Service Test Failed: \(error)")
            }
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testFetchTicketsError() {
        
        // Arrange
        let service = self.service
        let viewId = 9999
        
        // When fetch popular photo
        let expectation = XCTestExpectation(description: "fetch_error")
        
        service?.fetchTickets(viewId: viewId) { (result) in
            do {
                XCTAssertThrowsError(try result())
            } catch { }
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}
