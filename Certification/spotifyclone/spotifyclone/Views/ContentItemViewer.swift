//
//  ContentItemViewer.swift
//  spotifyclone
//
//  Created by Enrique Gomez Tagle on 15/06/23.
//

import SwiftUI

struct ContentItemViewer: View {
    var topSpacer_height: CGFloat = 350
    var reusableColor = Color.init(red: 61/255, green: 89/255, blue: 115/255)
    @State var playButton_offset: CGFloat = 335
    
    var body: some View {
        ZStack {
            // LAYER 0
            LinearGradient(gradient: Gradient(colors: [reusableColor, Color.black, Color.black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            // LAYER 1, ALBUM DETAILS
            VStack {
                Spacer()
                    .frame(height: 20)
                
                Image("cover")
                    .resizable()
                    .frame(width: 200, height: 200)
                
                Text("Quédate (Tiësto Remix)")
                    .foregroundColor(Color.white)
                    .font(.system(size: 20, weight: .bold))
                
                Text("Bizarrap + 1")
                    .foregroundColor(.init(red: 0.5, green: 0.5, blue: 0.5))
                    .font(.system(size: 16, weight: .medium))
                    .padding(.top, 1)
                    .frame(alignment: .trailing)
                
                Spacer()
            }
            
            // LAYER 2, ITEM LIST
            ScrollView {
                GeometryReader{geo -> AnyView? in
                    let thisOffset = geo.frame(in: .global).minY
                    if thisOffset > -300 {
                        self.playButton_offset = thisOffset
                    } else {
                        self.playButton_offset = -300
                    }
                    
                    return nil
                }
                VStack(spacing: 0) {
                    HStack {
                        Spacer()
                            .frame(height: topSpacer_height)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.clear, Color.clear, Color.clear, Color.clear, Color.black]), startPoint: .top, endPoint: .bottom))
                    }
                    VStack {
                        ForEach(0..<30
                        ){ element in
                            HStack{
                                lImage_text_rlImage()
                                Spacer()
                            }
                        }
                    }.background(Color.black)
                }.background(Color.clear)
            }
            
            // Background Layer for layer 4 / layer 3
            VStack{
                LinearGradient(gradient: Gradient(colors: [reusableColor, Color.clear]), startPoint: .top, endPoint: .bottom).frame(height: 0)
                Spacer()
            }.edgesIgnoringSafeArea(.all)
            
            // LAYER 3
            VStack {
                Spacer()
                    .frame(height: playButton_offset + 250)
                
                HStack{
                    if (playButton_offset > -300) {
                        Text("PLAY")
                    } else {
                        Image(systemName: "play.fill")
                    }
                }
                .foregroundColor(.white)
                .frame(width: get_playButtonWidth(), height: 50)
                .background(Color.init(red: 30/255, green: 215/255, blue: 96/255))
                .cornerRadius(25)
                .font(.system(size: 17, weight: .bold))
                .shadow(radius: 20)
                
                Spacer()
            }
            
            // Layer 4
            VStack{
                HStack {
                    Image(systemName: "chevron.left")
                    Spacer()
                    Image(systemName: "ellipsis")
                }.foregroundColor(.white)
                    .padding()
                Spacer()
            }
            
            // Observer Layer
            VStack{
//                Text("\(playButton_offset)")
//                    .foregroundColor(.yellow)
                Spacer()
            }
            
        }
    }
        func get_playButtonWidth() -> CGFloat {
            
            if playButton_offset > -150 {
                return 240
            } else if playButton_offset <= -300 {
                return 50
            } else {
                let width: CGFloat = 240 - (190*(((-1*playButton_offset) - 150) / 150))
                return width
            }
    }
}

struct ContentItemViewer_Previews: PreviewProvider {
    static var previews: some View {
        ContentItemViewer()
    }
}
