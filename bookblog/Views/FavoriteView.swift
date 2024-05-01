//
//  FavoriteView.swift
//  bookblog
//
//  Created by Artyom Danko on 30.04.24.
//

import SwiftUI

struct FavoriteView: View {
    @ObservedObject private var viewModel = favoriteViewModel()
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 40){
                    ForEach(0..<viewModel.books.count, id: \.self) {
                        index in
                        NavigationLink(destination: BookView(book: $viewModel.books[index])) {
                            Text(viewModel.books[index].title)
                            
                        }
                        Divider()
                    }
                }
            }.navigationTitle("Favorite")
                .navigationBarTitleDisplayMode(.inline)
                
        }.onAppear() {
            viewModel.fetchData()
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
