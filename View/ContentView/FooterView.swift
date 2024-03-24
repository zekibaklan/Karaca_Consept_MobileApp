//
//  FooterView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 25.02.2024.
//

import SwiftUI

struct FooterView: View {

 // MARK: - BODY
 var body: some View {
  // MARK: - FOOTER TEXT
  VStack(alignment: .center, spacing: 10) {
   Text(
    "Her mutfağın ihtiyacı olan küçük ev aletlerini, geniş bir ürün yelpazesinde sunan Karaca ürünlerinin dayanıklılığı ve kalitesi ve şık tasarımlarıyla da tercih sebebi. Tencere gereçlerinden küçük ev aletlerine, süzgeçten kavanoza kadar mutfağınızı tamamlamak için ihtiyacınız olan her ürün Karaca’da!"
   )
   .foregroundColor(.gray)
   .multilineTextAlignment(.center)
   .layoutPriority(2)
   .font(.footnote)
   Image("karacalogo")
    .renderingMode(.template)
    .foregroundColor(.gray)
    .layoutPriority(0)
   // MARK: - FOOTER FOOTNOTE
   Text(
    """
    Karaca.com © 2024 - Karaca Züccaciye A.Ş.
    Tüm hakları saklıdır.
    """
   )
   .font(.footnote)
   .fontWeight(.bold)
   .foregroundColor(.gray)
   .multilineTextAlignment(.center)
   .layoutPriority(1)
  }  //: VSTACK
  .padding()
 }
}

#Preview {
 FooterView()
}
