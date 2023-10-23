//
//  UsersView.swift
//  PruebaKoombea
//
//  Created by Jorge Garay on 23/10/23.
//

import SwiftUI

struct UsersView: View {
    @StateObject var viewModel = UserViewModel()
    var body: some View {
        NavigationView {
            List(viewModel.usersArray, id: \.id) { user in
                HStack {
                    AsyncImage(url: URL(string: user.pictureURL))
                        .frame(maxWidth: 40, maxHeight: 40)
                        .padding(10)
                    Spacer()
                    VStack {
                        Text("\(user.firstName) \(user.lastName)")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        Text("Phone")
                            .font(.subheadline)
                            .fontWeight(.thin)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Image(systemName: "info.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                    Spacer()
                }
                Spacer()
                .padding(10)
            }
            .onAppear {
                if viewModel.usersArray.isEmpty {
                    Task {
                        await viewModel.fetchUsers()
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
