//
//  ScreenAssembly.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

import SwiftUI

/// Сборщик экранов
public protocol ScreenAssembly {
    /// Результат сборки
    associatedtype Screen: View
    /// Метод получения собранного экрана
    /// - Returns: экран
    @MainActor
    func get() -> Screen
}
