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
    
    /// An enum used for setting the position of the title.
    public let titlePosition: FKTitlePosition

    /// An enum used for setting the style of the title. The standard style
    /// is always used on watchOS.
    public let titleStyle: FKTitleStyle

    /// An array of featured items to display in a the list.
    public let items: [FKItem]

    /// An optional `URL` to be linked to a button shown above the continue button.
    public let learnMoreURL: URL?

    /// A `String` containing the title of the learn more button. Not available on tvOS
    /// or watchOS.
    public let learnMoreButtonTitle: String

    /// A `Bool` indicating whether the continue button should be shown. The learn more button
    /// is also included. Not available on tvOS or watchOS.
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
    ///   - titlePosition: An enum used for setting the position of the title. Defaults to `.leading`.
    ///   - titleStyle: An enum used for setting the style of the title. The standard style
    ///   is always used on watchOS. Defaults to `.standard`.
    ///   - items: An array of featured items to display in a list.
    ///   - learnMoreURL: An optional `URL` to be linked to a button shown above the continue button.
    ///   Not available on tvOS or watchOS. Defaults to `nil`.
    ///   - learnMoreButtonTitle: An optional `String` containing the title of the learn more button.
    ///   Not available on tvOS or watchOS. Defaults to `nil` which results in Learn More being used.
    ///   - showContinueButton: A `Bool` indicating whether the continue button should be shown. The learn more button
    ///   is also included. Defaults to `true`.
    ///   - continueButtonTitle: An optional `String` containing the continue button title. Defaults to `nil` which results in Continue being used.
    ///   - continueAction: An optional completion block to perform when the continue button is tapped. Defaults to `nil` which results in the view being dismissed.
    public init(
        title: String,
        titlePosition: FKTitlePosition = .leading,
        titleStyle: FKTitleStyle = .standard,
        items: [FKItem],
        learnMoreURL: URL? = nil,
        learnMoreButtonTitle: String? = nil,
        showContinueButton: Bool = true,
        continueButtonTitle: String? = nil,
        continueAction: (@Sendable () -> Void)? = nil
    ) {
        self.title = title
        self.titlePosition = titlePosition
        self.titleStyle = titleStyle
        self.items = items
        self.learnMoreURL = learnMoreURL
        self.learnMoreButtonTitle = learnMoreButtonTitle ?? String(localized: "learnMoreButton.title", bundle: .module)
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
