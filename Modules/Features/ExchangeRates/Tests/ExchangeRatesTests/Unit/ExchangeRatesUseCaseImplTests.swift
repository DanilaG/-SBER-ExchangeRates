//
//  ExchangeRatesUseCaseImplTests.swift
//  
//
//  Created by Danila on 21.12.2023.
//

import Nimble
import SwiftyMocky
import XCTest

@testable import ExchangeRates

final class ExchangeRatesUseCaseImplTests: XCTestCase {
    
    private let repository = ExchangeRatesRepositoryMock()
    private var useCase: ExchangeRatesUseCaseImpl!
    
    override func setUp() {
        useCase = ExchangeRatesUseCaseImpl(
            rates: [],
            repository: repository
        )
    }
    
    func testWhenUpdateThenCallRepository() async throws {
        repository.given(.getRates(willReturn: []))
        
        try await useCase.update()
        
        repository.verify(.getRates(), count: .once)
    }
    
    func testWhenGetRatesWithoutQueryThenReturnAllResults() {
        let useCase = ExchangeRatesUseCaseImpl(
            rates: [
                .makeMock(currency: .makeMock(code: "A")),
                .makeMock(currency: .makeMock(code: "B"))
            ],
            repository: repository
        )
        
        let result = useCase.getRates(for: "")
        
        expect(result.count).to(equal(2))
    }
    
    func testWhenGetRatesWithQueryThenReturnByCode() {
        let useCase = ExchangeRatesUseCaseImpl(
            rates: [
                .makeMock(currency: .makeMock(code: "Abc")),
                .makeMock(currency: .makeMock(code: "Bc"))
            ],
            repository: repository
        )
        
        let result = useCase.getRates(for: "a")
        
        expect(result.count).to(equal(1))
    }

    func testWhenGetRatesWithQueryThenReturnByName() {
        let useCase = ExchangeRatesUseCaseImpl(
            rates: [
                .makeMock(currency: .makeMock(name: "Abc")),
                .makeMock(currency: .makeMock(name: "Bc"))
            ],
            repository: repository
        )
        
        let result = useCase.getRates(for: "a")
        
        expect(result.count).to(equal(1))
    }
    
    func testWhenGetRatesAfterUpdateThenResultSorted() async throws {
        let firstCode = "A"
        let secondCode = "X"
        repository.given(.getRates(
            willReturn: [
                .makeMock(currency: .makeMock(code: secondCode)),
                .makeMock(currency: .makeMock(code: firstCode))
            ]
        ))
        
        try await useCase.update()
        let result = useCase.getRates(for: "")
        
        expect(result[0].currency.code).to(equal(firstCode))
        expect(result[1].currency.code).to(equal(secondCode))
    }
    
    func testWhenGetRatesAfterInitThenResultSorted() {
        let firstCode = "A"
        let secondCode = "X"
        let useCase = ExchangeRatesUseCaseImpl(
            rates: [
                .makeMock(currency: .makeMock(code: secondCode)),
                .makeMock(currency: .makeMock(code: firstCode))
            ],
            repository: repository
        )
        
        let result = useCase.getRates(for: "")
        
        expect(result[0].currency.code).to(equal(firstCode))
        expect(result[1].currency.code).to(equal(secondCode))
    }
}
