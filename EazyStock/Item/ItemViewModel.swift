//
//  ItemViewModel.swift
//  EazyStock
//
//  Created by Filipe Camargo Marques on 26/05/24.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

class ItemViewModel: ObservableObject {
    @Published var items: [Item] = []
    private var db = Firestore.firestore()
    private var userID: String? {
        return Auth.auth().currentUser?.uid
    }

    init() {
        fetchItems()
    }

    func fetchItems() {
        guard let userID = userID else { return }

        db.collection("users").document(userID).collection("items").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }

            self.items = documents.compactMap { queryDocumentSnapshot -> Item? in
                let data = queryDocumentSnapshot.data()
                let id = data["id"] as? String ?? ""
                let name = data["name"] as? String ?? ""
                let detail = data["detail"] as? String ?? ""
                return Item(id: id, name: name, detail: detail)
            }
        }
    }

    func addItem(name: String, detail: String) {
        guard let userID = userID else { return }

        let newItem = Item(name: name, detail: detail)
        let itemRef = db.collection("users").document(userID).collection("items").document(newItem.id)

        itemRef.setData(newItem.toDictionary()) { error in
            if let error = error {
                print("Error adding item: \(error.localizedDescription)")
            }
        }
    }

    func updateItem(item: Item, newName: String, newDetail: String) {
        guard let userID = userID else { return }

        let itemRef = db.collection("users").document(userID).collection("items").document(item.id)

        itemRef.updateData([
            "name": newName,
            "detail": newDetail
        ]) { error in
            if let error = error {
                print("Error updating item: \(error.localizedDescription)")
            }
        }
    }

    func deleteItem(item: Item) {
        guard let userID = userID else { return }

        let itemRef = db.collection("users").document(userID).collection("items").document(item.id)

        itemRef.delete { error in
            if let error = error {
                print("Error deleting item: \(error.localizedDescription)")
            }
        }
    }
}

