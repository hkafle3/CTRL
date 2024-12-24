//
//  ContentView.swift
//  CTRL
//
//  Created by Hardik Kafle on 12/24/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .bottomLeading) { // Aligns it on the bottom
            Color.blue.edgesIgnoringSafeArea(.all)
            HStack(spacing: 30) { // Everything within the HStack is aligned horizontally
                Button(action: {
                    print("First button pressed") // This will be replaced in the future
                }) {
                    Image(systemName: "circle.dashed")
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                        .opacity(0.8)
                        .padding()
                }
                Button(action: {
                    print("Second button pressed")
                }) {
                    Image(systemName: "square.3.layers.3d.down.left")
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                        .opacity(0.8)
                        .padding()
                }
                Button(action: {
                    print("Third button pressed")
                }) {
                    Image(systemName: "gear")
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                        .opacity(0.8)
                        .padding()
                }
            }
            .padding([.leading, .bottom], 50)
        }
    }
}

#Preview {
    ContentView()
}
