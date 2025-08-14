//
//  ContinueButton.swift
//  FeaturesKit
//
//  Created by Adam Foot on 02/08/2023.
//

import SwiftUI

struct ContinueButton: View {
    private let title: String
    private let action: () -> Void

    init(
        _ title: String = String(localized: "continueButton.title", bundle: .module),
        action: @escaping () -> Void
    ) {
        self.title = title
        self.action = action
    }

    var body: some View {
        #if os(iOS) || os(macOS) || os(watchOS)
        if #available(iOS 26.0, macOS 26.0, watchOS 26.0, *) {
            button
                .buttonStyle(.glassProminent)
                #if os(iOS)
                .controlSize(.extraLarge)
                #elseif os(macOS) || os(tvOS) || os(visionOS)
                .controlSize(.large)
                #endif
        } else {
            button
                .buttonStyle(.borderedProminent)
                #if os(iOS) || os(macOS) || os(tvOS) || os(visionOS)
                .controlSize(.large)
                #endif
        }
        #else
        button
            #if os(iOS) || os(macOS) || os(tvOS) || os(visionOS)
            .controlSize(.large)
            #endif
        #endif
    }

    private var button: some View {
        Button(action: action) {
            #if os(macOS)
            Text(title)
                .foregroundStyle(.white)
                .padding(.horizontal)
            #elseif os(watchOS)
            Text(title)
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .center)

            #else
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity)
            #endif
        }
    }
}

struct ContinueButton_Previews: PreviewProvider {
    static var previews: some View {
        ContinueButton {
            print("Done")
        }
    }
}
