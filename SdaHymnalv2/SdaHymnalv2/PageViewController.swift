//
//  PageViewController.swift
//  SdaHymnalv2
//
//  Created by Bryan Guerra on 10/10/20.
//

//
//  PageViewController.swift
//  PageControl
//
//  Created by Andrew Seeley on 2/2/17.
//  Copyright © 2017 Seemu. All rights reserved.
//
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

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    
    var pageControl = UIPageControl()
    
    var myControllers = [UIViewController]()

    // MARK: UIPageViewControllerDataSource
//

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        
        for songs in hymns {
                 let vc = TestImageViewController(with: songs )
    
                 myControllers.append(vc)
        }
        
        
        // This sets up the first view that will show up on our page control
        if let firstViewController = myControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        
        configurePageControl()
        
        // Do any additional setup after loading the view.
    }

    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 50,width: UIScreen.main.bounds.width,height: 50))
        self.pageControl.numberOfPages = myControllers.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.white
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }
    
    func newVc(viewController: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }
    
    
    // MARK: Delegate methords
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = myControllers.index(of: pageContentViewController)!
    }
    
    // MARK: Data source functions.
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = myControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        // User is on the first view controller and swiped left to loop to
        // the last view controller.
        guard previousIndex >= 0 else {
            return myControllers.last
            // Uncommment the line below, remove the line above if you don't want the page control to loop.
            // return nil
        }
        
        guard myControllers.count > previousIndex else {
            return nil
        }
        
        return myControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = myControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = myControllers.count
        
        // User is on the last view controller and swiped right to loop to
        // the first view controller.
        guard orderedViewControllersCount != nextIndex else {
            return myControllers.first
            // Uncommment the line below, remove the line above if you don't want the page control to loop.
            // return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return myControllers[nextIndex]
    }
    

}

