//
//  AddItemView.swift
//  EazyStock
//
//  Created by Filipe Camargo Marques on 26/05/24.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: ItemViewModel
    @State private var name = ""
    @State private var detail = ""

    var isFormValid: Bool {
        !name.isEmpty && !detail.isEmpty
    }

    var body: some View {
        NavigationView {
            Form {
                TextField("Nome", text: $name)
                TextField("Detalhe", text: $detail)
            }
            .navigationTitle("Adicionar Item")
            .navigationBarItems(
                leading: Button("Cancelar") {
                    presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("Salvar") {
                    viewModel.addItem(name: name, detail: detail)
                    presentationMode.wrappedValue.dismiss()
                }
                .disabled(!isFormValid)
            )
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView(viewModel: ItemViewModel())
    }
}
