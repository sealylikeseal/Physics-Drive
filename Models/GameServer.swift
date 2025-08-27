import Foundation

struct GameServer: Identifiable {
    var id: String { serverID }
    var serverID: String
    var name: String
    var host: String
    var maxPlayers: Int
    var currentPlayers: Int
    var disabled: Bool = false
}
