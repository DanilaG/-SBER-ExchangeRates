//
//  ExchangeRateCellSnapshotTests.swift
//  
//
//  Created by Danila on 05.01.2024.
//

import SwiftUI
import SwiftyMocky
import TestsExtension
import XCTest

@testable import ExchangeRates

@MainActor
final class ExchangeRateCellSnapshotTests: XCTestCase {
    
    private let record = false
    private let longString = String(Array(repeating: "t", count: 100))
    
    func testWhenUsualText() {
        let view = ExchangeRateCell(viewData: .makeMock())

        assertSnapshots(of: view, record: record)
    }
    
    func testWhenLongRate() {
        let view = ExchangeRateCell(
            viewData: .makeMock(rate: longString)
        )

        assertSnapshots(of: view, record: record)
    }
    
    func testWhenLongTicker() {
        let view = ExchangeRateCell(
            viewData: .makeMock(ticker: longString)
        )

        assertSnapshots(of: view, record: record)
    }
    
    func testWhenLongTitle() {
        let view = ExchangeRateCell(
            viewData: .makeMock(title: longString)
        )

        assertSnapshots(of: view, record: record)
    }
    
    func testWhenLongDescription() {
        let view = ExchangeRateCell(
            viewData: .makeMock(rateDescription: longString)
        )

        assertSnapshots(of: view, record: record)
    }
}
