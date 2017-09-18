import UIKit

final class GamesViewController: UIViewController, StoryboardInstantiable {
    
    static var storyboardName = "GamesViewController"
    
    // MARK: - Outlets
    
    @IBOutlet weak var noGamesLabel: UILabel!
    @IBOutlet weak var gamesTableView: UITableView! {
        didSet {
            gamesTableView.tableFooterView = UIView()
        }
    }
    
    var gamesArray = [Game]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        gamesArray = CoreDataManager.getAllGames()!
        gamesArray.count > 0 ? (noGamesLabel.isHidden = true) : (noGamesLabel.isHidden = false)
        gamesTableView.reloadData()
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        
        super.setEditing(editing, animated: animated)
        gamesTableView.setEditing(editing, animated: animated)
    }
}

// MARK: - Extensions

extension GamesViewController: UITableViewDataSource, UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return gamesArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 72
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: GamesTableViewCell.identifier, for: indexPath) as! GamesTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
//        let controller = self.storyboard?.instantiateViewController(withIdentifier: PlayerPreviewViewController.identifier)
//        navigationController?.pushViewController(controller!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
//            CoreDataManager.deletePlayer(player: playersArray[indexPath.row])
//            playersArray.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .automatic)
            gamesArray.count > 0 ? (noGamesLabel.isHidden = true) : (noGamesLabel.isHidden = false)
        }
    }
}

// MARK: - Cell

class GamesTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: GamesTableViewCell.self)
}
