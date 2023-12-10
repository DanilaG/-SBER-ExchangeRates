//
//  ExchangeRate.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

import Foundation

/// Курс валюты
struct ExchangeRate {
    /// Валюта
    let currency: Currency
    /// Ставка в рублях
    let rate: Decimal
    /// Количество единиц валюты в ставке
    let nominal: Int
}
