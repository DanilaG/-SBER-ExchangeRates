//
//  NetworkDto.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

import Foundation

/// Dto для работы с сетью
protocol NetworkDto: Decodable {
    /// Тип доменной модели
    associatedtype Domain
    /// Представление в виде доменной модели
    var asDomain: Domain { get throws }
}

/// Ошибки предстовления в доменной модели
enum DtoTransitionErrors: Error {
    /// Непредставимо в виде dto
    case domainUnrepresentable
}
