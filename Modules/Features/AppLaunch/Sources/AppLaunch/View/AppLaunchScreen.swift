//
//  AppLaunchScreen.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

import SwiftUI

/// Экран загрузки приложения
struct AppLaunchScreen<ViewModel: AppLaunchViewModel>: View {
    
    @StateObject private var viewModel: ViewModel
    
    // MARK: - View
    
    var body: some View {
        ZStack(alignment: .center) {
            Color("LaunchBackgroundColor")
            Image("LaunchLogo")
            VStack {
                Spacer()
                ProgressView()
                    .padding(.bottom, 52)
                    .tint(.white)
                    .controlSize(.regular)
            }
        }
        .ignoresSafeArea()
        .onAppear { viewModel.load() }
        .alert(
            "AppLaunch.error.network.title".moduleLocalized,
            isPresented: .constant(viewModel.state == .error),
            actions: { Button("AppLaunch.error.network.button".moduleLocalized, action: { viewModel.load() }) },
            message: { Text("AppLaunch.error.network.message".moduleLocalized) }
        )
    }
    
    /// Инициализатор
    /// - Parameter viewModel: view модель
    init(viewModel: ViewModel) {
        self._viewModel =  StateObject(wrappedValue: viewModel)
    }
}

fileprivate extension String {
    var moduleLocalized: String {
        Bundle.module.localizedString(forKey: self, value: nil, table: nil)
    }
}
