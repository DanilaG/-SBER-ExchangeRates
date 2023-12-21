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
final class AppLaunchViewModelImpl<T>: AppLaunchViewModel {
    
    @MainActor @Published
    var state: AppLaunchViewState = .initial

    private let input: AppLaunchInput<T>
    private let output: AppLaunchOutput<T>
    
    /// Инициализатор
    /// - Parameters:
    ///   - input: входные данные
    ///   - output: сущность для сообщения результатов работы
    init(
        input: AppLaunchInput<T>,
        output: AppLaunchOutput<T>
    ) {
        self.output = output
        self.input = input
    }
    
    // MARK: - AppLaunchViewModel
    
    @MainActor
    func load() {
        guard state != .loading else { return }
        state = .loading
        Task {
            do {
                try await output.loaded(
                    input.dataProvider()
                )
            } catch {
                print("!!==error")
                state = .error
            }
        }
    }
}
