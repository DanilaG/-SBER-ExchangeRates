//
//  NetworkServiceDecoder.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

import Foundation

/// Абстрактный класс декодер данных для `NetworkService`
class NetworkServiceDecoder {
    /// Декодирует данные в указанный тип
    /// - Parameters:
    ///   - type: тип получаемых данных
    ///   - data: данные для декодирования
    /// - Returns: результат декодирования
    func decode<Result: Decodable>(_ type: Result.Type, from data: Data) throws -> Result {
        fatalError("Must Override")
    }
}
