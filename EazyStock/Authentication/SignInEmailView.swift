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

    func signIn() {
        guard !email.isEmpty, !password.isEmpty else {
            return
        }

        Task {
            do {
                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
                print("deu bom")
            } catch {
                print("Error: \(error)")
                print("deu ruim")
            }


        }

    }
}

struct SignInEmailView: View {

    @StateObject private var viewModel = SignInEmailViewModel()

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
                viewModel.signIn()
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
        SignInEmailView()
    }

}
