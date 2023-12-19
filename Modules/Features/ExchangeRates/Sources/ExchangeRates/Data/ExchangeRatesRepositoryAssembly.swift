//
//  ExchangeRatesRepositoryAssembly.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

import Assembler
import Network

/// Сборщик репозитория получения стоймости валюты
public struct ExchangeRatesRepositoryAssembly: Assembly {
    
    /// Инициализатор
    public init() {}
    
    // MARK: - Assembly
    
    public func get() -> ExchangeRatesRepository {
        ExchangeRatesRepositoryImpl(
            networkService: NetworkServiceAssembly().get()
        )
    }
}
