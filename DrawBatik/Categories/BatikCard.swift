//
//  BatikCard.swift
//  DrawBatik
//
//  Created by MacBook Pro on 21/02/24.
//

import SwiftUI

struct BatikCard: View {
    var batik: Batik
    
    var body: some View {
        batik.image
            .resizable()
            .overlay {
                BatikTextOverlay(batik: batik)
            }
    }
}

struct BatikTextOverlay: View {
    var batik: Batik
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(batik.name)
                    .font(.title)
                    .bold()
                Text(batik.asal)
            }
            .padding()
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    let modelData = ModelData()
    return BatikCard(batik: modelData.batiks[0])
        .environment(modelData)
        .aspectRatio(3 / 2, contentMode: .fit)
}
