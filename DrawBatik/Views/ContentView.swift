import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Background Image
                Image("backgroundApp")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                // Vertical Stack (VStack) aligned in the center
                VStack {
                    // Logo Image
                    Image("logoApp")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 200) // Adjust the size as needed

                    // Spacer to push the button to the bottom
                    Spacer()

                    // Play Game Button with NavigationLink
                    NavigationLink(destination: HomeScreen().environment(ModelData())) {
                        Text("Play Game")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.brown) // You can customize the button color
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 50)
                }
                .padding() // Add padding to the VStack
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
