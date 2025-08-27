import SwiftUI

struct MainMenuView: View {
    @EnvironmentObject var auth: AuthManager
    @State private var showCreateCar = false
    @State private var showCreateMap = false
    @State private var showPlayChoice = false
    @State private var showOwnerPanel = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Physics Drive").font(.largeTitle)
            
            Button("Play") { showPlayChoice = true }
            Button("Create Car") { showCreateCar = true }
            Button("Create Map") { showCreateMap = true }
            Button("Sign Out") { auth.signOut() }
            
            if auth.user?.uid == "OWNER_FIREBASE_UID" {
                Button("Owner Panel") { showOwnerPanel = true }
            }
        }
        .fullScreenCover(isPresented: $showPlayChoice) { PlayChoiceView() }
        .fullScreenCover(isPresented: $showCreateCar) { CreateCarView(auth: auth) }
        .fullScreenCover(isPresented: $showCreateMap) { CreateMapView() }
        .fullScreenCover(isPresented: $showOwnerPanel) { OwnerPanelView() }
    }
}
