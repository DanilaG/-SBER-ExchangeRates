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
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
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
            "AppLaunch.error.network.title",
            isPresented: .constant(viewModel.state == .error),
            actions: { Button("AppLaunch.error.network.button", action: { viewModel.load() }) },
            message: { Text("AppLaunch.error.network.message") }
        )
    }
    
    /// Инициализатор
    /// - Parameter viewModel: view модель
    init(viewModel: ViewModel) {
        self._viewModel =  StateObject(wrappedValue: viewModel)
    }
}
