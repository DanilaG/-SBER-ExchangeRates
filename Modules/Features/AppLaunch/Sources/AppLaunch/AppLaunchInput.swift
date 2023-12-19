//
//  AppLaunchInput.swift
//  
//
//  Created by Danila on 12.12.2023.
//

/// Входные данные работы экрана загрузки
public struct AppLaunchInput<T> {
    /// Тип провайдера данных
    public typealias DataProvider = (() async throws -> T)
    
    /// Провайдер данных
    let dataProvider: DataProvider
    
    /// Инициализатор
    /// - Parameter dataProvider: провайдер данных
    public init(
        dataProvider: @escaping DataProvider
    ) {
        self.dataProvider = dataProvider
    }
}
