//
//  AuthenticationView.swift
//  EazyStock
//
//  Created by Filipe Camargo Marques on 26/05/24.
//

import SwiftUI

struct AuthenticationView: View {
    var body: some View {
        VStack {
            NavigationLink {
                SignInEmailView()
            } label: {
                Text("Entrar com e-mail")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
            }
            Spacer()
        }
        .navigationTitle("Entrar")
    }
}

#Preview {
    NavigationStack {
        AuthenticationView()
    }
}
