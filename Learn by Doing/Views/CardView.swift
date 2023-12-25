//
//  CardView.swift
//  Learn by Doing
//
//  Created by Drashti on 21/12/23.
//

import SwiftUI

struct CardView: View {
    // MARK: - Properties
    var card: Card
    
    @State private var fadeIn: Bool = false
    @State private var moveDownward: Bool = false
    @State private var moveUpward: Bool = false
    @State private var showAlert: Bool = false
    
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Image(card.imageName)
                .opacity( fadeIn ? 1.0 : 0.0 )
            
            VStack{
                Text(card.title)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                
                Text(card.headLine)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
            }
            .offset(y: moveDownward ? -218 : -300)
            
            Button(action: {
                playSound(sound: "sound-chime", type: "mp3")
                hapticImpact.impactOccurred()
                showAlert.toggle()
            }, label: {
                HStack {
                    Text("Learn".uppercased())
                        .fontWeight(.heavy)
                    .foregroundStyle(.white)
                    
                    Image(systemName: "arrow.right.circle")
                        .font(.title.weight(.medium))
                        .foregroundStyle(.white)
                }
                .padding(.vertical)
                .padding(.horizontal, 24)
                .background(
                    LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing)
                )
                .clipShape(Capsule())
                .shadow(radius: 6)
                    
            })
            .offset(y: moveUpward ? 210 : 300)
        }
        .frame(width: 335, height: 545)
        .background(
            LinearGradient(colors: card.gradientColors, startPoint: .top, endPoint: .bottom)
        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 8)
        .onAppear(perform: {
            withAnimation(.linear(duration: 1.2)) {
                fadeIn.toggle()
            }
            withAnimation(.linear(duration: 0.8)) {
                moveDownward.toggle()
                moveUpward.toggle()
            }
        })
        .alert(isPresented: $showAlert) {
            Alert(title: Text(card.title), message: Text(card.message), dismissButton: .destructive(Text("OK")))
        }

    }
}

#Preview {
    CardView(card: cardData[0])
}
