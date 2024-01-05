//
//  AppLaunchScreenSnapshotTests.swift
//  
//
//  Created by Danila on 22.12.2023.
//

import SwiftyMocky
import TestsExtension
import XCTest

@testable import AppLaunch

@MainActor
final class AppLaunchScreenSnapshotTests: XCTestCase {
    
    private let record = false
    
    private let viewModel = AppLaunchViewModelMock()
    
    func testWhenLoading() {
        viewModel.given(.state(getter: .loading))
        let view = AppLaunchScreen(viewModel: viewModel)

        assertSnapshots(of: view, record: record)
    }
}

