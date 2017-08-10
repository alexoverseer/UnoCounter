//
//  CoreDataManager.swift
//  Uno Counter
//
//  Created by Alexandr Pavlov on 8/9/17.
//  Copyright © 2017 Softintercom. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager: NSObject {
    
    static let context = DataAccesLayer.shared.managedObjectContext
    
    class func getAllPlayers() -> [Player]? {
        
        var playersArray : [Player]
        
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
            fetchRequest.entity = NSEntityDescription.entity(forEntityName: "Player", in: context)
            fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "name", ascending: true)]
            playersArray = try context.fetch(fetchRequest) as! [Player]
        } catch {
            fatalError("Failed to fetch players: \(error)")
        }
        
        return playersArray
    }
    
    class func addNewPlayerWithName(playerName: String) {
        
        let player = NSEntityDescription.insertNewObject(forEntityName: "Player", into: context) as! Player
        player.name = playerName
        player.playedCount = 0
        player.playerID = NSUUID().uuidString
        player.imageName = ""
        
        do {
            try context.save()
        } catch {
            fatalError("Failure to save new player: \(error)")
        }
    }
    
    class func deletePlayer(player: Player) {
            context.delete(player)
            try? context.save()
    }
}
