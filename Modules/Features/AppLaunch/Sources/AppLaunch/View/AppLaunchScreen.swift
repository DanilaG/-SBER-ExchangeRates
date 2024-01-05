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
            Color(R.color.launchBackgroundColor)
            Image(R.image.launchLogo)
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
            R.string.localizable.appLaunchErrorNetworkTitle(),
            isPresented: .constant(viewModel.state == .error),
            actions: { Button(R.string.localizable.appLaunchErrorNetworkButton(), action: { viewModel.load() }) },
            message: { Text(R.string.localizable.appLaunchErrorNetworkMessage()) }
        )
    }
    
    /// Инициализатор
    /// - Parameter viewModel: view модель
    init(viewModel: ViewModel) {
        self._viewModel =  StateObject(wrappedValue: viewModel)
    }
}
