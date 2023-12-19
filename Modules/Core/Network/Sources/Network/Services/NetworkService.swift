//
//  NetworkService.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

import Foundation

/// Сервис для предоставления данных из сети
public final class NetworkService {
    
    private let networkClient: NetworkClient
    private let decoder: NetworkServiceDecoder
    
    /// Инициализатор
    /// - Parameters:
    ///   - networkClient: сетевой клиент
    ///   - decoder: декодер
    init(
        networkClient: NetworkClient,
        decoder: NetworkServiceDecoder
    ) {
        self.networkClient = networkClient
        self.decoder = decoder
    }
    
    /// Метод загрузки данных
    /// - Parameters:
    ///   - urlRequest: запрос
    ///   - resultType: тип dto
    /// - Returns: результат
    public func load<Dto: NetworkDto>(
        urlRequest: URLRequest,
        _ dtoType: Dto.Type
    ) async throws -> Dto.Domain {
        try await decoder.decode(
            dtoType,
            from: networkClient.load(urlRequest: urlRequest)
        ).asDomain
    }
}
