//
//  FunctionalUtils.swift
//  Swift_2048
//
//  Created by Rolf, Eric on 7/23/19.
//  Copyright © 2019 Fifth Third Bank. All rights reserved.
//

/// Function to bind a genaric type and closure together. This is used to allow us to
/// respond to geometry event.
/// - Parameter x: `Generic` Type that will pass a result to the closure
/// - Parameter closure: The closure that will take the output of the
///                      input function that is provided and perform
///                      operations on it.
/// 
/// ```swift
///
///  func layoutTraits(for proxy: GeometryProxy) -> LayoutTraits {
///     ...
///     return traits
///  }
///
///  GeometryReader { proxy in
///           bind( layoutTraits(for: proxy) ) { layoutTraits in
///             // You now have access to the traits that are bound to the proxy.
///           }
///  }
/// ```
func bind<T, U>(_ x: T, _ closure: (T) -> U) -> U {
    return closure(x)
}

extension Array where Element: Hashable {

    /// Gets a count of unique `Element`s in a collection.
    /// - Returns: `[Element: Int]`
    var histogram: [Element: Int] {
        return self.reduce(into: [:]) { counts, elem in counts[elem, default: 0] += 1 }
    }
}
