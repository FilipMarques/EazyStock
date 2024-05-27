//
//  EditItemView.swift
//  EazyStock
//
//  Created by Filipe Camargo Marques on 26/05/24.
//

import SwiftUI

struct EditItemView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: ItemViewModel
    var item: Item

    @State private var name: String
    @State private var detail: String

    var isFormValid: Bool {
        !name.isEmpty && !detail.isEmpty
    }

    init(viewModel: ItemViewModel, item: Item) {
        self.viewModel = viewModel
        self.item = item
        _name = State(initialValue: item.name)
        _detail = State(initialValue: item.detail)
    }

    var body: some View {
        NavigationView {
            Form {
                TextField("Nome", text: $name)
                TextField("Detalhe", text: $detail)
            }
            .navigationTitle("Editar Item")
            .navigationBarItems(
                leading: Button("Cancelar") {
                    presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("Salvar") {
                    viewModel.updateItem(item: item, newName: name, newDetail: detail)
                    presentationMode.wrappedValue.dismiss()
                }
                .disabled(!isFormValid)
            )
        }
    }
}
