//
//  ExchangeRatesRepository.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

/// Репозиторий получения стоймости валюты
protocol ExchangeRatesRepository {
    /// Метод получения стоймости валюты
    /// - Returns: стоймости валют
    func getRates() async throws -> [ExchangeRate]
}
