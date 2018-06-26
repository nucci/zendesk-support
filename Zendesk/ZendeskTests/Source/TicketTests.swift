//
//  TicketTests.swift
//  ZendeskTests
//
//  Created by Anonymous User on 25/06/18.
//  Copyright © 2018 Nucci. All rights reserved.
//

import XCTest
@testable import Zendesk

class TicketTests: XCTestCase {
    
    var mock: BaseMock?
    let bundle = Bundle(for: TicketTests.self)
    
    override func tearDown() {
        mock = nil
    }
    
    func testTicketParseStatusNew() {
        mock = BaseMock(file: "ticket-new", error: nil, bundle: bundle)
        do {
            let jsonData = try mock!.json()
            let ticket = try JSONDecoder().decode(Ticket.self, from: jsonData)
            
            XCTAssertEqual(ticket.identifier, 99)
            XCTAssertEqual(ticket.subject, "Ticket 99")
            XCTAssertEqual(ticket.description, "Ticket test description")
            XCTAssertEqual(ticket.status, TicketStatus.new)
            
        } catch {
            XCTFail("Parse should not fail")
        }
    }
    
    func testTicketParseStatusOpen() {
        mock = BaseMock(file: "ticket-open", error: nil, bundle: bundle)
        do {
            let jsonData = try mock!.json()
            let ticket = try JSONDecoder().decode(Ticket.self, from: jsonData)
            
            XCTAssertEqual(ticket.identifier, 98)
            XCTAssertEqual(ticket.subject, "Ticket 98")
            XCTAssertEqual(ticket.description, "Ticket test description")
            XCTAssertEqual(ticket.status, TicketStatus.open)
            
        } catch {
            XCTFail("Parse should not fail")
        }
    }
    
    func testTicketParseStatusPending() {
        mock = BaseMock(file: "ticket-pending", error: nil, bundle: bundle)
        do {
            let jsonData = try mock!.json()
            let ticket = try JSONDecoder().decode(Ticket.self, from: jsonData)
            
            XCTAssertEqual(ticket.identifier, 97)
            XCTAssertEqual(ticket.subject, "Ticket 97")
            XCTAssertEqual(ticket.description, "Ticket test description")
            XCTAssertEqual(ticket.status, TicketStatus.pending)
            
        } catch {
            XCTFail("Parse should not fail")
        }
    }
}
