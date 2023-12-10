//
//  NetworkClientAssembly.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

/// Сборщик сетевого клиента
struct NetworkClientAssembly: Assembly {
    
    // MARK: - Assembly
    
    func get() -> NetworkClient {
        HttpNetworkClient()
    }
}
