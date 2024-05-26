//
//  AuthenticationManager.swift
//  EazyStock
//
//  Created by Filipe Camargo Marques on 26/05/24.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel {
    let uid: String
    let email: String?
}

class AuthenticationManager {

    static let shared = AuthenticationManager()
    private init() { }

    func getAuthenticationUser() throws -> AuthDataResultModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }

        return AuthDataResultModel(uid: user.uid, email: user.email)
    }

    func createUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        let result = AuthDataResultModel(uid: authDataResult.user.uid, email: authDataResult.user.email)
        return result
    }

    func logOut() throws {
        try Auth.auth().signOut()
    }
}
