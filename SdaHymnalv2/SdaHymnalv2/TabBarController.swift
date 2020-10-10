
import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Tab Bar Customisation
       
        //let chatVC = ConversationsViewController()
        viewControllers = [
            createTabBarItem(tabBarTitle: "Hymns", tabBarImage: "", viewController: ViewController()),
            createTabBarItem(tabBarTitle: "Search", tabBarImage: "", viewController: SearchForHymnViewController()),
            createTabBarItem(tabBarTitle: "Lyrics", tabBarImage: "", viewController: LyricsOnlyViewController()),
            createTabBarItem(tabBarTitle: "Bookmarks", tabBarImage: "", viewController: BookmarksViewController())
        ]
        
        //chatVC.tabBarItem.image = UIImage(named: "recent")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }
    func createTabBarItem(tabBarTitle: String, tabBarImage: String, viewController: UIViewController) -> UINavigationController {
        let navCont = UINavigationController(rootViewController: viewController)
        navCont.tabBarItem.title = tabBarTitle
        //navCont.tabBarItem.image = UIImage(named: tabBarImage)

        // Nav Bar Customisation
        
        return navCont
    }
}
