//
//  FKConfiguration.swift
//  FeaturesKit
//
//  Created by Adam Foot on 29/09/2023.
//

import Foundation

/// A custom struct containing details for FeaturesKit.
public struct FKConfiguration: Sendable {

    /// The `String` to display at the top of the screen
    /// e.g. What's New, What's New in App or Welcome to App.
    public let title: String

    /// An array of featured items to display in a the list.
    public let items: [FKItem]

    /// A `Bool` indicating whether the continue button should be shown.
    public let showContinueButton: Bool

    /// A `String` containing the continue button title.
    public let continueButtonTitle: String

    /// An optional completion block to perform when the continue button is tapped.
    public let continueAction: (@Sendable () -> Void)?

    /// Initializes a new `FKConfiguration` struct which contains details about the
    /// features to display.
    /// - Parameters:
    ///   - title: The `String` to display at the top of the screen
    ///   e.g. What's New, What's New in App or Welcome to App.
    ///   - items: An array of featured items to display in a list.
    ///   - showContinueButton: A `Bool` indicating whether the continue button should be shown. Defaults to `true`.
    ///   - continueButtonTitle: A `String` containing the continue button title. Defaults to `nil` which results in Continue being used.
    ///   - continueAction: An optional completion block to perform when the continue button is tapped. Defaults to `nil` which results in the view being dismissed.
    public init(
        title: String,
        items: [FKItem],
        showContinueButton: Bool = true,
        continueButtonTitle: String? = nil,
        continueAction: (@Sendable () -> Void)? = nil
    ) {
        self.title = title
        self.items = items
        self.showContinueButton = showContinueButton
        self.continueButtonTitle = continueButtonTitle ?? String(localized: "continueButton.title", bundle: .module)
        self.continueAction = continueAction
    }

    /// An example `FKConfiguration` to be used in SwiftUI previews.
    static let example = FKConfiguration(
        title: "Whatʼs New in Example App",
        items: [.example, .example, .example]
    ) {
        print("Done")
    }
}
