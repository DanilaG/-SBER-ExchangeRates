//
//  ExchangeRateCell.swift
//  [SBER] ExchangeRates
//
//  Created by Danila on 10.12.2023.
//

import SwiftUI

/// Ячейка валюты
struct ExchangeRateCell: View {
    /// Данные для отображения
    struct ViewData {
        /// Тикер валюты
        let ticker: String
        /// Заголовок валюты
        let title: String
        /// Стоимость
        let rate: String
        /// Описание стоимость
        let rateDescription: String
    }
    
    private let viewData: ViewData
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4.0) {
                Text(viewData.ticker)
                    .font(.title3)
                Text(viewData.title)
                    .font(.subheadline)
                    .foregroundColor(Color(uiColor: .secondaryLabel))
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 4.0) {
                Text(viewData.rate)
                    .font(.title3)
                Text(viewData.rateDescription)
                    .font(.subheadline)
                    .foregroundColor(Color(uiColor: .secondaryLabel))
            }
        }
        .lineLimit(1)
    }
    
    /// Инициализатор
    /// - Parameter viewData: данные для отображения
    init(viewData: ViewData) {
        self.viewData = viewData
    }
}

// MARK: - Preview

struct ExchangeRateCell_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeRateCell(
            viewData: .init(
                ticker: "USD",
                title: "Доллар США",
                rate: 92.formatted(.currency(code: "RUB")),
                rateDescription: "1 $"
            )
        )
    }
}
