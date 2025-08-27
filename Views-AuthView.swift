import SwiftUI
import FirebaseAuth

struct AuthView: View {
    @EnvironmentObject var auth: AuthManager
    @State private var email = ""
    @State private var password = ""
    @State private var isSignUp = false

    var body: some View {
        VStack(spacing: 20) {
            TextField("Email", text: $email).textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Password", text: $password).textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(isSignUp ? "Sign Up" : "Sign In") {
                if isSignUp { auth.signUp(email: email, password: password) }
                else { auth.signIn(email: email, password: password) }
            }
            Button(isSignUp ? "Switch to Sign In" : "Switch to Sign Up") {
                isSignUp.toggle()
            }
        }.padding()
    }
}

class AuthManager: ObservableObject {
    @Published var user: User? = Auth.auth().currentUser

    var isSignedIn: Bool { user != nil }
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            DispatchQueue.main.async { self.user = result?.user }
        }
    }
    
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            DispatchQueue.main.async { self.user = result?.user }
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        user = nil
    }
}
