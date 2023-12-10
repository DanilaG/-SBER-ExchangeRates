//
//  ExchangeRatesRepositoryAssembly.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

/// Сборщик репозитория получения стоймости валюты
struct ExchangeRatesRepositoryAssembly: Assembly {
    
    // MARK: - Assembly
    
    func get() -> ExchangeRatesRepository {
        ExchangeRatesRepositoryImpl(
            networkService: NetworkServiceAssembly().get()
        )
    }
}
