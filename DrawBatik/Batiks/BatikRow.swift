import SwiftUI


struct BatikRow: View {
    var batik: Batik


    var body: some View {
        HStack {
            batik.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(batik.name)


            Spacer()
            
            if batik.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}


#Preview {
    let batiks = ModelData().batiks
    return Group {
        BatikRow(batik: batiks[0])
    }
}
