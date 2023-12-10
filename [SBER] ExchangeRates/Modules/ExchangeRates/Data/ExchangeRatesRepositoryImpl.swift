//
//  ExchangeRatesRepositoryImpl.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

import Foundation

/// Реализация репозиторийя получения стоимости валюты
final class ExchangeRatesRepositoryImpl: ExchangeRatesRepository {
    
    private enum Errors: Error {
        /// Не удалось создать url
        case noUrl
    }
    
    private let networkService: NetworkService
    
    /// Инициализатор
    /// - Parameter networkService: сервис для работы с сетью
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    // MARK: - ExchangeRatesRepository
    
    func getRates() async throws -> [ExchangeRate] {
        guard let url = URL(string: "https://www.cbr.ru/scripts/XML_daily.asp") else {
            throw Errors.noUrl
        }
        
        return try await networkService.load(
            urlRequest: URLRequest(url: url),
            ExchangeRatesDto.self
        )
    }
}
