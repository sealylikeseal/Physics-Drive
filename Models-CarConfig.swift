import Foundation

struct CarConfig: Identifiable, Codable {
    var id = UUID()
    var name: String
    var modelFile: String
    var maxRPM: Double
    var enginePower: Double
    var acceleration: Double
    var brakePower: Double
    var maxSpeed: Double
    var sizeMultiplier: Double
}
