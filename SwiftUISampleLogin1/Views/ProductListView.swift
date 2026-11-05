//
//  ProductListView.swift
//  SwiftUISampleLogin1
//
//  Created by Abhinav        on 26/02/26.
//

import SwiftUI

struct ProductListView: View {
    
    @State private var viewModel: ProductListViewModel = ProductListViewModel()
    @State private var deleteButtonState : Bool?
    @State private var itemIds: [Int?] = []
    @State private var isDialogeShown = false
    @Environment(AppRouter.self) var router
    
    var body: some View {
        List(viewModel.products) { product in
            ProductListItem(item: product, selectedItems: $itemIds, deleteButtonState: $deleteButtonState)
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color("Navy_blue"), for: .navigationBar)
        .toolbarBackgroundVisibility(.visible, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    isDialogeShown = true
                }) {
                    Image(systemName: "rectangle.portrait.and.arrow.right").colorInvert()
                }
                .confirmationDialog("Confirm Logout", isPresented: $isDialogeShown) {
                    Button("Logout") { router.reset() }
                } message: {
                    Text("You are about to logout. Are you sure?")
                }
            }
            .sharedBackgroundVisibility(.hidden)
            
            ToolbarItem(placement: .title) {
                Text("Product List (\(viewModel.products.count))")
                    .foregroundStyle(.white)
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    if deleteButtonState ?? false {
                        viewModel.deleteItems(items: itemIds)
                        deleteButtonState = false
                    } else {
                        router.push(.main(.about))
                    }
                }) {
                    HStack {
                        deleteButtonState ?? false ? Image(systemName: "trash").colorInvert() : Image(systemName: "line.3.horizontal").colorInvert()
                        
                    }
                }
            }
            .sharedBackgroundVisibility(.hidden)
        }
        .navigationBarBackButtonHidden(true)
    }
}


struct ProductListItem: View {
    
    let item: Product
    @Binding var selectedItems: [Int?]
    @Binding var deleteButtonState: Bool?
    var isSelected: Bool {
        selectedItems.contains(where: { $0 == item.id })
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image("Product_image")
                    .resizable()
                    .frame(width: 110, height: 110)
                    .cornerRadius(10)
                
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Text(item.name)
                            .font(.callout)
                            .foregroundStyle(.navyBlue)
                            .padding(.leading, 8)
                            .padding(.top, 12)
                            .lineLimit(1)
                        
                        Spacer()
                        
                        ZStack {
                            Rectangle()
                                .fill(.navyBlue)
                                .frame(width: 70, height: 30)
                                .clipShape(
                                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 0,bottomLeading: 10))
                                )
                            
                            Text("$\(item.price)")
                                .foregroundStyle(.white)
                        }
                    }
                    
                    Text(item.description)
                        .font(.caption)
                        .lineLimit(2)
                        .padding(.leading, 8)
                    
                    Spacer()
                        .frame(height: 10)
                    
                    HStack(spacing: 4) {
                        ForEach(0..<5, id: \.self) { index in
                            Image(systemName: index < item.id ? "star.fill" : "star")
                                .foregroundColor(index < item.id ? .orange : .gray)
                        }
                    }
                    .padding(.leading, 8)
                }
            }
            .onLongPressGesture {
                self.deleteButtonState = true
                self.selectedItems.append(item.id)
            }
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: isSelected ? .red : .gray, radius: 5)
    }
}

enum Route: Hashable {
    case listScreen
}



#Preview {
    ProductListView()
}
