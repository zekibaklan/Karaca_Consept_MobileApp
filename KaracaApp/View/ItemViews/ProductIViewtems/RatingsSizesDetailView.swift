//
//  RatingsSizesDetailView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 26.02.2024.
//

import SwiftUI

struct RatingsSizesDetailView: View {
    // MARK: - PROPERTY
    
    let sizes: [String] = ["XS", "S", "M", "L", "XL"]
    
    // MARK: - BODY
    
    var body: some View {
      HStack(alignment: .top, spacing: 3, content: {
        // RATINGS
        VStack(alignment: .leading, spacing: 3, content: {
          Text("Ratings")
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundColor(.gray)
          
          HStack(alignment: .center, spacing: 3, content: {
            ForEach(1...5, id: \.self) { item in
              Button(action: {}, label: {
                Image(systemName: "star.fill")
                  .frame(width: 28, height: 28, alignment: .center)
                  .background(Color.gray.cornerRadius(5))
                  .foregroundColor(.white)
              })
            }
          })
        })
        
        Spacer()
        
        // SIZES
        VStack(alignment: .trailing, spacing: 3, content: {
          Text("Sizes")
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundColor(.gray)
          
          HStack(alignment: .center, spacing: 5, content: {
            ForEach(sizes, id: \.self) { size in
              Button(action: {}, label: {
                Text(size)
                  .font(.footnote)
                  .fontWeight(.heavy)
                  .foregroundColor(.gray)
                  .frame(width: 28, height: 28, alignment: .center)
                  .background(Color.white.cornerRadius(5))
                  .background(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 2)
                  )
              })
            }
          })
        })
      }) //: HSTACK
    }
}

#Preview {
    RatingsSizesDetailView()
        .padding()
}
