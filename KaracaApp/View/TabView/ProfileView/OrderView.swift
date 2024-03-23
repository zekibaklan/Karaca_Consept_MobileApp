//
//  OrderInfoView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 5.03.2024.
//

import SwiftUI

struct OrderView: View {
    
        // MARK: - PROPERTIES
        @Environment(\.presentationMode) var presentationMode
     
    
        var body: some View {
            
            ZStack {
                Color("ThemeBG")
                    .ignoresSafeArea()
                ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                  
                  
                  Spacer(minLength: 10)
                  
                 
                  
                  AppInfoView()
                
                  Spacer(minLength: 10)
                  
                
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(.top, 15)
                .padding(.bottom, 25)
                .padding(.horizontal, 25)
                }
            }
            .navigationBarBackButtonHidden()
            .navigationBarItems(leading: CustomBackButton())
           
        }
    }


#Preview {
    OrderView()
        .environmentObject(Shop())
}

struct AppInfoView: View {
    
    @EnvironmentObject var shop: Shop
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
                 
            if (shop.orders.count > 0)  {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    ForEach(shop.orders) { order in
                        Text("Siparişler")
                              .fontWeight(.black)
                              .font(.largeTitle)
                              .foregroundColor(Color.pink)
                        let firstSixCharacters = String(order.id.uuidString.prefix(6))
                        RowAppInfoView(ItemOne: "Sipariş Numarası", ItemTwo: firstSixCharacters)
                        RowAppInfoView(ItemOne: "Ürünler", ItemTwo: order.products.map { $0.name }.joined(separator: "\n"))
                        RowAppInfoView(ItemOne: "Tarih/Saat", ItemTwo: getCurrentDate())
                        RowAppInfoView(ItemOne: "Adres", ItemTwo: "Albayrak Mah.Elvan Apt.41100.Izmit/Kocaeli")
                        RowAppInfoView(ItemOne: "Ödeme", ItemTwo: "Pay")
                        RowAppInfoView(ItemOne: "Tutar", ItemTwo: "\(order.total)₺")

                        
                       
                    }
                        }
                    }
            
            
            
                else
                {
                    EmptyScreenView(image: "list.clipboard", text: "Henüz sipariş vermediniz.")
                }
                
                
            }
        .padding(.bottom,15)
        }
    
    }
    
    
func getCurrentDate() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd.MM.yyyy, HH:mm"
    return formatter.string(from: Date())
}
    
    struct RowAppInfoView: View {
        // MARK: - PROPERTIESa
        var ItemOne: String
        var ItemTwo: String
        
        var body: some View {
            VStack {
                HStack {
                    Text(ItemOne).foregroundColor(Color.gray)
                    Spacer()
                    Text(ItemTwo)
                }
                Divider()
            }
        }
    }
    

