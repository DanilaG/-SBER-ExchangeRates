//
//  AppLaunchOutput.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

/// Результаты работы экрана загрузки
public struct AppLaunchOutput<T> {
    /// Вызывается при завершении загрузки
    let loaded: @MainActor (T) -> Void
    
    /// Инициализатор
    /// - Parameter loaded: Вызывается при завершении загрузки
    public init(
        loaded: @escaping (T) -> Void
    ) {
        self.loaded = loaded
    }
}
