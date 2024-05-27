//
//  SignInEmailView.swift
//  EazyStock
//
//  Created by Filipe Camargo Marques on 26/05/24.
//

import SwiftUI

final class SignInEmailViewModel: ObservableObject {

    @Published var email = ""
    @Published var password = ""

    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            return
        }

        _ = try await AuthenticationManager.shared.createUser(email: email, password: password)

    }

    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            return
        }

        _ = try await AuthenticationManager.shared.signInUser(email: email, password: password)

    }

}

struct SignInEmailView: View {

    @StateObject private var viewModel = SignInEmailViewModel()
    @Binding var showSignInView: Bool

    var body: some View {
        VStack {
            TextField("Email...", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)

            SecureField("Senha...", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)

            Button {
                Task {
                    do {
                        try await viewModel.signUp()
                        showSignInView = false
                        return
                    } catch {
                        print(error)
                    }

                    do {
                        try await viewModel.signIn()
                        showSignInView = false
                        return
                    } catch {
                        print(error)
                    }
                }

            } label: {
                Text("Entrar")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Entrar com Email")
    }
}

#Preview {
    NavigationStack {
        SignInEmailView(showSignInView: .constant(false))
    }

}
