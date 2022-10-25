//
//  GameViewModel.swift
//  GameFromSteamStore
//
//  Created by Burak Altunoluk on 25/10/2022.
//

import Foundation

struct GameViewModel {
    
    var game: GameModel
    
    var appid: Int {
        return game.appid
    }
    
    var name: String {
        return game.name
    }
    
    init(_ element: GameModel) {
        self.game = element
    }
}

struct GameListViewModel {
    
    var gameList = [GameModel]()
    
    func rowNumberSection() -> Int {
        gameList.count
    }
    
    func indexAtRow(_ number: Int) -> GameViewModel{
        let choosedGame = gameList[number]
        return GameViewModel(choosedGame)
    }
    
    func getDataFromApi(completion: @escaping([GameModel]?) -> ()) {
        let url = URL(string: "http://api.steampowered.com/ISteamApps/GetAppList/v0002/?format=json")
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            
            if let data = data {
                print("Yallah")
                let list = try? JSONDecoder().decode(Welcome.self, from: data)
                
                if list != nil {
                    completion((list?.applist.apps)!)
                }
            }
        } .resume()
    }
}

