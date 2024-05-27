//
//  Item.swift
//  EazyStock
//
//  Created by Filipe Camargo Marques on 26/05/24.
//

import Foundation

struct Item: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var detail: String

    func toDictionary() -> [String: Any] {
        return [
            "id": id,
            "name": name,
            "detail": detail
        ]
    }
}


