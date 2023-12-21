//
//  ExchangeRatesAdapter.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

// sourcery: AutoMockable
/// Адаптер курса валют
protocol ExchangeRatesAdapter {
    /// Адаптирует к view data
    /// - Parameter from: курсы валют
    /// - Returns: view data курсов валют
    func toViewData(from: [ExchangeRate]) -> [ExchangeRateViewData]
}

/// Реализация адаптера курса валют
final class ExchangeRatesAdapterImpl: ExchangeRatesAdapter {
    
    // MARK: - ExchangeRatesAdapter
    
    func toViewData(from rates: [ExchangeRate]) -> [ExchangeRateViewData] {
        rates.map {
            .init(
                code: $0.currency.code,
                name: $0.currency.name,
                rate: $0.rate.formatted(
                    .number.precision(.fractionLength(2...2))
                ),
                rateDescription: $0.nominal.formatted(
                    .currency(code: $0.currency.code).precision(.fractionLength(...0))
                )
            )
        }
    }
}
