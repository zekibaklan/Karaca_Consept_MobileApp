//
//  CenterView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 24.02.2024.
//

import Firebase
import SwiftUI

struct ContentView: View {
  // MARK: - PROPERTIES
  @EnvironmentObject var shop: Shop
  let facts: [userCommentModel] = userCommentData
  let products: [Product] = productData
  @AppStorage("log_status") var logStatus: Bool = false

  // MARK: - BODY

  var body: some View {

    NavigationView {
      ZStack {
        // MARK: - NAVBAR
        VStack(spacing: 0) {
          NavigationBarView(numberOfProducts: shop.shopProduct.count)
            .padding(.horizontal, 15)
            .padding(.bottom)
            .padding(.top, 60)
            .background(Color.comment)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)

          Spacer()
          ScrollView(
            .vertical, showsIndicators: false,
            content: {
              VStack(spacing: 0) {
                // MARK: - FEATUREDTABVIEW
                FeaturedTabView()
                  .frame(height: UIScreen.main.bounds.width / 1.475)
                  .padding(.vertical, 20)
              }
              // MARK: - MenuView
              MenuView()
                .frame(maxWidth: 640)
              // MARK: - UserCommentView
              Text("Kullanıcı Yorumları")
                .font(.system(.title2, design: .serif))
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding(.top, 20)

              ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 60) {
                  ForEach(facts) { item in
                    UserCommentView(userComment: item)
                  }
                }
                .padding(.vertical)
                .padding(.leading, 60)
                .padding(.trailing, 20)
              }
              // MARK: - ProductItemView
              TitleView(title: "Ürünler")

              LazyVGrid(
                columns: gridLayout, spacing: 15,
                content: {

                  ForEach(products) { product in
                    NavigationLink(destination: ProductDetailView(product: product)) {
                      ProductItemView(product: product)
                        .multilineTextAlignment(.leading)

                    }

                    .foregroundStyle(.foreground)
                  }  //: LOOP
                }
              )  //: GRID
              .padding(15)
              // MARK: - BrandView
              TitleView(title: "Markalar")
              BrandGridView(brand: brandData)
              // MARK: - FooterView
              FooterView()
            })

        }
        .background(
          Color("ThemeBG")
            .ignoresSafeArea(.all, edges: .all))

      }  // ZSTACK

      .ignoresSafeArea(.all, edges: .top)
    }

  }
}

#Preview {
  ContentView()
    .environmentObject(Shop())
}
