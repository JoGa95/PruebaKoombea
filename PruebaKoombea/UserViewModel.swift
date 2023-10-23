//
//  UserViewModel.swift
//  PruebaKoombea
//
//  Created by Jorge Garay on 23/10/23.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var usersArray = [UserData]()
    
    func fetchUsers() async {
        guard let usersResponse: [UserData] = await ApiCall().fetchUsers() else {return}
        usersArray = usersResponse
    }
}
