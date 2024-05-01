//
//  BookView.swift
//  bookblog
//
//  Created by Artyom Danko on 30.04.24.
//

import SwiftUI

struct BookView: View {
    @State private var currentIndex = 0
        let timer = Timer.publish(every: 30, on: .main, in: .common).autoconnect()
    @Binding var book : Book
    @ObservedObject private var viewModel = favoriteBookViewModel()
    
    var body: some View {
        
        VStack(alignment: .leading) {
            VStack(spacing: 0) {
                TabView(selection: $currentIndex) {
                    ForEach(0..<book.images.count, id: \.self) {
                        imageIndex in
                        AsyncImage(url: URL(string: book.images[imageIndex]),
                                   content: {
                            image in
                            image.image?
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(maxWidth: 300, maxHeight: 150)
                        })
                            .scaledToFill()
                            .frame(maxHeight: 200)
                            .cornerRadius(30)
                            .clipped()
                            .tag(imageIndex)
                    }
                }.tabViewStyle(PageTabViewStyle())
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }.onReceive(timer){_ in
                withAnimation {
                    currentIndex = (currentIndex + 1) % 4
                }
            }
            ScrollView{
                VStack {
                    HStack {
                        Image(systemName: "paperplane")
                        Text(book.title)
                    }.padding()
                    Divider()
                    HStack {
                        Image(systemName: "doc")
                        Text(book.description)
                    }.padding()
                    Divider()
                    HStack {
                        Image(systemName: "highlighter")
                        Text(book.author)
                    }.padding()
                    Button {
                        viewModel.changeFav(book: book)
                    } label: {
                        viewModel.isFav ?
                        Text("Remove from favorite").foregroundColor(.white).font(.title3).bold().frame(maxWidth: .infinity).padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.black)).padding() :
                        Text("Add to favorite").foregroundColor(.white).font(.title3).bold().frame(maxWidth: .infinity).padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.black)).padding()
                    }
                }
            }
            
        }.navigationTitle(book.title).navigationBarTitleDisplayMode(.inline)
            .onAppear() {
                viewModel.checkIsFav(book: book)
            }
    }
}


