//
//  ViewController.swift
//  SDAHymnal1.5
//
//  Created by Bryan Guerra on 10/9/20.
//  Created by Bryan Guerra on 9/18/20.
//

import UIKit
let hymns: [UIImage] = [
    UIImage(named: "A_Child_of_the_King.png")!,
    UIImage(named: "A_Diligent_and_Grateful_Heart.png")!,
    UIImage(named: "A_Hymn_of_Glory_Let_Us_Sing.png")!,
    UIImage(named: "A_Mighty_Fortress.png")!,
    UIImage(named: "A_Quiet_Place.png")!,
    UIImage(named: "A_Shelter_in_the_Time_of_Storm.png")!,
    UIImage(named: "A_Song_of_Heaven_and_Homeland.png")!,
    UIImage(named: "Abide_With_Me,_'Tis_Eventide.png")!,
    UIImage(named: "Abide_With_Me.png")!,
    UIImage(named: "All_Creatures_of_Our_God_and_King.png")!,
    UIImage(named: "All_Glory,_Laud,_and_Honor.png")!,
    UIImage(named: "All_Hail_the_Power_of_Jesus'_Name.png")!,
    UIImage(named: "All_My_Hope_on_God_Is_Founded.png")!,
    UIImage(named: "All_People_That_on_Earth_Do_Dwell.png")!,
    UIImage(named: "All_Praise_to_Thee.png")!,
    UIImage(named: "All_That_Thrills_My_Soul.png")!,
    UIImage(named: "All_the_Way.png")!,
    UIImage(named: "All_Things_Are_Thine.png")!,
    UIImage(named: "All_Things_Bright_and_Beautiful.png")!,
    UIImage(named: "All_Things_Come_of_Thee.png")!,
    UIImage(named: "All_Things_Come_of_Thee.png")!,
    UIImage(named: "All_Things_Bright_and_Beautiful.png")!,
    
 ]

class ViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
  
    
    var myControllers = [UIViewController]()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.tintColor = .gray
        imageView.contentMode = .scaleToFill
        imageView.layer.masksToBounds = true

        return imageView
        
    }()
    
    //var myControllers = [UIViewController]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        
        for songs in hymns {
            let vc = TestImageViewController(with: songs )
            
            myControllers.append(vc)
        }
        

        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = view.bounds
        imageView.center = view.center
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
            self.presentPageVC()
        })
    }
    
    func presentPageVC(){
        guard let first = myControllers.first else {
            return
        }
        
        let vc = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
        vc.delegate = self
        vc.dataSource = self
        vc.setViewControllers([first], direction: .forward, animated: true, completion: nil)
        
//        vc.modalPresentationStyle = .fullScreen //not full screen
//        present(vc, animated: true)
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.navigationBar.topItem?.title = "Hymns"
        navigationController.modalPresentationStyle = .fullScreen //set NAV full screen
        
 
        vc.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearchButton))
        
        
      
    
      present(navigationController, animated: true)
      
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
         
        guard let index = myControllers.firstIndex(of: viewController), index > 0  else{
             return nil
        }
        let before = index - 1
        return myControllers[before]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = myControllers.firstIndex(of: viewController), index <  (myControllers.count - 1)  else{
             return nil
        }
        let after = index + 1
        return myControllers[after]
    }
    
    @objc private func didTapSearchButton(){
        print("In the did tap search func")
        self.dismiss(animated: true, completion: nil)
        let vc = SearchForHymnViewController()
        //let navVC = UINavigationController(rootViewController: vc)
        self.view.window?.rootViewController = vc
        
        present(vc, animated: false)
            
    }
    
    
}

