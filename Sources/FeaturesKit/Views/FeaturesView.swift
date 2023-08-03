//
//  FeaturesView.swift
//  FeaturesKit
//
//  Created by Adam Foot on 02/08/2023.
//

import SwiftUI

/// A SwiftUI `View` which displays a list of featured items.
public struct FeaturesView: View {
    @Environment(\.dismiss) private var dismiss

    #if os(tvOS)
    @Namespace private var featuresNamespace
    #endif

    /// The `String` to display at the top of the screen
    /// e.g. What's New, What's New in App or Welcome to App.
    private let title: String

    /// An array of featured items to display in a the list.
    private let items: [FKItem]

    /// A `Bool` indicating whether the continue button should be shown.
    private let showContinueButton: Bool

    /// A `String` containing the continue button title.
    private let continueButtonTitle: String

    /// An optional completion block to perform when the continue button is tapped.
    private let continueAction: (() -> Void)?

    /// Initializes a new SwiftUI `View` which displays a list of featured items.
    /// - Parameters:
    ///   - title: The `String` to display at the top of the screen
    ///   e.g. What's New, What's New in App or Welcome to App.
    ///   - items: An array of featured items to display in a list.
    ///   - showContinueButton: A `Bool` indicating whether the continue button should be shown. Defaults to `true`.
    ///   - continueButtonTitle: A `String` containing the continue button title. Defaults to `nil` which results in Continue being used.
    ///   - continueAction: An optional completion block to perform when the continue button is tapped. Defaults to `nil` which results in the view being dismissed.
    public init(
        _ title: String,
        items: [FKItem],
        showContinueButton: Bool = true,
        continueButtonTitle: String? = nil,
        continueAction: (() -> Void)? = nil
    ) {
        self.title = title
        self.items = items
        self.showContinueButton = showContinueButton
        self.continueButtonTitle = continueButtonTitle ?? String(localized: "continueButton.title", bundle: .module)
        self.continueAction = continueAction
    }

    public var body: some View {
        #if os(watchOS)
        List {
            Section {
                titleView
                    .listItemTint(.clear)
            }

            Section {
                FeaturesListView(items)
            }

            Section {
                if showContinueButton {
                    ContinueButton(continueButtonTitle) {
                        if let continueAction = continueAction {
                            continueAction()
                        } else {
                            dismiss()
                        }
                    }
                }
            }
        }

        #else
        VStack(spacing: verticalSpacing) {
            titleView

            VStack(spacing: 16) {
                FeaturesListView(items)

                if showContinueButton {
                    ContinueButton(continueButtonTitle) {
                        if let continueAction = continueAction {
                            continueAction()
                        } else {
                            dismiss()
                        }
                    }
                    #if os(tvOS)
                    .prefersDefaultFocus(true, in: featuresNamespace)
                    #endif
                    .padding(.horizontal, horizontalPadding)
                    .padding(.vertical, verticalPadding)
                }
            }
            #if os(tvOS)
            .focusScope(featuresNamespace)
            #endif
            .padding(.bottom, showContinueButton ? 0 : verticalPadding)
        }
        #endif
    }

    private var titleView: some View {
        Group {
            #if os(watchOS)
            Text(title)
                .font(.title3.bold())
                .frame(maxWidth: .infinity)

            #else
            Text(title)
                .font(.largeTitle.bold())
                .padding([.top, .horizontal], 40)

            #endif
        }
        .multilineTextAlignment(.center)
        .accessibilityAddTraits(.isHeader)
    }

    private var verticalSpacing: CGFloat {
        #if os(tvOS)
        return 80
        #else
        return 40
        #endif
    }

    private var horizontalPadding: CGFloat {
        #if os(tvOS)
        return 500
        #else
        return 28
        #endif
    }

    private var verticalPadding: CGFloat {
        #if os(tvOS)
        return 20
        #else
        return 28
        #endif
    }
}

struct FeaturesView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturesView(
            "Whatʼs New in Example App",
            items: [.example, .example, .example]
        ) {
            print("Done")
        }
    }
}
