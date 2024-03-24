//
//  LocationDetailsView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 28.02.2024.
//

import MapKit
import SwiftUI

struct LocationDetailsView: View {

  // MARK: - PROPERTIES
  @Binding var mapSelection: MKMapItem?
  @Binding var show: Bool
  @State private var lookAroundScene: MKLookAroundScene?
  @Binding var getDirections: Bool

  // MARK: - BODY
  var body: some View {
    VStack {
      HStack {
        VStack(alignment: .leading) {
          Text(mapSelection?.placemark.name ?? "")
            .font(.title2)
            .fontWeight(.semibold)

          Text(mapSelection?.placemark.title ?? "")
            .font(.footnote)
            .foregroundStyle(.gray)
            .lineLimit(2)
            .padding(.trailing)
        }
        Spacer()

        Button(
          action: {

            show.toggle()
            mapSelection = nil

          },
          label: {
            Image(systemName: "xmark.circle.fill")
              .resizable()
              .frame(width: 24, height: 24)
              .foregroundStyle(.gray, Color(.systemGray6))
          })
      }
      .padding(.horizontal)
      .padding(.top)

      if let scene = lookAroundScene {
        LookAroundPreview(initialScene: scene)
          .frame(height: 200)
          .cornerRadius(12)
          .padding()
      } else {
        ContentUnavailableView("No preview avaible", systemImage: "eye.slash")
      }
      HStack(spacing: 24) {
        Button(
          action: {

            if let mapSelection {
              mapSelection.openInMaps()
            }

          },
          label: {
            Text("Harita")
              .font(.headline)
              .foregroundStyle(.white)
              .frame(width: 170, height: 48)
              .background(.green)
              .cornerRadius(12)
          })

        Button(
          action: {

            getDirections = true
            show = false

          },
          label: {
            Text("Yol Tarifi")
              .font(.headline)
              .foregroundStyle(.white)
              .frame(width: 170, height: 48)
              .background(.blue)
              .cornerRadius(12)

          })
      }
    }
    .padding(.horizontal)

    .onAppear {
      fetchLookAroundPreview()
    }
    .onChange(of: mapSelection) { oldValue, newValue in
      fetchLookAroundPreview()
    }
    .padding()
  }
}
extension LocationDetailsView {
  func fetchLookAroundPreview() {
    if let mapSelection {
      lookAroundScene = nil
      Task {
        let request = MKLookAroundSceneRequest(mapItem: mapSelection)
        lookAroundScene = try? await request.scene
      }
    }
  }

}
#Preview {
  LocationDetailsView(
    mapSelection: .constant(nil), show: .constant(false), getDirections: .constant(false))
}
