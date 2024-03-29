//
//  ExchangeRatesRepository.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

// sourcery: AutoMockable
/// Репозиторий получения стоймости валюты
public protocol ExchangeRatesRepository {
    /// Метод получения стоймости валюты
    /// - Returns: стоймости валют
    func getRates() async throws -> [ExchangeRate]
}
