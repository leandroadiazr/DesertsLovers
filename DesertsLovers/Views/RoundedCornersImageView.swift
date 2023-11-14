//
//  RoundedCornersImageView.swift
//  DesertsLovers
//
//  Created by Leandro Diaz on 11/13/23.
//

import SwiftUI

struct RoundedCornersImageView: View {
    var imageName: String? = nil
    let placeholderImage: String = "takeoutbag.and.cup.and.straw"
    var maxSize: CGFloat? = nil
    
    var body: some View {
        Group {
            AsyncImage(url: URL(string: imageName ?? "")) { data in
                switch data {
                case .empty:
                    VStack {
                        Image(systemName: placeholderImage)
                            .resizable()
                            .frame(width: 60, height: 60)
                            .scaledToFit()
                            .foregroundColor(.primary)
                    }
                    .overlay {
                        ProgressView()
                            .frame(width: 60, height: 60)
                            .tint(.accentColor)
                    }
                case .success(let image):
                    if maxSize != nil {
                        image
                            .resizable()
                            .frame(width: maxSize, height: maxSize)
                    } else {
                        image
                            .resizable()
                            .scaledToFit()
                    }
                case .failure(let error):
                    // An error occurred while loading
                    Text("Error loading image: \(error.localizedDescription)")
                @unknown default:
                    EmptyView()
                }
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 5)
    }
}

struct RoundedCornersImageView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedCornersImageView()
            .frame(width: 200, height: 200)
    }
}
