//
//  FeatureItemRow.swift
//  FeaturesKit
//
//  Created by Adam Foot on 02/08/2023.
//

import SwiftUI

struct FeatureItemRow: View {
    private let item: FKItem

    init(_ item: FKItem) {
        self.item = item
    }

    var body: some View {
        HStack(spacing: horizontalSpacing) {
            if let systemImage = item.systemImage {
                Image(systemName: systemImage)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(item.imageTint)
                    .frame(width: imageSize, height: imageSize)
                    .accessibilityElement(children: .ignore)
            }

            VStack(alignment: .leading, spacing: verticalSpacing) {
                Text(item.title)
                    .font(titleFont)
                    .accessibilityAddTraits(.isHeader)

                Text(item.description)
                    .font(descriptionFont)
                    .foregroundStyle(Color.secondary)
            }
        }
    }

    private var horizontalSpacing: CGFloat {
        #if os(tvOS)
        return 40
        #else
        return 16
        #endif
    }

    private var verticalSpacing: CGFloat {
        #if os(watchOS)
        return 0
        #else
        return 4
        #endif
    }

    private var imageSize: CGFloat {
        #if os(tvOS)
        return 60
        #else
        return 30
        #endif
    }

    private var titleFont: Font {
        #if os(tvOS)
        return .title3.bold()
        #else
        return .headline
        #endif
    }

    private var descriptionFont: Font {
        #if os(tvOS)
        return .headline
        #elseif os(watchOS)
        return .footnote
        #else
        return .body
        #endif
    }
}

#Preview {
    FeatureItemRow(.example)
}
