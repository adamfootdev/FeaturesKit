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
            .padding(.horizontal, horizontalPadding)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        #endif
    }

    private var itemsView: some View {
        ForEach(items, content: FeatureItemRow.init)
    }

    private var verticalSpacing: CGFloat {
        #if os(tvOS)
        return 48
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
}

struct FeaturesListView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturesListView([.example, .example, .example])
    }
}
