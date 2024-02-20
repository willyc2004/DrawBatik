//
//  DrawMain.swift
//  DrawBatik
//
//  Created by MacBook Pro on 20/02/24.
//

import SwiftUI

struct Line {
    var points = [CGPoint]()
    var color: Color = .red
    var lineWidth: Double = 1.0
}

struct DrawMain: View {
    @State private var currentLine = Line()
    @State private var lines: [Line] = []
    @State private var thickness: Double = 1.0

    var body: some View {
        VStack {
            
            
            ZStack {
                Image("backgroundApp") // Replace "YourBackgroundImageName" with the actual name of your background image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 360)
                .clipped()
                // Outline for the canvas
                Rectangle()
                    .stroke(Color.black, lineWidth: 4)
                
                Canvas { context, size in
                    for line in lines {
                        var path = Path()
                        path.addLines(line.points)
                        context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                    }
                }
                .frame(minWidth: 200, minHeight: 200)
                .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                    .onChanged({ value in
                        let newPoint = value.location
                        currentLine.points.append(newPoint)
                        self.lines.append(currentLine)
                    })
                    .onEnded({ value in
                        self.lines.append(currentLine)
                        self.currentLine = Line(points: [], color: currentLine.color, lineWidth: thickness)
                    })
                )
            }
            
            HStack {
                Slider(value: $thickness, in: 1...20) {
                    Text("Thickness")
                }
                .frame(maxWidth: 200)
                .onChange(of: thickness) { _ in
                    currentLine.lineWidth = thickness
                }

                Divider()

                ColorPickerView(selectedColor: $currentLine.color)
                    .onChange(of: currentLine.color) { newColor in
                        currentLine.color = newColor
                }
            }
        }
        .padding()
    }
}


struct DrawMain_Previews: PreviewProvider {
    static var previews: some View {
        DrawMain()
    }
}
