//
//  NetworkServiceAssembly.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

import Assembler

/// Сборщик сервиса для работы с сетью
public struct NetworkServiceAssembly: Assembly {
    
    private static let service = NetworkService(
        networkClient: NetworkClientAssembly().get(),
        decoder: XmlNetworkServiceDecoder()
    )
    
    /// Инициализатор
    public init() {}
    
    // MARK: - Assembly
    
    public func get() -> NetworkService {
        NetworkServiceAssembly.service
    }
}
