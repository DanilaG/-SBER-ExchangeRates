//
//  NetworkClient.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

import Foundation

// sourcery: AutoMockable
/// Сетевой клиент
public protocol NetworkClient {
    /// Метод получения данных
    /// - Parameter urlRequest: запрос
    /// - Returns: данные
    func load(urlRequest: URLRequest) async throws -> Data
}
