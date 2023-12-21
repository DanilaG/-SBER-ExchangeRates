//
//  ExchangeRatesAdapterImplTests.swift
//  
//
//  Created by Danila on 21.12.2023.
//

import Nimble
import SwiftyMocky
import XCTest

@testable import ExchangeRates

final class ExchangeRatesAdapterImplTests: XCTestCase {
    
    let adapter = ExchangeRatesAdapterImpl()
    
    func testWhenNoInputDataThenNoAdaptedData() {
        let input: [ExchangeRate] = []
        
        let result = adapter.toViewData(from: input)
        
        expect(result.count).to(equal(input.count))
    }
    
    func testWhenSomeNumberInputDataThenAdaptedDataEqualNumber() {
        let input: [ExchangeRate] = [.makeMock(), .makeMock(), .makeMock()]
        
        let result = adapter.toViewData(from: input)
        
        expect(result.count).to(equal(input.count))
    }
    
    func testWhenShortRateThenFractionLength2Digets() {
        let rate: ExchangeRate = .makeMock(rate: 1.0)
        
        let result = adapter.toViewData(from: [rate]).first!

        expect(result.rate).to(equal("1.00"))
    }
    
    func testWhenLongRateThenFractionLength2Digets() {
        let rate: ExchangeRate = .makeMock(rate: 1.3333)
        
        let result = adapter.toViewData(from: [rate]).first!
        
        expect(result.rate).to(equal("1.33"))
    }
}
