import SnapshotTesting
import SwiftUI

/// Осуществляет снепшот проверку view в тёмной и светлой теме вкладывая её в `NavigationView`
/// - Parameters:
///   - value: view
///   - recording: true если запись
///   - timeout: таймоут
///   - file: файл
///   - testName: название теста
///   - line: строка
public func assertSnapshotsInNavigationView<Value: View>(
  of value: @autoclosure () -> Value,
  record recording: Bool = false,
  timeout: TimeInterval = 5,
  file: StaticString = #file,
  testName: String = #function,
  line: UInt = #line
) {
    assertSnapshots(
        of: value(),
        as: [
            .navigationView(colorScheme: .dark),
            .navigationView(colorScheme: .light)
        ],
        record: recording,
        timeout: timeout,
        file: file,
        testName: testName,
        line: line
    )
}

/// Осуществляет снепшот проверку view в тёмной и светлой теме
/// - Parameters:
///   - value: view
///   - recording: true если запись
///   - timeout: таймоут
///   - file: файл
///   - testName: название теста
///   - line: строка
public func assertSnapshots<Value: View>(
  of value: @autoclosure () -> Value,
  record recording: Bool = false,
  timeout: TimeInterval = 5,
  file: StaticString = #file,
  testName: String = #function,
  line: UInt = #line
) {
    assertSnapshots(
        of: value(),
        as: [
            .image(colorScheme: .dark),
            .image(colorScheme: .light)
        ],
        record: recording,
        timeout: timeout,
        file: file,
        testName: testName,
        line: line
    )
}

extension Snapshotting where Value: View, Format == UIImage {
    /// Сопостовляет изображения `View`
    /// - Parameters:
    ///   - config: конфигурация
    ///   - colorScheme: цветовая схема
    /// - Returns: правило сопоставления
    public static func image(
        on config: ViewImageConfig = .iPhone12,
        colorScheme: ColorScheme
    ) -> Snapshotting {
        return Snapshotting<UIViewController, UIImage>.image(on: config).asyncPullback({ view in
            Async<UIViewController> { callback in
              UIView.setAnimationsEnabled(false)
              DispatchQueue.main.async {
                  let viewController = UIHostingController(rootView: view.environment(\.colorScheme, colorScheme))
                  viewController.view.backgroundColor = .clear
                  callback(viewController)
                  UIView.setAnimationsEnabled(true)
              }
            }
        })
    }
}

extension Snapshotting where Value: View, Format == UIImage {
    /// Сопостовляет изображения `View` вложенные в `NavigationView`
    /// - Parameters:
    ///   - config: конфигурация
    ///   - colorScheme: цветовая схема
    /// - Returns: правило сопоставления
    public static func navigationView(
        on config: ViewImageConfig = .iPhone12,
        colorScheme: ColorScheme
    ) -> Snapshotting {
        return Snapshotting<AnyView, UIImage>.image(on: config, colorScheme: colorScheme)
            .asyncPullback({ view in
                return Async<AnyView> { callback in
                    UIView.setAnimationsEnabled(false)
                    DispatchQueue.main.async {
                      callback(
                        AnyView(
                            NavigationView(content: { view })
                        )
                      )
                      UIView.setAnimationsEnabled(true)
                    }
                }
            })
    }
}
