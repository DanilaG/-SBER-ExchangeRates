//
//  Currency.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

/// Валюта
public struct Currency {
    /// Код
    public let code: String
    /// Название
    public let name: String
    
    /// Инициализатор
    /// - Parameters:
    ///   - code: Код
    ///   - name: Название
    public init(
        code: String,
        name: String
    ) {
        self.code = code
        self.name = name
    }
}
