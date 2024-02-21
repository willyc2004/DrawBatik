import SwiftUI


struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        NavigationSplitView {
            ScrollView {
                LazyVStack {
                    ForEach(modelData.batiks) { batik in
                        NavigationLink(destination: Text("Detail view for \(batik.name)")) {
                            BatikCard(batik: batik) // Use BatikCard instead of FeatureCard
                                .padding(.bottom, 10)
                                .frame(width: 350, height: 250)
                        }
                    }
                    
            
                }
                .padding()
            }
            .navigationTitle("Featured")
        } detail: {
            Text("Select a Landmark")
        }
    }
}


#Preview {
    CategoryHome()
        .environment(ModelData())
}
