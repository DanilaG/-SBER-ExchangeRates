//
//  HttpNetworkClient.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

import Foundation

/// Сетевой клиент для http запросов
final class HttpNetworkClient: NetworkClient {
    /// Ошибки
    enum Errors: Error {
        /// Ошибка в ответе со статус кодом
        case response(statusCode: Int)
        /// Неизвестная ошибка
        case unknown
    }
    
    private static let session: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.urlCache = nil
        configuration.timeoutIntervalForRequest = 10
        configuration.timeoutIntervalForResource = 10
        return URLSession(configuration: configuration)
    }()
    
    // MARK: - NetworkClient
    
    func load(urlRequest: URLRequest) async throws -> Data {
        guard
            let (data, response) = try? await HttpNetworkClient.session.data(for: urlRequest),
            let response = response as? HTTPURLResponse
        else { throw Errors.unknown }
        
        guard (200..<300).contains(response.statusCode) else {
            throw Errors.response(statusCode: response.statusCode)
        }
        
        return data
    }
}
