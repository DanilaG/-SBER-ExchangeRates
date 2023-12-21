//
//  ExchangeRatesViewModelImplTests.swift
//  
//
//  Created by Danila on 21.12.2023.
//

import Combine
import Nimble
import SwiftyMocky
import XCTest

@testable import ExchangeRates

@MainActor
final class ExchangeRatesViewModelImplTests: XCTestCase {
        
    private let useCase = ExchangeRatesUseCaseMock()
    private let adapter = ExchangeRatesAdapterMock()
    private var viewModel: ExchangeRatesViewModelImpl!
    
    private var subscriptions = Set<AnyCancellable>()

    override func setUp() {
        viewModel = ExchangeRatesViewModelImpl(
            useCase: useCase,
            adapter: adapter
        )
    }
    
    func testWhenGetRatesThenCallAdapter() {
        adapter.given(.toViewData(from: .any, willReturn: []))
        useCase.given(.getRates(for: .any, willReturn: []))

        _ = viewModel.rates

        adapter.verify(.toViewData(from: .any), count: .once)
    }
    
    func testWhenNoSearchQueryThenCallUseCaseWithEmptyQuery() {
        adapter.given(.toViewData(from: .any, willReturn: []))
        useCase.given(.getRates(for: .any, willReturn: []))

        _ = viewModel.rates

        useCase.verify(.getRates(for: .value("")), count: .once)
    }
    
    func testWhenNotEmptySearchQueryThenCallUseCaseWithQuery() {
        let searchQuery = "test"
        adapter.given(.toViewData(from: .any, willReturn: []))
        useCase.given(.getRates(for: .any, willReturn: []))
        
        viewModel.searchQuery = searchQuery
        _ = viewModel.rates
        
        useCase.verify(.getRates(for: .value(searchQuery)), count: .once)
    }
    
    func testWhenChangeSearchQueryThenCallPublisher() async {
        adapter.given(.toViewData(from: .any, willReturn: []))
        useCase.given(.getRates(for: .any, willReturn: []))
        
        await waitUntil { @MainActor done in
            self.viewModel.objectWillChange
                .sink(receiveValue: done)
                .store(in: &self.subscriptions)
            
            self.viewModel.searchQuery = "test"
        }
    }

    func testWhenReloadDataThenCallPublisher() async {
        await waitUntil { @MainActor done in
            self.viewModel.objectWillChange
                .sink(receiveValue: done)
                .store(in: &self.subscriptions)
            
            await self.viewModel.reload()
        }
    }
    
    func testWhenReloadDataThenCallUseCase() async {
        await viewModel.reload()
        
        useCase.verify(.update())
    }
    
    func testWhenSuccessReloadDataThenNoError() async {
        await viewModel.reload()
        
        expect(self.viewModel.reloadError).to(beFalse())
    }
    
    func testWhenReloadDataErrorThenNoError() async {
        useCase.given(.update(willThrow: CancellationError()))
        
        await viewModel.reload()
        
        expect(self.viewModel.reloadError).to(beTrue())
    }
}
