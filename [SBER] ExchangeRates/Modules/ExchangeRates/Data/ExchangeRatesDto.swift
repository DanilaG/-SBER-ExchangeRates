//
//  ExchangeRatesDto.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

import Foundation

/// Dto списка курса валют
struct ExchangeRatesDto: NetworkDto {
    /// Курсы
    let rates: [ExchangeRateDto]
    
    var asDomain: [ExchangeRate] {
        get throws {
            try rates.map({ try $0.asDomain })
        }
    }
    
    // MARK: - Decodable
    
    enum CodingKeys: String, CodingKey {
        case rates = "Valute"
    }
}

/// Dto курса валюты
struct ExchangeRateDto: NetworkDto {
    /// Код валюты
    let code: String
    /// Название валюты
    let name: String
    /// Цена за слот
    let rate: String
    /// Количество валюты в слоте
    let nominal: Int
    
    var asDomain: ExchangeRate {
        get throws {
            guard
                let rate = Decimal(string: rate.replacingOccurrences(of: ",", with: "."))
            else { throw DtoTransitionErrors.domainUnrepresentable }
            
            return .init(
                currency: .init(
                    code: code,
                    name: name
                ),
                rate: rate,
                nominal: nominal
            )
        }
    }
    
    // MARK: - Decodable
    
    enum CodingKeys: String, CodingKey {
        case code = "CharCode"
        case name = "Name"
        case rate = "Value"
        case nominal = "Nominal"
    }
}
