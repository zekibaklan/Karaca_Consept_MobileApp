//
//  VideoView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 1.03.2024.
//

import AVKit
import SwiftUI

struct VideoView: View {
  // MARK: - PROPERTY
  @State private var player = AVPlayer()

  // MARK: - BODY
  var body: some View {
    VStack {
      VideoPlayer(player: player)
        .onAppear {
          // MARK: - SETTING URL
          if let videoURL = Bundle.main.url(forResource: "karacaVideo", withExtension: "mp4") {
            player = AVPlayer(url: videoURL)

             // MARK: - PLAY THE VIDEO
            player.play()
          } else {
            print("Video file not found")
          }

        }

    }

    .ignoresSafeArea()

  }
}

#Preview {
  VideoView()

}
