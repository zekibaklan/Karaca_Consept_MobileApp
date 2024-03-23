//
//  VideoView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 1.03.2024.
//

import SwiftUI
import AVKit
struct VideoView: View {
    
    @State private var player = AVPlayer()

    var body: some View {
        
 
    
            
         
            VStack {
                VideoPlayer(player: player)
                            .onAppear {
                                // Setting the URL of the video file
                                if let videoURL = Bundle.main.url(forResource: "karacaVideo", withExtension: "mp4") {
                                    player = AVPlayer(url: videoURL)
                                    
                                    // Play the video
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
