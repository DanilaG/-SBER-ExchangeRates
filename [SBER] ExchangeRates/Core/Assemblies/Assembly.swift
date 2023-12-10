//
//  Assembly.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

/// Сборщик
protocol Assembly {
    /// Результат сборки
    associatedtype Result
    /// Метод получения собранного результата
    /// - Returns: результат
    func get() -> Result
}
