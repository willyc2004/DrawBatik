import SwiftUI


struct BatikDetail: View {
    @Environment(ModelData.self) var modelData
    var batik: Batik
    
    var batikIndex: Int {
        modelData.batiks.firstIndex(where: { $0.id == batik.id })!
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        ScrollView {
            ZStack {
                Image("backgroundApp") // Replace "YourBackgroundImageName" with the actual name of your background image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 300)
                .clipped()
                
                NavigationLink(destination: DrawMain(batik: batik)) {
                    Text("Draw Batik")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.brown) // You can customize the button color
                        .cornerRadius(10)
                }
                .padding(.bottom, 50)
            }
            
            
            CircleImage(image: batik.image)
                .offset(y: -130)
                .padding(.bottom, -130)
                
        
            
            
            VStack(alignment: .leading) {
                HStack {
                    Text(batik.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.batiks[batikIndex].isFavorite)
                }
                
                
                HStack {
                    Text(batik.asal)
                    Spacer()
                    Text(batik.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                
                Divider()
                
                
                Text("About \(batik.name)")
                    .font(.title2)
                Text(batik.description)
            }
            .padding()
            
            
            Spacer()
        }
        .navigationTitle(batik.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    let modelData = ModelData()
    return BatikDetail(batik: modelData.batiks[0])
        .environment(modelData)
}
