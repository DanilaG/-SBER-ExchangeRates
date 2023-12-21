//
//  StructureMocks.swift
//  
//
//  Created by Danila on 21.12.2023.
//

import Foundation

@testable import ExchangeRates

extension ExchangeRate {
    /// Создаёт мок для `ExchangeRate`
    /// - Parameters:
    ///   - currency: Валюта
    ///   - rate: Ставка в рублях
    ///   - nominal: Количество единиц валюты в ставке
    static func makeMock(
        currency: Currency = .makeMock(),
        rate: Decimal = 1,
        nominal: Int = 1
    ) -> Self {
        .init(
            currency: currency,
            rate: rate,
            nominal: nominal
        )
    }
}

extension Currency {
    /// Создаёт мок для `Currency`
    /// - Parameters:
    ///   - code: Код
    ///   - name: Название
    static func makeMock(
        code: String = "test",
        name: String = "test"
    ) -> Self {
        .init(
            code: code,
            name: name
        )
    }
}
