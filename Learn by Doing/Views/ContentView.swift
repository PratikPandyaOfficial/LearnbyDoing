//
//  ContentView.swift
//  Learn by Doing
//
//  Created by Drashti on 21/12/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    var cards: [Card] = cardData
    
    // MARK: - Body
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment:.center, spacing: 15) {
                ForEach(cards){ item in
                    CardView(card: item)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
