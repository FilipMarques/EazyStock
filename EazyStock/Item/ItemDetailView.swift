//
//  ItemDetailView.swift
//  EazyStock
//
//  Created by Filipe Camargo Marques on 26/05/24.
//

import SwiftUI

struct ItemDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: ItemViewModel
    var item: Item
    @State private var name: String
    @State private var detail: String

    init(item: Item, viewModel: ItemViewModel) {
        self.item = item
        self.viewModel = viewModel
        _name = State(initialValue: item.name)
        _detail = State(initialValue: item.detail)
    }

    var isFormValid: Bool {
        !name.isEmpty && !detail.isEmpty
    }

    var body: some View {
        NavigationView {
            Form {
                TextField("Nome", text: $name)
                TextField("Detalhe", text: $detail)
            }
            .navigationTitle("Detalhe do Item")
            .navigationBarItems(trailing: Button("Salvar") {
                viewModel.updateItem(item: item, newName: name, newDetail: detail)
                presentationMode.wrappedValue.dismiss()
            }
            .disabled(!isFormValid))
        }
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: Item(name: "Exemplo", detail: "Detalhe"), viewModel: ItemViewModel())
    }
}
