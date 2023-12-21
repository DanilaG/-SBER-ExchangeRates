//
//  AppLaunchViewModelImplTests.swift
//  
//
//  Created by Danila on 22.12.2023.
//

import Combine
import Nimble
import XCTest

@testable import AppLaunch

@MainActor
final class AppLaunchViewModelImplTests: XCTestCase {
    
    private var dataProvider: () async throws -> Int = { return 0 }
    private var output: (Int) -> () = { _ in }
    private var viewModel: AppLaunchViewModelImpl<Int>!
    
    private var subscriptions = Set<AnyCancellable>()
    
    override func setUp() {
        viewModel = AppLaunchViewModelImpl(
            input: .init(dataProvider: { [weak self] in try await self?.dataProvider() ?? 0 }),
            output: .init(loaded: { [weak self] in self?.output($0) })
        )
    }

    func testWhenCreatedThenInitialState() async {
        expect(self.viewModel.state).to(equal(.initial))
    }
    
    func testWhenLoadingThenLoadingState() async {
        dataProvider = {
            return 0
        }
        
        self.viewModel.load()
        
        expect(self.viewModel.state).to(equal(.loading))
    }
    
    func testWhenLoadingThenPublishLoading() async {
        dataProvider = {
            return 0
        }
        
        await waitUntil { @MainActor done in
            self.viewModel.$state
                .drop(while: { $0 != .loading })
                .sink(receiveValue: { _ in done() })
                .store(in: &self.subscriptions)
            
            self.viewModel.load()
        }
    }
    
    func testWhenLoadedThenCallOutput() async {
        dataProvider = {
            try await Task.sleep(for: .milliseconds(20))
            return 0
        }
        
        await waitUntil { @MainActor done in
            self.output = { _ in done() }
            
            self.viewModel.load()
        }
    }
    
    func testWhenLoadingFailedThenPublishError() async {
        dataProvider = {
            throw CancellationError()
        }
        
        await waitUntil { @MainActor done in
            self.viewModel.$state
                .drop(while: { $0 != .error })
                .sink(receiveValue: { _ in done() })
                .store(in: &self.subscriptions)
            
            self.viewModel.load()
        }
    }
}
