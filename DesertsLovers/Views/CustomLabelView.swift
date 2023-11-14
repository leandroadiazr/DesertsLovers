//
//  CombinedLabelView.swift
//  InAppOrdering
//
//  Created by Leandro Diaz on 10/23/23.
//

import SwiftUI

struct CustomLabelView: View {
    var labelString: String
    var labelFontType: Font = .body
    var labelFontColor: Color = .primary
    var alignment: TextAlignment = .leading
    var lineLimit: Int = 10
    var bolded: Bool = false
    var italic: Bool = false
    
    var body: some View {
        Text(labelString)
            .font(labelFontType)
            .foregroundColor(labelFontColor)
            .multilineTextAlignment(alignment)
            .lineLimit(lineLimit)
            .bold(bolded ? true : false)
            .italic(italic ? true : false)
    }
}

struct CustomLabelView_Previews: PreviewProvider {
    static var previews: some View {
        CustomLabelView(labelString: "Test", alignment: .leading)
    }
}
