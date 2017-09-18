import UIKit

final class RootViewController: UITabBarController, StoryboardInstantiable {

    static var storyboardName = "RootViewController"
    
    struct TabBarItem {
        let title: String
        let image: UIImage
        let selectedImage: UIImage
    }
    
    fileprivate lazy var tabBarItemsArray: [TabBarItem] = {
        
        return [TabBarItem(title: "Games", image: #imageLiteral(resourceName: "tabBarIconGame"), selectedImage: #imageLiteral(resourceName: "tabBarIconGame")),
                TabBarItem(title: "Players", image: #imageLiteral(resourceName: "tabBarIconFriends"), selectedImage: #imageLiteral(resourceName: "tabBarIconFriends")),
                TabBarItem(title: "Settings", image: #imageLiteral(resourceName: "tabBarIconSettings"), selectedImage: #imageLiteral(resourceName: "tabBarIconSettings"))]
    }()
    
    let controllers = [GamesViewController.instantiate(), PlayersViewController.instantiate(), SettingsViewController.instantiate()]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for (idx, controller) in controllers.enumerated() {
            controller.tabBarItem = UITabBarItem.init(title: tabBarItemsArray[idx].title, image: tabBarItemsArray[idx].image, selectedImage: tabBarItemsArray[idx].selectedImage)
        }
        
        viewControllers = controllers;
    }
}
