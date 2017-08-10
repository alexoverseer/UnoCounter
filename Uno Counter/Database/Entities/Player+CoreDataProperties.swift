//
//  Player+CoreDataProperties.swift
//  
//
//  Created by Alexandr Pavlov on 8/10/17.
//
//

import Foundation
import CoreData


extension Player {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Player> {
        return NSFetchRequest<Player>(entityName: "Player")
    }

    @NSManaged public var name: String?
    @NSManaged public var playedCount: Int32
    @NSManaged public var playerID: String?
    @NSManaged public var imageName: String?
    @NSManaged public var game: NSSet?

}

// MARK: Generated accessors for game
extension Player {

    @objc(addGameObject:)
    @NSManaged public func addToGame(_ value: Game)

    @objc(removeGameObject:)
    @NSManaged public func removeFromGame(_ value: Game)

    @objc(addGame:)
    @NSManaged public func addToGame(_ values: NSSet)

    @objc(removeGame:)
    @NSManaged public func removeFromGame(_ values: NSSet)

}
