//
//  MainCoordinator.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

import SwiftUI

/// Основной координатор приложения
struct MainCoordinator: View {
    
    @State private var rates: [ExchangeRate]?
    
    // MARK: - View
    
    var body: some View {
        Group {
            if let rates {
                ContentView()
            } else {
                AppLaunchScreenAssembly(
                    output: .init(loaded: { rates = $0 })
                ).get()
            }
        }
    }
}
