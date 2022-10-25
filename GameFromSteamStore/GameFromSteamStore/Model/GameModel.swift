//
//  Model.swift
//  GameFromSteamStore
//
//  Created by Burak Altunoluk on 25/10/2022.
//

import Foundation


struct Welcome: Decodable {
    let applist: GameList
}

struct GameModel: Decodable {
    let appid: Int
    let name: String
}

struct GameList: Decodable {
    let apps: [GameModel]
}


