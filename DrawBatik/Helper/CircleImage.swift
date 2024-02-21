import SwiftUI


struct CircleImage: View {
    var image: Image
    
    
    var body: some View {
        image
            .resizable() // Make the image resizable
            .aspectRatio(contentMode: .fill) // Maintain aspect ratio when resizing
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}


#Preview {
    CircleImage(image: Image("BatikKawung"))
}
