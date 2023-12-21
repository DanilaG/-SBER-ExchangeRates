//
//  ExchangeRatesRepositoryImplTests.swift
//  
//
//  Created by Danila on 21.12.2023.
//

import Network
import Nimble
import SwiftyMocky
import XCTest

@testable import ExchangeRates

final class ExchangeRatesRepositoryImplTests: XCTestCase {
    private let networkClient = NetworkClientMock()
    private var repository: ExchangeRatesRepositoryImpl!
    
    override func setUp() {
        repository = ExchangeRatesRepositoryImpl(
            networkService: NetworkServiceAssembly(client: networkClient).get()
        )
    }
    
    func testWhenValidResponseThenNoFailure() async throws {
        networkClient.given(
            .load(
                urlRequest: .any,
                willReturn: try Data(
                    contentsOf: Bundle.module.url(forResource: "GetRates", withExtension: "xml")!
                )
            )
        )
        
        let result = try? await repository.getRates()
        
        expect(result).notTo(beNil())
    }
}
