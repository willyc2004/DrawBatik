import SwiftUI


struct BatikList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    var filteredBatiks: [Batik] {
        modelData.batiks.filter { batik in
            (!showFavoritesOnly || batik.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredBatiks) { batik in
                    NavigationLink {
                        BatikDetail(batik: batik)
                    } label: {
                        BatikRow(batik: batik)
                    }
                }
            }
            .animation(.default, value: filteredBatiks)
            .navigationTitle("Batiks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}


#Preview {
    BatikList()
        .environment(ModelData())
}
