//
//  PegView.swift
//  CodeBreaker
//
//  Created by devel on 10/17/26.
//

import SwiftUI

struct PegView: View {
    // MARK: Data In
    let peg: Peg
    
    // MARK: - Body
    
//    let pegShape = RoundedRectangle(cornerRadius: 10)
    let pegShape = Circle()
    
    var body: some View {
        pegShape
//            .strokeBorder(Color.gray)
            .fill(.clear)
            .overlay {
                Text(peg)
                    .font(.system(size: 50))
                    .minimumScaleFactor(0.5).lineLimit(1)
            }
            .overlay {
                if peg != Code.missingPeg {
                    pegShape
                        .strokeBorder(Color.gray)
                }
            }
            .contentShape(Rectangle())
            .aspectRatio(1, contentMode: .fit)
//                     .foregroundStyle(code.pegs    [index])
    }
}

#Preview {
    PegView(peg: "🧐")
        .padding()
}
