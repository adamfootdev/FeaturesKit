//
//  FeaturesListView.swift
//  FeaturesKit
//
//  Created by Adam Foot on 02/08/2023.
//

import SwiftUI

struct FeaturesListView: View {
    private let items: [FKItem]

    init(_ items: [FKItem]) {
        self.items = items
    }

    var body: some View {
        #if os(watchOS)
        itemsView

        #else
        ScrollView {
            VStack(alignment: .leading, spacing: verticalSpacing) {
                itemsView
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        #if os(iOS) || os(macOS) || os(visionOS)
        .scrollBounceBehavior(.basedOnSize)
        #endif
        #endif
    }

    private var itemsView: some View {
        ForEach(Array(items.enumerated()), id: \.0) { _, item in
            FeatureItemRow(item)
        }
    }

    private var verticalSpacing: CGFloat {
        #if os(tvOS)
        return 32
        #else
        return 20
        #endif
    }
}

#Preview {
    FeaturesListView([.example, .example, .example])
}
