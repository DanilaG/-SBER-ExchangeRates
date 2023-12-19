//
//  AppLaunchScreenAssembly.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

import Assembler
import SwiftUI

/// Сборщик экрана загрузки
public struct AppLaunchScreenAssembly<T>: ScreenAssembly {
    
    private let input: AppLaunchInput<T>
    private let output: AppLaunchOutput<T>
    
    /// Инициализатор
    /// - Parameters:
    ///   - input: входные данные модуля
    ///   - output: результат работы модуля
    public init(
        input: AppLaunchInput<T>,
        output: AppLaunchOutput<T>
    ) {
        self.input = input
        self.output = output
    }
    
    // MARK: - ScreenAssembly
    
    public func get() -> some View {
        AppLaunchScreen(
            viewModel: AppLaunchViewModelImpl(
                input: input,
                output: output
            )
        )
    }
}
