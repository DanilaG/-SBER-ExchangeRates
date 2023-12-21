//
//  ExchangeRatesUseCase.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

import Foundation

// sourcery: AutoMockable
/// Use case для экрана списка валют
protocol ExchangeRatesUseCase {
    /// Предоставляет стоймость валют для заданного параметра писка
    /// - Parameter searchQuery: параметр поиска
    /// - Returns: стоймость валют
    func getRates(for searchQuery: String) -> [ExchangeRate]
    /// Обновляет список валют
    func update() async throws
}

/// Реализация use case для экрана списка валют
final class ExchangeRatesUseCaseImpl: ExchangeRatesUseCase {
    
    private var rates: [ExchangeRate]
    private let repository: ExchangeRatesRepository
    
    /// Инициализатор
    /// - Parameters:
    ///   - rates: список валют
    ///   - repository: репозиторий для обновления
    init(
        rates: [ExchangeRate],
        repository: ExchangeRatesRepository
    ) {
        self.rates = rates.sorted()
        self.repository = repository
    }
    
    // MARK: - ExchangeRatesUseCase
    
    func getRates(for searchQuery: String) -> [ExchangeRate] {
        guard !searchQuery.isEmpty else { return rates }
        let searchQuery = searchQuery.lowercased()
        return rates
            .filter({
                $0.currency.name.lowercased().contains(searchQuery) ||
                $0.currency.code.lowercased().contains(searchQuery)
            })
    }
    
    func update() async throws {
        rates = try await repository.getRates().sorted()
    }
}

// MARK: - [ExchangeRate] + sorted

fileprivate extension [ExchangeRate] {
    func sorted() -> Self {
        sorted(by: { $0.currency.code < $1.currency.code })
    }
}
