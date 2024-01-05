//
//  ExchangeRatesScreenSnapshotTests.swift
//  
//
//  Created by Danila on 04.01.2024.
//

import SwiftUI
import SwiftyMocky
import TestsExtension
import XCTest

@testable import ExchangeRates

@MainActor
final class ExchangeRatesScreenSnapshotTests: XCTestCase {
    
    private let record = false
    private let viewModel = ExchangeRatesViewModelMock()
    
    func testWhenNoData() {
        viewModel.given(.reloadError(getter: false))
        viewModel.given(.searchQuery(getter: ""))
        viewModel.given(.rates(getter: []))

        let view = ExchangeRatesScreen(viewModel: viewModel)

        assertSnapshotsInNavigationView(of: view, record: record)
    }
    
    func testWhenWithData() {
        viewModel.given(.reloadError(getter: false))
        viewModel.given(.searchQuery(getter: ""))
        viewModel.given(.rates(getter: [.makeMock()]))
        
        let view = ExchangeRatesScreen(viewModel: viewModel)

        assertSnapshotsInNavigationView(of: view, record: record)
    }
}
