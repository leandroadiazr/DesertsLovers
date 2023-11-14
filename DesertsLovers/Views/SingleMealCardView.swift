//
//  SingleMealCardView.swift
//  DesertsLovers
//
//  Created by Leandro Diaz on 11/13/23.
//

import SwiftUI

struct SingleMealCardView: View {
    let title: String
    let description: String
    let imageName: String
    let isSelected: Bool
    var headerColor: Color = .primary
    var bodyColor: Color = .red
    
    let action: () -> Void
    
    var body: some View {
        ZStack {
            VStack(spacing: 10) {
                HStack {
                    // MARK: - main image
                    RoundedCornersImageView(imageName: imageName)
                    Spacer()
                    
                    // MARK: - labels
                    VStack(alignment: .center, spacing: 7) {
                        CustomLabelView(labelString: title, labelFontType: .title2, labelFontColor: .primary, alignment: .center, lineLimit: 10, bolded: true)
                        CustomLabelView(labelString: description, labelFontType: .caption2, labelFontColor: .primary, alignment: .center, lineLimit: 10)
                        CustomPillSUButton(title: "Details", backgroundColor: .clear, border: 1, borderColor: .white) {
                            action()
                        }
                        .frame(maxWidth: 110, maxHeight: 35)
                    }
                } // END HSTACK
                
                HStack {
                    CustomLabelView(labelString: "Click the Button for details", labelFontType: .caption, bolded: true)
                    Spacer()
                }
                .padding(.top, 5)
            }
            .padding()
        }
        .frame(minHeight: 230, maxHeight: 250)
        .background(bodyColor)
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }
}



struct SingleMealCardView_Previews: PreviewProvider {
    static var previews: some View {
        SingleMealCardView(title: "Mian test", description: "just a regular descripiton for testing only", imageName: "", isSelected: true, action: {
            //
        })
        .padding()
    }
}
