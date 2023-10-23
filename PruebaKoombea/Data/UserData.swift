//
//  UserData.swift
//  PruebaKoombea
//
//  Created by Jorge Garay on 23/10/23.
//

import Foundation

struct UserData: Codable {
    let id: Int,
        firstName: String,
        lastName: String,
        username: String,
        email: String,
        gender: String,
        pictureURL: String,
        phone: String,
        birthday: String
}

enum NetworkError: Error {
    case badUrl,
        badResponse,
        badStatus,
        failedToDecodeResponse
}
