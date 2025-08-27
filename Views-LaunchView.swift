import SwiftUI

struct LaunchView: View {
    @EnvironmentObject var auth: AuthManager

    var body: some View {
        if auth.isSignedIn {
            MainMenuView()
        } else {
            AuthView()
        }
    }
}
