//
//  ProductListViewModel.swift
//  SwiftUISampleLogin1
//
//  Created by Abhinav        on 27/02/26.
//

import Foundation
internal import Combine

class ProductListViewModel : ObservableObject {
    
    @Published var products: [Product] = [
        Product(
            id: 1,
            name: "Liquid Matte Lipstick",
            price: "25",
            rating: 3,
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            image: "liquid_matte_lipstick_1"
        ),
        Product(
            id: 2,
            name: "West Lime Evelyn",
            price: "28",
            rating: 4,
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            image: "west_lime_evelyn"
        ),
        Product(
            id: 3,
            name: "Laneige Lipstick",
            price: "32",
            rating: 2,
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            image: "laneige_lipstick"
        ),
        Product(
            id: 4,
            name: "Milani Smooth Finish",
            price: "25",
            rating: 5,
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            image: "milani_smooth_finish"
        ),
        Product(
            id: 5,
            name: "Liquid Matte Lipstick",
            price: "35",
            rating: 3,
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            image: "liquid_matte_lipstick_2"
        )
    ]
    
    func deleteItems(items: [Int?]) {
        products.removeAll { items.contains($0.id) }
    }
}
