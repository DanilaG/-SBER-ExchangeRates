//
//  AppLaunchScreenAssembly.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

import SwiftUI

/// Сборщик экрана загрузки
struct AppLaunchScreenAssembly: ScreenAssembly {
    
    private let output: AppLaunchOutput
    
    /// Инициализатор
    /// - Parameters:
    ///   - output: результат работы модуля
    init(
        output: AppLaunchOutput
    ) {
        self.output = output
    }
    
    // MARK: - ScreenAssembly
    
    func get() -> some View {
        AppLaunchScreen(
            viewModel: AppLaunchViewModelImpl(
                output: output,
                ratesRepository: ExchangeRatesRepositoryAssembly().get()
            )
        )
    }
}
