//
//  FavoriteView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 7.03.2024.
//



import SwiftUI

struct FavoriteItemView: View {
  // MARK: - PROPERTIES
  let products : [Product] = productData
  
  @State private var selectedImage: String = "makine1"
  @State private var selectedPrice: String = "2799₺"
  @State private var selectedColor: String = "Siyah"
  

  let haptics = UIImpactFeedbackGenerator(style: .medium)
  @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
  @State private var gridColumn: Double = 3.0
  
  func gridSwitch() {
      withAnimation(.easeIn) {
          gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
      }
  }
  
  // MARK: - BODY

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(alignment: .center, spacing: 30) {
                // MARK: - IMAGE
                if products.filter({$0.isFavorite}).count != 0 {
                    Image(selectedImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 280,height: 280)
                        .padding(.top)
                    
                    HStack {
                        Text("Tutar: \(selectedPrice)")
                        Spacer()
                        Text("Renk: \(selectedColor)")
                    }
                    .padding(.horizontal)
                    
                    
                    // MARK: - SLIDER
                    
                    Slider(value: $gridColumn, in: 2...4, step: 1)
                        .padding(.horizontal)
                        .onChange(of: gridColumn) { oldValue, newValue in
                            gridSwitch()
                        }
                    
                    
                    
                    
                    // MARK: - GRID
                    
                    LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                        ForEach(products.filter({$0.isFavorite})) { item in
                            ProductItemView(product: item)
                            
                                .scaledToFit()
                                .onTapGesture {
                                    selectedImage = item.image
                                    selectedPrice = item.formattedPrice
                                    selectedColor = item.itemColor
                                    haptics.impactOccurred()
                                }
                        } //: LOOP
                    } //: GRID
                    .onAppear(perform: {
                        gridSwitch()
                    })
                } else {
                    EmptyScreenView(image: "heart.circle",text: "Henüz favori ürününüz bulunmuyor.")
                }
               
                } //: VSTACK
                    .padding(.horizontal, 10)
                    .padding(.vertical, 50)
                
            } //: SCROLL
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("ThemeBG").ignoresSafeArea())
            .navigationBarBackButtonHidden()
            .navigationBarItems(leading: CustomBackButton())
        }
    
   
}
#Preview {
    FavoriteItemView()
      
}
