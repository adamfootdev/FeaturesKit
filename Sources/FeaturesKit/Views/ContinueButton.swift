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
        Button(action: action) {
            #if os(macOS)
            Text(title)
                .padding(.horizontal)
                .frame(minWidth: 200)

            #elseif os(watchOS)
            Text(title)

            #else
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity)
            #endif
        }
        #if os(iOS) || os(macOS)
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        #endif
    }
}

struct ContinueButton_Previews: PreviewProvider {
    static var previews: some View {
        ContinueButton {
            print("Done")
        }
    }
}
