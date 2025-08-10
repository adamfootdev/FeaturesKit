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

    /// A custom struct of type `FKConfiguration` containing details for FeaturesKit.
    private let configuration: FKConfiguration

    /// Initializes a new SwiftUI `View` which displays a list of featured items.
    /// - Parameter configuration: A custom struct of type `FKConfiguration` containing details for FeaturesKit.
    public init(configuration: FKConfiguration) {
        self.configuration = configuration
    }

    public var body: some View {
        #if os(watchOS)
        List {
            Section {
                titleView
                    .listItemTint(.clear)
            }

            Section {
                FeaturesListView(configuration.items)
            }

            Section {
                if configuration.showContinueButton {
                    ContinueButton(configuration.continueButtonTitle) {
                        if let continueAction = configuration.continueAction {
                            continueAction()
                        } else {
                            dismiss()
                        }
                    }
                    .listItemTint(.clear)
                }
            }
        }

        #else
        VStack(spacing: verticalSpacing) {
            titleView
                #if os(macOS)
                .padding(.horizontal, horizontalPadding)
                #endif

            VStack(spacing: 16) {
                FeaturesListView(configuration.items)
                    .padding(.horizontal)
                    #if os(macOS)
                    .padding(.horizontal, horizontalPadding)
                    #endif

                if configuration.showContinueButton {
                    HStack {
                        #if os(macOS)
                        Spacer()
                        #endif

                        ContinueButton(configuration.continueButtonTitle) {
                            if let continueAction = configuration.continueAction {
                                continueAction()
                            } else {
                                dismiss()
                            }
                        }
                        #if os(tvOS)
                        .prefersDefaultFocus(true, in: featuresNamespace)
                        #endif
                    }
                    #if os(macOS)
                    .padding(.horizontal, 20)
                    #else
                    .padding(.horizontal, horizontalPadding)
                    #endif
                }
            }
            #if os(tvOS)
            .focusScope(featuresNamespace)
            #endif
            #if os(macOS)
            .padding(.bottom, 20)
            #else
            .padding(.bottom, verticalPadding)
            #endif
        }
        #endif
    }

    private var titleView: some View {
        Group {
            #if os(visionOS)
            Text(configuration.title)
                .font(.largeTitle)
                .padding([.top, .horizontal], 40)

            #elseif os(watchOS)
            Text(configuration.title)
                .font(.title3.bold())
                .frame(maxWidth: .infinity, alignment: .leading)

            #else
            Text(configuration.title)
                .font(.title2.bold())
                .padding([.top, .horizontal], 40)

            #endif
        }
        .multilineTextAlignment(.leading)
        .frame(maxWidth: .infinity, alignment: .leading)
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
        return 44
        #endif
    }

    private var verticalPadding: CGFloat {
        #if os(tvOS)
        return 20
        #else
        return 44
        #endif
    }
}

struct FeaturesView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturesView(configuration: .example)
    }
}
