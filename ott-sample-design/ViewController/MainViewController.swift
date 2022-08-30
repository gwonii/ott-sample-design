import UIKit

final class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setTabBar()
    }
    
    private func setTabBar() {
        let homeViewController: UINavigationController = .init(rootViewController: HomeViewController())
        homeViewController.tabBarItem.title = "Home"
        homeViewController.tabBarItem.image = .init(systemName: "house")
        let upcommingViewController: UINavigationController = .init(rootViewController: UpcommingViewController())
        upcommingViewController.tabBarItem.title = "Upcomming"
        upcommingViewController.tabBarItem.image = .init(systemName: "play.rectangle")
        let searchViewController: UINavigationController = .init(rootViewController: SearchViewController())
        searchViewController.tabBarItem.title = "Search"
        searchViewController.tabBarItem.image = .init(systemName: "magnifyingglass")
        let downloadsViewController: UINavigationController = .init(rootViewController: DownloadsViewController())
        downloadsViewController.tabBarItem.title = "Donwloads"
        downloadsViewController.tabBarItem.image = .init(systemName: "square.and.arrow.down.on.square.fill")
        
        setViewControllers([homeViewController, upcommingViewController, searchViewController, downloadsViewController], animated: true)
        
        tabBar.tintColor = .label
    }
}
