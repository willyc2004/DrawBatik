import Foundation
import SwiftUI
import CoreLocation


struct Batik: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var asal: String
    var state: String
    var description: String
    var isFavorite: Bool
    
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var guideline: String
    var imageGuideline: Image {
        Image(guideline)
    }
}
