//
//  ContentView.swift
//  EazyStock
//
//  Created by Filipe Camargo Marques on 25/05/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ItemViewModel()
    @State private var showingAddItem = false
    @State private var showingDetail = false
    @State private var selectedItem: Item?

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.items) { item in
                    Button(action: {
                        selectedItem = item
                        showingDetail = true
                    }) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(item.name)
                                .font(.headline)
                                .foregroundColor(.primary)
                            Text(item.detail)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    }
                    .sheet(isPresented: $showingDetail) {
                        if let selectedItem = selectedItem {
                            ItemDetailView(item: selectedItem, viewModel: viewModel)
                        }
                    }
                }
                .onDelete(perform: deleteItem)
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Itens")
            .navigationBarItems(trailing: Button(action: {
                showingAddItem = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingAddItem) {
                AddItemView(viewModel: viewModel)
            }
        }
    }

    func deleteItem(at offsets: IndexSet) {
        offsets.forEach { index in
            let item = viewModel.items[index]
            viewModel.deleteItem(item: item)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
