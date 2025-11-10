//
//  extension+Font.swift
//  GilgimExerciseApp
//
//  Created by gaea on 11/6/25.
//

import SwiftUI

// MARK: - Pretendard Variable: 편의 이니셜라이저
extension Font {
    static func pretendard(_ size: CGFloat, weight: Weight = .regular) -> Font {
        Font.custom(Pretendard.postScriptName(for: weight), size: size)
    }

    static func pretendard(style: Font.TextStyle, weight: Weight = .regular) -> Font {
        Font.custom(Pretendard.postScriptName(for: weight), size: UIFont.preferredFont(forTextStyle: style.uiFontTextStyle).pointSize, relativeTo: style)
    }
}

// MARK: - 내부 헬퍼
private enum Pretendard {
    static func postScriptName(for weight: Font.Weight) -> String {
        switch weight {
        case .ultraLight: return "PretendardVariable-ExtraLight"
        case .thin:       return "PretendardVariable-Thin"
        case .light:      return "PretendardVariable-Light"
        case .regular:    return "PretendardVariable-Regular"
        case .medium:     return "PretendardVariable-Medium"
        case .semibold:   return "PretendardVariable-SemiBold"
        case .bold:       return "PretendardVariable-Bold"
        case .heavy:      return "PretendardVariable-ExtraBold"
        case .black:      return "PretendardVariable-Black"
        default:          return "PretendardVariable-Regular"
        }
    }
}

// MARK: - UIKit TextStyle 브리지
private extension Font.TextStyle {
    var uiFontTextStyle: UIFont.TextStyle {
        switch self {
        case .largeTitle: return .largeTitle
        case .title:      return .title1
        case .title2:     return .title2
        case .title3:     return .title3
        case .headline:   return .headline
        case .subheadline:return .subheadline
        case .body:       return .body
        case .callout:    return .callout
        case .footnote:   return .footnote
        case .caption:    return .caption1
        case .caption2:   return .caption2
        @unknown default: return .body
        }
    }
}
