//
//  CustomPillSUButton.swift
//  DesertsLovers
//
//  Created by Leandro Diaz on 11/13/23.
//

import SwiftUI

struct CustomPillSUButton: View {
    var imageName: String = ""
    var title: String
    var backgroundColor: Color = .red
    var foregroundColor = Color.white
    var maxWidth = UIScreen.main.bounds.width - 24
    var fontSize: Font = .subheadline
    var rounded: Bool = false
    var border: CGFloat = 0
    var borderColor: Color = .black
    var imageHeight: CGFloat = 10
    var imageWidth: CGFloat = 10
    var maxHeight: CGFloat = 46
    var action: (() -> Void)?
    
    var body: some View {
        Button(action: {
            action?()
        }, label: {
            HStack {
                Text(title)
                    .font(fontSize)
                    .bold()
                    .lineLimit(3)
                if imageName != "" {
                    Image(systemName: imageName)
                        .resizable()
                        .frame(width: imageWidth, height: imageHeight)
                        .scaledToFit()
                }
            }
            .padding(5)
            .frame(minWidth: 80, idealWidth: 216, maxWidth: UIScreen.main.bounds.width - 24, maxHeight: maxHeight)
            .font(fontSize)
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .overlay(
                Capsule()
                    .stroke(borderColor, lineWidth: border)
            )
            .padding(1)
            .cornerRadius(23)
        })
    }
}

struct CustomPillSUButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomPillSUButton(imageName: "xmark", title: "bell") {
            print("tapped")
        }
    }
}
