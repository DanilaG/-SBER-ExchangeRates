//
//  AppLaunchViewModel.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

import Foundation

/// View model экрана загрузки
protocol AppLaunchViewModel: ObservableObject {
    /// Состояние загрузки
    @MainActor
    var state: AppLaunchViewState { get }
    /// Начинает загрузку данных
    @MainActor
    func load()
}

/// Состояния view экрана загрузки
enum AppLaunchViewState {
    /// Начальное
    case initial
    /// Загрузка
    case loading
    /// Ошибка
    case error
}

/// Реализация view model экрана загрузки
final class AppLaunchViewModelImpl: AppLaunchViewModel {
    
    @MainActor @Published
    var state: AppLaunchViewState = .initial
    
    private let output: AppLaunchOutput
    private let ratesRepository: ExchangeRatesRepository
    
    /// Инициализатор
    /// - Parameters:
    ///   - output: объект для сообщения результатов работы
    ///   - ratesRepository: репозиторий стоймости валюты
    init(
        output: AppLaunchOutput,
        ratesRepository: ExchangeRatesRepository
    ) {
        self.output = output
        self.ratesRepository = ratesRepository
    }
    
    // MARK: - AppLaunchViewModel
    
    @MainActor
    func load() {
        guard state != .loading else { return }
        Task {
            do {
                try await output.loaded(
                    ratesRepository.getRates()
                )
            } catch {
                state = .error
            }
        }
    }
}
