//
//  AppLaunchOutput.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

/// Результаты работы экрана загрузки
struct AppLaunchOutput {
    /// Вызывается при завершении загрузки
    let loaded: @MainActor ([ExchangeRate]) -> Void
}
