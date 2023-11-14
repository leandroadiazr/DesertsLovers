//
//  FeaturedMealPopUp.swift
//  DesertsLovers
//
//  Created by Leandro Diaz on 11/13/23.
//

import SwiftUI

struct FeaturedMealPopUp: View {
    @State var item: Meal? = nil
    @Binding var shouldExpand: Bool
    var body: some View {
        
        VStack(spacing: 10) {
            ScrollView(.vertical, showsIndicators: true) {
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            self.shouldExpand.toggle()
                        }
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.primary)
                    })
                }
                
                RoundedCornersImageView(imageName: item?.strMealThumb, maxSize: 150)
                
                CustomLabelView(labelString: item?.strMeal ?? "", labelFontType: .callout, bolded: true)
                CustomLabelView(labelString: "Desert", labelFontType: .callout, labelFontColor: .red, bolded: true)
            }
        }
        .frame(maxWidth: 300, minHeight: 150, maxHeight: 350, alignment: .top)
        .padding()
        .background(Color(UIColor.tertiarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
        .shadow(color: Color(uiColor: .label), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        .overlay(
            RoundedRectangle(cornerRadius: 25.0)
                .stroke(Color.black, lineWidth: 2)
        )
    }
}

struct FeaturedMealPopUp_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue
            FeaturedMealPopUp(item: nil, shouldExpand: .constant(false))
                .frame(width: 300, height: 430)
        }
    }
}
