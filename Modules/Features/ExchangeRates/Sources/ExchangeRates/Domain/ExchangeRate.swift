//
//  ExchangeRate.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

import Foundation

/// Курс валюты
public struct ExchangeRate {
    /// Валюта
    public let currency: Currency
    /// Ставка в рублях
    public let rate: Decimal
    /// Количество единиц валюты в ставке
    public let nominal: Int
    
    /// Инициализатор
    /// - Parameters:
    ///   - currency: Валюта
    ///   - rate: Ставка в рублях
    ///   - nominal: Количество единиц валюты в ставке
    public init(
        currency: Currency,
        rate: Decimal,
        nominal: Int
    ) {
        self.currency = currency
        self.rate = rate
        self.nominal = nominal
    }
}
