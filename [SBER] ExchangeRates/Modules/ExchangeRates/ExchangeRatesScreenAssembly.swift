//
//  ExchangeRatesScreenAssembly.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

import SwiftUI

/// Сборщик экрана списка валют
struct ExchangeRatesScreenAssembly: ScreenAssembly {
    
    private let input: [ExchangeRate]
    
    /// Инициализатор
    /// - Parameter input: входные параметры
    init(
        input: [ExchangeRate]
    ) {
        self.input = input
    }
    
    // MARK: - ScreenAssembly
    
    func get() -> some View {
        ExchangeRatesScreen(
            viewModel: ExchangeRatesViewModelImpl(
                useCase: ExchangeRatesUseCaseImpl(
                    rates: input,
                    repository: ExchangeRatesRepositoryAssembly().get()
                ),
                adapter: ExchangeRatesAdapterImpl()
            )
        )
    }
}
