//
//  ProfileViewModel.swift
//  bookblog
//
//  Created by Artyom Danko on 1.05.24.
//

import Foundation
class ProfileViewModel : ObservableObject {
    @Published var user = User()
    var firestoreHandler = FirebaseFirestoreHandler()
    
    func fetchData() {
        firestoreHandler.getUser {
            user in
                self.user = user
        }
    }
}
