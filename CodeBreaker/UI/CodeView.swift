//
//  CodeView.swift
//  CodeBreaker
//
//  Created by devel on 10/20/26.
//

import SwiftUI

struct CodeView<AncillaryView>: View where AncillaryView: View {
    // MARK: Data In
    let code: Code
    
    // MARK: Data Shared with me
    @Binding var selection: Int
    
    // MARK: Data In Function
    @ViewBuilder let ancillaryView: () -> AncillaryView?
    
    // MARK: Data Owned by Me
    @Namespace private var selectionNamespace
    
    init(code: Code,
         selection: Binding<Int> = Binding<Int>.constant(-1),
         @ViewBuilder ancillaryView: @escaping () -> AncillaryView = { EmptyView() }) {
        self.code = code
        self._selection = selection
        self.ancillaryView = ancillaryView
    }
    
    // MARK: - Body
    var body: some View {
        HStack {
            ForEach(code.pegs.indices, id: \.self) { index in
                PegView(peg: code.pegs[index])
                    .padding(Selection.border)
                    .background { //selection background
                        Group {
                            if selection == index,
                               code.kind == .guess {
                                Selection.shape
                                    .foregroundStyle(Selection.color)
                                    .matchedGeometryEffect(id: "selection", in: selectionNamespace)
                            }
                        }
                        .animation(.selection, value: selection)
                    }
                    .overlay { // hidden code obscuring
                        Selection.shape.foregroundStyle(code.isHidden ? Color.gray : .clear)
                            .transaction { transcation in
                                if code.isHidden {
                                    transcation.animation = .none
                                }
                            }
                    }
                    .onTapGesture {
                        if code.kind == .guess {
                            selection = index
                        }
                    }
            }
            
            Rectangle()
                .foregroundStyle(.clear)
                .aspectRatio(1, contentMode: .fit)
                .overlay {
                    ancillaryView()
                }
        }
        
    }
}

fileprivate struct Selection {
    static let border: CGFloat = 5
    static let cornerRadius: CGFloat = 10
    static let color: Color = Color.gray(0.85)
    static let shape: some Shape = RoundedRectangle(cornerRadius: cornerRadius)
}

//#Preview {
//    CodeView()
//}
