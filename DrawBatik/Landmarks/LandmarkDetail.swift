import SwiftUI


struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
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
                
                NavigationLink(destination: DrawMain()) {
                    Text("Draw Batik")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.brown) // You can customize the button color
                        .cornerRadius(10)
                }
                .padding(.bottom, 50)
            }
            
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                
                
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                
                Divider()
                
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            
            
            Spacer()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    let modelData = ModelData()
    return LandmarkDetail(landmark: modelData.landmarks[0])
        .environment(modelData)
}
