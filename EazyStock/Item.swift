//
//  Item.swift
//  EazyStock
//
//  Created by Filipe Camargo Marques on 26/05/24.
//

import Foundation

struct Item: Identifiable {
    var id = UUID()
    var name: String
    var detail: String
}

