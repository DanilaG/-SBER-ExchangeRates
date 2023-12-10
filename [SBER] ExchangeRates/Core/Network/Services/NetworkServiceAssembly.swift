//
//  NetworkServiceAssembly.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

/// Сборщик сервиса для работы с сетью
struct NetworkServiceAssembly: Assembly {
    
    private static let service = NetworkService(
        networkClient: NetworkClientAssembly().get(),
        decoder: XmlNetworkServiceDecoder()
    )
    
    // MARK: - Assembly
    
    func get() -> NetworkService {
        NetworkServiceAssembly.service
    }
}
