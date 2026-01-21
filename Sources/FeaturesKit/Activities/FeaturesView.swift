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
    @Environment(\.openURL) private var openURL

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
        #if os(iOS) || os(macOS) || os(visionOS)
        if #available(iOS 26.0, macOS 26.0, visionOS 26.0, *) {
            featuresView
                .safeAreaBar(edge: .bottom) {
                    continueButton
                }
        } else {
            featuresView
                .safeAreaInset(edge: .bottom) {
                    continueButton
                }
        }
        #else
        featuresView
        #endif
    }

    private var featuresView: some View {
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
                #if os(macOS) || os(tvOS) || os(visionOS)
                .padding(.horizontal, horizontalPadding)
                #else
                .padding(.top, 40)
                #endif

            VStack(spacing: 16) {
                FeaturesListView(configuration.items)
                    #if os(macOS) || os(tvOS) || os(visionOS)
                    .padding(.horizontal, horizontalPadding)
                    #endif

                #if !os(iOS) && !os(macOS) && !os(visionOS)
                continueButton
                #endif
            }
            #if os(tvOS)
            .focusScope(featuresNamespace)
            #endif
            #if !os(iOS)
            .padding(.bottom, verticalPadding)
            #endif
        }
        #endif
    }

    private var titleView: some View {
        Text(configuration.title)
            .font(configuration.titleStyle.font)
            .multilineTextAlignment(configuration.titlePosition.textAlignment)
            #if !os(watchOS)
            .padding([.top, .horizontal], 40)
            #endif
            .frame(maxWidth: .infinity, alignment: configuration.titlePosition.viewAlignment)
            .accessibilityAddTraits(.isHeader)
    }

    private var verticalSpacing: CGFloat {
        #if os(tvOS)
        return 60
        #else
        return 28
        #endif
    }

    private var horizontalPadding: CGFloat {
        #if os(tvOS)
        return 240
        #else
        return 40
        #endif
    }

    private var verticalPadding: CGFloat {
        #if os(tvOS)
        return 20
        #else
        return 16
        #endif
    }

    @ViewBuilder
    private var continueButton: some View {
        if configuration.showContinueButton {
            VStack(spacing: continueButtonSpacing) {
                #if !os(tvOS) && !os(watchOS)
                if let url = configuration.learnMoreURL {
                    Button(configuration.learnMoreButtonTitle) {
                        openURL(url)
                    }
                    #if os(macOS)
                    .buttonStyle(.link)
                    #endif
                }
                #endif

                ContinueButton(configuration.continueButtonTitle) {
                    if let continueAction = configuration.continueAction {
                        continueAction()
                    } else {
                        dismiss()
                    }
                }
                #if !os(macOS)
                .frame(maxWidth: 400)
                #endif
                #if os(tvOS)
                .prefersDefaultFocus(true, in: featuresNamespace)
                #endif
            }
            .padding(.horizontal, horizontalPadding)
            #if os(iOS) || os(macOS) || os(visionOS)
            .padding(.bottom, 16)
            #endif
        }
    }

    private var continueButtonSpacing: CGFloat {
        #if os(macOS)
        return 8
        #else
        return 16
        #endif
    }
}

#Preview {
    Text("Content")
        #if os(tvOS)
        .fullScreenCover(isPresented: .constant(true)) {
            FeaturesView(configuration: .example)
                .background(Material.regular)
        }
        #else
        .sheet(isPresented: .constant(true)) {
            FeaturesView(configuration: .example)
        }
        #endif
}
