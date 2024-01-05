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
    /// - Returns: моковые данные
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
    /// - Returns: моковые данные
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

extension ExchangeRateViewData {
    /// Создаёт мок для `ExchangeRateViewData`
    /// - Parameters:
    ///   - code: Код валюты
    ///   - name: Название валюты
    ///   - rate: Стоимость
    ///   - rateDescription: Описание стоимости
    /// - Returns: моковые данные
    static func makeMock(
        code: String = "CNY",
        name: String = "Китайский юань",
        rate: String = "12.58",
        rateDescription: String = "test"
    ) -> Self {
        .init(
            code: code,
            name: name,
            rate: rate,
            rateDescription: rateDescription
        )
    }
}

extension ExchangeRateCell.ViewData {
    /// Создаёт мок для `ExchangeRateCell.ViewData`
    /// - Parameters:
    ///   - code: Код валюты
    ///   - name: Название валюты
    ///   - rate: Стоимость
    ///   - rateDescription: Описание стоимости
    /// - Returns: моковые данные
    static func makeMock(
        ticker: String = "CNY",
        title: String = "Китайский юань",
        rate: String = "12.58",
        rateDescription: String = "test"
    ) -> Self {
        .init(
            ticker: ticker,
            title: title,
            rate: rate,
            rateDescription: rateDescription
        )
    }
}
