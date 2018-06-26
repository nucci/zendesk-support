//
//  TicketListViewModelTests.swift
//  ZendeskTests
//
//  Created by Anonymous User on 25/06/18.
//  Copyright © 2018 Nucci. All rights reserved.
//

import XCTest
@testable import Zendesk

class TicketListViewModelTests: XCTestCase {
    
    var viewModel: TicketListViewModel!
    var service: TicketsMockService!
    
    override func setUp() {
        super.setUp()
        service = TicketsMockService()
        viewModel = TicketListViewModel(service: service)
    }
    
    override func tearDown() {
        service = nil
        viewModel = nil
        super.tearDown()
    }
    
    func testFetchTickets() {
        // Given
        service.file = "tickets_200"
        
        // When
        viewModel.fetchTickets()
        
        // Assert
        XCTAssertTrue(service.isFetchTicketsCalled)
    }
    
    func testFetchTicketsFail() {
        // Given
        service.error = ServiceError.requestFailed("fail test")
        
        // When
        viewModel.fetchTickets()
        service.callback()
        
        // Assert
        XCTAssertEqual(viewModel.errorMessage.value, LocalizableStrings.defaultErrorMessage.localize())
    }
    
    func testCreateCellViewModel() {
        // Given
        service.file = "tickets_200"
        let expectation = XCTestExpectation(description: "binds called")
        viewModel.tickets.bind { (_) in
            expectation.fulfill()
        }
        
        // When
        viewModel.fetchTickets()
        service.callback()
        
        // XCTAssert
        XCTAssertEqual(viewModel.tickets.value.count, 45 )
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testLoadingWhenFetching() {
        
        // Given
        var loadingStatus = false
        let startExpectation = XCTestExpectation(description: "loading bind called: start")
        let finishExpectation = XCTestExpectation(description: "loading bind called: finish")
        service.file = "tickets_200"
        viewModel.isLoading.bind { (isLoading) in
            loadingStatus = isLoading
            startExpectation.fulfill()
        }
        
        viewModel.tickets.bind { (_) in
            finishExpectation.fulfill()
        }
        
        // When
        viewModel.fetchTickets()
        
        // Assert
        XCTAssertTrue( loadingStatus )
        service.callback()
        XCTAssertFalse( loadingStatus )
        wait(for: [finishExpectation, startExpectation], timeout: 4.0)
    }
    
    func testCellViewModel() {
        // Given
        let ticketNew = Ticket(identifier: 97, description: "description", subject: "subject", status: .new)
        let ticketOpen = Ticket(identifier: 98, description: "description", subject: "subject", status: .open)
        let ticketPending = Ticket(identifier: 97, description: "description", subject: "subject", status: .pending)
        
        // When
        let cellViewModelNew = TicketViewModel(ticketNew)
        let cellViewModelOpen = TicketViewModel(ticketOpen)
        let cellViewModelPending = TicketViewModel(ticketPending)
        
        
        // Assert
        XCTAssertEqual( ticketNew.description, cellViewModelNew.description )
        XCTAssertEqual( ticketNew.subject, cellViewModelNew.subject )
        XCTAssertEqual( ticketNew.identifier, cellViewModelNew.identifier )
        XCTAssertEqual( "#\(ticketNew.identifier)", cellViewModelNew.formatedId )
        
        XCTAssertEqual( ticketNew.status, cellViewModelNew.status )
        XCTAssertEqual( ticketOpen.status, cellViewModelOpen.status )
        XCTAssertEqual( ticketPending.status, cellViewModelPending.status )
        
    }
    
}
