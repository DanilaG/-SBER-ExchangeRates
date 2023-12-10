//
//  ExchangeRatesViewModel.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

import Foundation

/// Данные для отображения курса валюты
struct ExchangeRateViewData {
    /// Код валюты
    let code: String
    /// Название валюты
    let name: String
    /// Стоимость
    let rate: String
    /// Описание стоимости
    let rateDescription: String
}

/// Протокол view model экрана списка валют
@MainActor
protocol ExchangeRatesViewModel: ObservableObject {
    /// Курсы валют
    var rates: [ExchangeRateViewData] { get }
    /// Наличие ошибки перезагрузки
    var reloadError: Bool { get }
    /// Параметры поиска
    var searchQuery: String { get set }
    /// Обновление данных экрана
    func reload() async
}

/// Реализация view model экрана списка валют
@MainActor
class ExchangeRatesViewModelImpl: ExchangeRatesViewModel {
    
    // MARK: - CurrencyViewModel
    
    var rates: [ExchangeRateViewData] {
        adapter.toViewData(from: useCase.getRates(for: searchQuery))
    }
    
    var searchQuery: String = "" {
        didSet {
            guard oldValue != searchQuery else { return }
            objectWillChange.send()
        }
    }
    
    var reloadError: Bool = false
    
    private let useCase: ExchangeRatesUseCase
    private let adapter: ExchangeRatesAdapter
    
    /// Инициализатор
    /// - Parameters:
    ///   - useCase: use case
    ///   - adapter: адаптер
    init(
        useCase: ExchangeRatesUseCase,
        adapter: ExchangeRatesAdapter
    ) {
        self.useCase = useCase
        self.adapter = adapter
    }
    
    // MARK: - CurrencyViewModel
    
    func reload() async {
        do {
            try await useCase.update()
            reloadError = false
        } catch {
            reloadError = true
        }
        objectWillChange.send()
    }
}
