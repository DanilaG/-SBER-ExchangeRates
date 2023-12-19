//
//  MainCoordinator.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

import AppLaunch
import ExchangeRates
import SwiftUI

/// Основной координатор приложения
struct MainCoordinator: View {
    
    @State private var rates: [ExchangeRate]?
    
    // MARK: - View
    
    var body: some View {
        Group {
            if let rates {
                NavigationStack {
                    ExchangeRatesScreenAssembly(input: rates).get()
                }
            } else {
                AppLaunchScreenAssembly<[ExchangeRate]>(
                    input: .init(dataProvider: { try await ExchangeRatesRepositoryAssembly().get().getRates() }),
                    output: .init(loaded: { rates = $0 })
                ).get()
            }
        }
    }
}
