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
                #elseif os(macOS)
                .controlSize(.large)
                #endif
        } else {
            button
                .buttonStyle(.borderedProminent)
                #if os(iOS) || os(macOS)
                .controlSize(.large)
                #endif
        }
        #else
        button
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        #endif
    }

    private var button: some View {
        Button(action: action) {
            Text(title)
                #if os(macOS)
                .padding(.horizontal)
                #elseif os(watchOS)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
                #else
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .center)
                #endif
        }
    }
}

#Preview {
    ContinueButton {
        print("Done")
    }
}
