//
//  FKItem.swift
//  FeaturesKit
//
//  Created by Adam Foot on 02/08/2023.
//

import SwiftUI

/// A custom struct of data to create a new item to be shown in the list.
public struct FKItem: Identifiable, Sendable {

    /// A unique ID set by the system so that the struct conforms to Identifiable.
    public let id = UUID()

    /// The title `String` for the item.
    public let title: String

    /// The description `String` for the item.
    public let description: String

    /// An `Optional<String>` for the system image name of the item.
    public let systemImage: String?

    /// The image tint `Color` for the system image.
    public let imageTint: Color

    /// Initializes a custom struct of data to create a new featured item to be shown in a list.
    /// - Parameters:
    ///   - title: The title `String` for the item.
    ///   - description: The description `String` for the item.
    ///   - systemImage: An `Optional<String>` for the system image name of the item.
    ///   - imageTint: The image tint `Color` for the system image. Defaults to `.accentColor`.
    public init(
        title: String,
        description: String,
        systemImage: String?,
        imageTint: Color = .accentColor
    ) {
        self.title = title
        self.description = description
        self.systemImage = systemImage
        self.imageTint = imageTint
    }
    
    /// An example `FKItem` to be used in SwiftUI previews.
    static let example = FKItem(
        title: "Feature",
        description: "This is a feature description.",
        systemImage: "checkmark.circle",
        imageTint: .blue
    )
}
