import Foundation
import FirebaseStorage

class ModLoader {
    static func uploadModToServer(modURL: URL, serverID: String) {
        let storageRef = Storage.storage().reference().child("servers/\(serverID)/mods/\(modURL.lastPathComponent)")
        storageRef.putFile(from: modURL, metadata: nil) { metadata, error in
            if let error = error { print("Upload failed: \(error)") }
            else { print("Mod uploaded!") }
        }
    }

    static func loadModsFromServer(serverID: String, completion: @escaping ([URL]) -> Void) {
        let storageRef = Storage.storage().reference().child("servers/\(serverID)/mods")
        storageRef.listAll { result, error in
            guard error == nil, let result = result else { completion([]); return }
            var urls: [URL] = []
            let group = DispatchGroup()
            for item in result.items {
                group.enter()
                item.downloadURL { url, _ in
                    if let url = url { urls.append(url) }
                    group.leave()
                }
            }
            group.notify(queue: .main) { completion(urls) }
        }
    }
}
