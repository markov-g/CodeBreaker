//
//  UIExtentions.swift
//  CodeBreaker
//
//  Created by devel on 10/27/26.
//

import SwiftUI

extension AnyTransition {
    static let pegChooser = AnyTransition.offset(x: 0, y: 200)
    
    static func attempt(_ isGameOver: Bool) -> AnyTransition {
        AnyTransition.asymmetric(
            insertion: isGameOver ? .opacity : .move(edge: .top),
            removal: .move(edge: .trailing))
    }	
}

extension Animation {
    static let codeBraker = Animation.default
    static let guess = Animation.codeBraker
    static let restart = Animation.codeBraker
    static let selection = Animation.codeBraker
}

extension View {
    func flexibleSystemFont(minimum: CGFloat = 8, maximum: CGFloat = 80) -> some View {
        self
            .font(.system(size: maximum))
            .minimumScaleFactor(minimum/maximum)
    }
}

extension Color {
    static func gray(_ brightness: CGFloat) -> Color {
        return Color(hue: 148/360, saturation: 0, brightness: brightness)
    }
}

