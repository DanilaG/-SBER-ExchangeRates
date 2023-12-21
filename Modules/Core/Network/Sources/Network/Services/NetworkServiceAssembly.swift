//
//  NetworkServiceAssembly.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

import Assembler

/// Сборщик сервиса для работы с сетью
public struct NetworkServiceAssembly: Assembly {
    private static let decoder = XmlNetworkServiceDecoder()
    private let client: NetworkClient
    
    /// Инициализатор
    public init(client: NetworkClient? = nil) {
        self.client = client ?? NetworkClientAssembly().get()
    }
    
    // MARK: - Assembly
    
    public func get() -> NetworkService {
        NetworkService(
           networkClient: client,
           decoder: NetworkServiceAssembly.decoder
       )
    }
}
