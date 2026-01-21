//
//  FKTitlePosition.swift
//  FeaturesKit
//
//  Created by Adam Foot on 21/01/2026.
//

import Foundation
import SwiftUI

public enum FKTitlePosition: Sendable {
    case leading
    case center
    case trailing

    var textAlignment: TextAlignment {
        switch self {
        case .leading:
            return .leading
        case .center:
            return .center
        case .trailing:
            return .trailing
        }
    }

    var viewAlignment: Alignment {
        switch self {
        case .leading:
            return .leading
        case .center:
            return .center
        case .trailing:
            return .trailing
        }
    }
}
