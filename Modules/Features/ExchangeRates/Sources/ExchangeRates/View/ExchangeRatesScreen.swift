//
//  ExchangeRatesScreen.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

import SwiftUI

/// Экран списка валют
struct ExchangeRatesScreen<ViewModel: ExchangeRatesViewModel>: View {
    
    @StateObject private var viewModel: ViewModel
    
    // MARK: - View
    
    var body: some View {
        Group {
            if !viewModel.rates.isEmpty {
                list
            } else {
                notFound
            }
        }
        .listStyle(.sidebar)
        .searchable(
            text: .init(
                get: { viewModel.searchQuery },
                set: { viewModel.searchQuery = $0 }
            )
        )
        .refreshable {
            await viewModel.reload()
        }
        .alert(
            R.string.localizable.exchangeRatesErrorNetworkTitle(),
            isPresented: .constant(viewModel.reloadError),
            actions: { Button(R.string.localizable.exchangeRatesErrorNetworkButton(), action: {}) },
            message: { Text(R.string.localizable.exchangeRatesErrorNetworkMessage()) }
        )
        .autocorrectionDisabled()
        .navigationTitle(R.string.localizable.exchangeRatesTitle())
    }
    
    /// Инициализатор
    /// - Parameter viewModel: view модель
    init(viewModel: ViewModel) {
        self._viewModel =  StateObject(wrappedValue: viewModel)
    }
    
    private var list: some View {
        List(viewModel.rates, id: \.code) {
            ExchangeRateCell(
                viewData: .init(
                    ticker: $0.code,
                    title: $0.name,
                    rate: $0.rate,
                    rateDescription: $0.rateDescription
                )
            )
        }
        .edgesIgnoringSafeArea(.bottom)
        .scrollDismissesKeyboard(.immediately)
    }
    
    private var notFound: some View {
        ZStack {
            Color(uiColor: .systemGroupedBackground)
                .ignoresSafeArea()
            VStack(alignment: .center, spacing: 8) {
                Image(systemName: "magnifyingglass")
                    .imageScale(.large)
                Text(R.string.localizable.exchangeRatesNotFound())
            }
        }
    }
}

fileprivate extension String {
    var moduleLocalized: String {
        Bundle.module.localizedString(forKey: self, value: nil, table: nil)
    }
}
