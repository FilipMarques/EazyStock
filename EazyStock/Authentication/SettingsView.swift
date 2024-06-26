//
//  SettingsView.swift
//  EazyStock
//
//  Created by Filipe Camargo Marques on 26/05/24.
//

import SwiftUI
class SettingsViewModel: ObservableObject {

    func logOut() throws {
        try AuthenticationManager.shared.logOut()
    }

}
struct SettingsView: View {

    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSignView: Bool

    var body: some View {
        List {
            NavigationLink(destination: ListItensView()) {
                Text("Ver Itens")
            }

            Button("Sair") {
                Task {
                    do {
                        try viewModel.logOut()
                        showSignView = true
                    } catch {
                        print(error)
                    }
                }
            }
            .foregroundColor(Color.red)

        }
        .navigationTitle("Home")
    }
}

#Preview {
    NavigationStack {
        SettingsView(showSignView: .constant(false))
    }
}
