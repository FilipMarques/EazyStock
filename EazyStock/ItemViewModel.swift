//
//  ItemViewModel.swift
//  EazyStock
//
//  Created by Filipe Camargo Marques on 26/05/24.
//

import SwiftUI
import Combine

class ItemViewModel: ObservableObject {
    @Published var items: [Item] = []

    func addItem(name: String, detail: String) {
        let newItem = Item(name: name, detail: detail)
        items.append(newItem)
    }

    func updateItem(item: Item, newName: String, newDetail: String) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].name = newName
            items[index].detail = newDetail
        }
    }

    func deleteItem(item: Item) {
        items.removeAll { $0.id == item.id }
    }
}
