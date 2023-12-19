//
//  XmlNetworkServiceDecoder.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

import Foundation
import XMLCoder

/// Декодер XML
final class XmlNetworkServiceDecoder: NetworkServiceDecoder {
    
    private static let decoder = XMLDecoder()
    
    // MARK: - NetworkServiceDecoder
    
    override func decode<Result: Decodable>(_ type: Result.Type, from data: Data) throws -> Result {
        try XmlNetworkServiceDecoder.decoder.decode(type, from: data)
    }
}
