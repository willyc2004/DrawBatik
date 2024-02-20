import SwiftUI


struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
            NavigationSplitView {
                ScrollView {
                    LazyVStack {
                        ForEach(modelData.features) { feature in
                            NavigationLink(destination: Text("Detail view for \(feature.name)")) {
                                FeatureCard(landmark: feature)
                                    .padding(.bottom, 10)
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
