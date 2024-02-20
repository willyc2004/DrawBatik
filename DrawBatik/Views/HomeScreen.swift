import SwiftUI


struct HomeScreen: View {
    @State private var selection: Tab = .list
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
            TabView(selection: $selection) {
                CategoryHome()
                    .tabItem {
                        Label("Featured", systemImage: "star")
                    }
                    .tag(Tab.featured)


                LandmarkList()
                    .tabItem {
                        Label("List", systemImage: "list.bullet")
                    }
                    .tag(Tab.list)
            }
            .navigationBarBackButtonHidden(true)
        }
}


#Preview {
    HomeScreen()
        .environment(ModelData())
}
