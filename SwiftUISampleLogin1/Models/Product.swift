//
//  Product.swift
//  SwiftUISampleLogin1
//
//  Created by Abhinav        on 11/03/26.
//


struct Product: Codable, Identifiable {
    var id: Int
    let name: String
    let price: String
    let rating: Int
    let description: String
    let image: String
}