//
//  MapView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 28.02.2024.
//

import MapKit
import SwiftUI

struct MapView: View {
  // MARK: - PROPERTIES

  @State private var cameraPosition: MapCameraPosition = .region(.userRegion)
  @State private var searchText = ""
  @State private var results = [MKMapItem]()
  @State private var mapSelection: MKMapItem?
  @State private var showSearch: Bool = false
  @State private var showDetails = false
  @State private var getDirections = false
  @State private var routeDisplaying = false
  @State private var route: MKRoute?

  // MARK: - PROPERTIES

  var body: some View {
    // MARK: - USERLOCATION
    NavigationStack {
      Map(position: $cameraPosition, selection: $mapSelection) {
        Annotation("Konumum", coordinate: .userLocation) {
          ZStack {

            Circle().frame(width: 32, height: 32)
              .foregroundStyle(.blue.opacity(0.25))

            Circle().frame(width: 20, height: 20)
              .foregroundStyle(.white.opacity(0.25))

            Circle().frame(width: 12, height: 12)
              .foregroundStyle(.blue)
          }
        }
        // MARK: - PLACEMARKS
        ForEach(results, id: \.self) {
          item in
          if routeDisplaying {
            if item == mapSelection {
              let placemark = item.placemark
              Annotation("\(placemark.name ?? "")", coordinate: placemark.coordinate) {
                ZStack {
                  Image("karacalogo")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .overlay(
                      Circle()
                        .stroke(Color.black, lineWidth: 2)
                    )
                }
              }

            }
          } else {
            let placemark = item.placemark
            Annotation("\(placemark.name ?? "")", coordinate: placemark.coordinate) {
              Image("karacalogo")
                .resizable()
                .frame(width: 32, height: 32)
                .overlay(
                  Circle()
                    .stroke(Color.black, lineWidth: 2)
                )

            }
          }

        }

        if let route {
          MapPolyline(route.polyline)
            .stroke(.blue, lineWidth: 6)
        }

      }

      // MARK: - SEARCHABLE
      .navigationTitle("#KaracaBurada")
      .navigationBarTitleDisplayMode(.inline)
      .toolbarBackground(.visible, for: .navigationBar)
      .toolbarBackground(.ultraThinMaterial, for: .navigationBar)
      .searchable(text: $searchText, isPresented: $showSearch)

      .onSubmit(of: .search) {
        Task { await searchPlaces() }
      }
      .onChange(
        of: getDirections,
        { oldValue, newValue in
          if newValue {
            fetchRoute()
          }
        }
      )

      .onChange(
        of: mapSelection,
        { oldValue, newValue in

          showDetails = newValue != nil

        }
      )
      // MARK: - LOCATION DETAIL VIEW
      .sheet(
        isPresented: $showDetails,
        content: {
          LocationDetailsView(
            mapSelection: $mapSelection, show: $showDetails, getDirections: $getDirections
          )
          .presentationDetents([.height(340)])
          .presentationBackgroundInteraction(.enabled(upThrough: .height(340)))
          .presentationCornerRadius(12)

        }
      )
      .mapControls {
        MapCompass()
        MapPitchToggle()
        MapUserLocationButton()
      }
    }

  }

}
extension MapView {
  // MARK: - SEARCH PLACES
  func searchPlaces() async {
    let request = MKLocalSearch.Request()
    request.naturalLanguageQuery = searchText
    request.region = .userRegion

    let results = try? await MKLocalSearch(request: request).start()
    self.results = results?.mapItems ?? []
  }

  // MARK: - FETCHROUTE
  func fetchRoute() {

    if let mapSelection {
      let request = MKDirections.Request()
      request.source = MKMapItem(placemark: .init(coordinate: .userLocation))
      request.destination = mapSelection

      Task {
        let result = try? await MKDirections(request: request).calculate()
        route = result?.routes.first
       
        withAnimation {
          routeDisplaying = true
          showDetails = false

          if let rect = route?.polyline.boundingMapRect, routeDisplaying {
            cameraPosition = .rect(rect)
          }
        }
      }
    }

  }
}
// MARK: - COORDINATE CALCULATE
extension CLLocationCoordinate2D {
  static var userLocation: CLLocationCoordinate2D {
    return .init(latitude: 40.766666, longitude: 29.916668)
  }
}

extension MKCoordinateRegion {
  static var userRegion: MKCoordinateRegion {
    return .init(center: .userLocation, latitudinalMeters: 20000, longitudinalMeters: 20000)
  }
}

#Preview {
  MapView()
}
