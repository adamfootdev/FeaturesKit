//
//  FKTitleStyle.swift
//  FeaturesKit
//
//  Created by Adam Foot on 21/01/2026.
//

import Foundation
import SwiftUI

public enum FKTitleStyle: Sendable {
    case standard
    case large

    var font: Font {
        switch self {
        case .standard:
            #if os(visionOS)
            return .largeTitle
            #elseif os(watchOS)
            return .title3.bold()
            #else
            return .title2.bold()
            #endif
        case .large:
            #if os(visionOS)
            return .extraLargeTitle2
            #elseif os(watchOS)
            return .title3.bold()
            #else
            return .title.bold()
            #endif
        }
    }
}
