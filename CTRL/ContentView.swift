//
//  ContentView.swift
//  CTRL
//
//  Created by Hardik Kafle on 12/24/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedCard: String? = nil // Track the selected card
    @State private var cardScale: CGFloat = 1.0 // Scale for animation
    
    var body: some View {
        ZStack {
            // Set the background color of the screen to blue and ignore safe areas for the entire view
            Color.blue.edgesIgnoringSafeArea(.all) // Extend the background to all edges including the bottom curve area
            
            GeometryReader { geometry in
                VStack(spacing: 0) { // Stack elements vertically without any spacing between them
                    Spacer() // This spacer pushes content down
                    
                    ZStack {
                        // First (bottom) card (White) - White card will be at the bottom left
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: geometry.size.width / 2, height: geometry.size.width / 1.618) // Golden ratio height
                            .cornerRadius(15)
                            .shadow(radius: 10)
                            .offset(x: 0, y: 0) // No offset for the white card
                            .scaleEffect(selectedCard == "White" ? cardScale : 1) // Apply scaling if this card is selected
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    if selectedCard == "White" {
                                        // If the card is already selected, reset the scale
                                        selectedCard = nil
                                        cardScale = 1.0
                                    } else {
                                        // Otherwise, enlarge the card
                                        selectedCard = "White"
                                        cardScale = 1.2
                                    }
                                }
                            }

                        // Second (middle) card (Gray) - Gray card will be up and to the right of the white card
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: geometry.size.width / 2, height: geometry.size.width / 1.618) // Golden ratio height
                            .cornerRadius(15)
                            .shadow(radius: 10)
                            .offset(x: 15, y: 15) // Diagonal offset for the gray card
                            .scaleEffect(selectedCard == "Gray" ? cardScale : 1) // Apply scaling if this card is selected
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    if selectedCard == "Gray" {
                                        // If the card is already selected, reset the scale
                                        selectedCard = nil
                                        cardScale = 1.0
                                    } else {
                                        // Otherwise, enlarge the card
                                        selectedCard = "Gray"
                                        cardScale = 1.2
                                    }
                                }
                            }

                        // Third (top) card (Mint) - Mint card will be up and to the right of the gray card
                        Rectangle()
                            .fill(Color.mint)
                            .frame(width: geometry.size.width / 2, height: geometry.size.width / 1.618) // Golden ratio height
                            .cornerRadius(15)
                            .shadow(radius: 10)
                            .offset(x: 30, y: 30) // Diagonal offset for the mint card
                            .scaleEffect(selectedCard == "Mint" ? cardScale : 1) // Apply scaling if this card is selected
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    if selectedCard == "Mint" {
                                        // If the card is already selected, reset the scale
                                        selectedCard = nil
                                        cardScale = 1.0
                                    } else {
                                        // Otherwise, enlarge the card
                                        selectedCard = "Mint"
                                        cardScale = 1.2
                                    }
                                }
                            }
                    }

                    Spacer() // This spacer pushes content down
      
                    // Horizontal line
                    Rectangle()
                        .fill(Color.white.opacity(0.8))
                        .frame(height: 4) // Set the height to 4 (thicker) instead of 2
                        .frame(maxWidth: .infinity) // Extend to screen width
                    
                    // Horizontal stack of buttons and dividers
                    HStack(spacing: 0) { // Stack items horizontally without spacing
                    
                        // First Button and its container (left section)
                        VStack {
                            Button(action: {
                                print("First button pressed")
                            }) {
                                Image(systemName: "circle.dashed")
                                    .font(.system(size: 40, weight: .bold)) // Set font weight to bold
                                    .foregroundColor(.white) // Set icon color to white
                                    .opacity(0.8) // Set opacity to 80% for the icon
                                    .padding() // Add padding around the icon
                            }
                        }
                        .frame(width: geometry.size.width / 3) // Make this section 1/3 of the screen width
                        
                        // First Vertical Divider
                        Rectangle()
                            .fill(Color.white.opacity(0.8)) // Divider with white color and opacity
                            .frame(width: 4, height: geometry.size.height / 6.5) // Set the width to 4 (thicker) and height to 10% of the screen height

                        // Second Button and its container (middle section)
                        VStack {
                            Button(action: {
                                print("Second button pressed")
                            }) {
                                Image(systemName: "square.3.layers.3d.down.left")
                                    .font(.system(size: 40, weight: .bold)) // Set font weight to bold
                                    .foregroundColor(.white) // Set icon color to white
                                    .opacity(0.8) // Set opacity to 80% for the icon
                                    .padding() // Add padding around the icon
                            }
                        }
                        .frame(width: geometry.size.width / 3) // Make this section 1/3 of the screen width
                        
                        // Second Vertical Divider
                        Rectangle()
                            .fill(Color.white.opacity(0.8)) // Divider with white color and opacity
                            .frame(width: 4, height: geometry.size.height / 6.5) // Set the width to 4 (thicker) and height to 10% of the screen height
                        
                        // Third Button and its container (right section)
                        VStack {
                            Button(action: {
                                print("Third button pressed")
                            }) {
                                Image(systemName: "gear")
                                    .font(.system(size: 40, weight: .bold)) // Set font weight to bold
                                    .foregroundColor(.white) // Set icon color to white
                                    .opacity(0.8) // Set opacity to 80% for the icon
                                    .padding() // Add padding around the icon
                            }
                        }
                        .frame(width: geometry.size.width / 3) // Make this section 1/3 of the screen width
                    }
                }
                .edgesIgnoringSafeArea(.bottom) // Ignore the safe area at the bottom, allowing content to reach the bottom curve
            }
        }
    }
}

#Preview {
    ContentView()
}
