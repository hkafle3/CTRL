//
//  ContentView.swift
//  CTRL
//
//  Created by Hardik Kafle on 12/24/24.
//

import SwiftUI

struct Card: View { // Card Object Abstraction
    let offset: CGSize
    let cardIdentifier: String
    let opacity: Double
    @Binding var selectedCard: String?
    @Binding var cardScale: CGFloat

    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.white.opacity(opacity), Color.gray.opacity(opacity)]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .frame(width: UIScreen.main.bounds.width / 1.65, height: UIScreen.main.bounds.height / 2.35)
        .cornerRadius(20)
        .shadow(radius: 10)
        .offset(offset)
        .scaleEffect(selectedCard == cardIdentifier ? cardScale : 1) // Depends on if selected or not
        .onTapGesture {
            withAnimation(.spring()) {
                if selectedCard == cardIdentifier {
                    selectedCard = nil
                    cardScale = 1.0
                } else {
                    selectedCard = cardIdentifier
                    cardScale = 1.2
                }
            }
        }
    }
}

struct ContentView: View {
    @State private var selectedCard: String? = nil // Records selected card
    @State private var cardScale: CGFloat = 1.0 // Records current scale of card

    var body: some View {
        ZStack {
            LinearGradient( // Background gradient (top left -> bottom right)
                gradient: Gradient(colors: [Color.gray, Color.black]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all) // Include curved areas

            GeometryReader { geometry in
                VStack(spacing: 0) {
                    Spacer() // Leave space at top. (Spacers space things out)
                    
                    ZStack {
                        Card( // #3 (back)
                            offset: CGSize(width: 22, height: 15),
                            cardIdentifier: "One",
                            opacity: 0.6,
                            selectedCard: $selectedCard,
                            cardScale: $cardScale
                        )
                        Card( // #2 (middle)
                            offset: CGSize(width: 6, height: 31),
                            cardIdentifier: "Two",
                            opacity: 0.8,
                            selectedCard: $selectedCard,
                            cardScale: $cardScale
                        )
                        Card( // #1 (front)
                            offset: CGSize(width: -10, height: 47),
                            cardIdentifier: "Three",
                            opacity: 1.0,
                            selectedCard: $selectedCard,
                            cardScale: $cardScale
                        )
                                        
                    }

                    Spacer()

                    HStack {
                        Spacer() // Flush to the right side
                        
                        Button(action: { // Add Card Button
                            print("")
                        }) {
                            Image(systemName: "rectangle.portrait.badge.plus.fill")
                                .font(.system(size: 55))
                                .foregroundColor(.white)
                                .opacity(0.7)
                                .padding()
                        }
                    }
                    .padding(.trailing, 20)
                    .padding(.bottom, 20)
                    
                    Rectangle() // Horizontal divider for controls.
                        .fill(Color.white.opacity(0.7))
                        .frame(height: 2)
                        .frame(maxWidth: .infinity)
                    
                    HStack(spacing: 0) { // Bottom Buttons
                        VStack { // Progress Button
                            Button(action: {
                                print("")
                            }) {
                                Image(systemName: "circle.dashed")
                                    .font(.system(size: 40))
                                    .foregroundColor(.white)
                                    .opacity(0.7)
                                    .padding()
                            }
                        }
                        .frame(width: geometry.size.width / 3) // Space it out evenly
                        
                        Rectangle() // Vertical Divider 1
                            .fill(Color.white.opacity(0.25))
                            .frame(width: 2, height: geometry.size.height / 6.5)
                            .offset(x: 0, y: 0)

                        VStack { // Home Button
                            Button(action: {
                                print("Second button pressed")
                            }) {
                                Image(systemName: "square.3.layers.3d.down.left")
                                    .font(.system(size: 40))
                                    .foregroundColor(.white)
                                    .opacity(0.7)
                                    .padding()
                            }
                        }
                        .frame(width: geometry.size.width / 3)
                        
                        Rectangle() // Vertical Divider 2
                            .fill(Color.white.opacity(0.25))
                            .frame(width: 2, height: geometry.size.height / 6.5)
                        
                        VStack { // Settings Button
                            Button(action: {
                                print("Third button pressed")
                            }) {
                                Image(systemName: "slider.horizontal.3")
                                    .font(.system(size: 40))
                                    .foregroundColor(.white)
                                    .opacity(0.7)
                                    .padding()
                            }
                        }
                        .frame(width: geometry.size.width / 3)
                    }
                }
                .edgesIgnoringSafeArea(.bottom) // Push all the way to the bottom
            }
        }
    }
}

#Preview {
    ContentView()
}
