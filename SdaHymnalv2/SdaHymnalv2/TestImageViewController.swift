//
//  TestImageViewController.swift
//  SdaHymnal
//  Created by Bryan Guerra on 9/18/20.


import UIKit

class TestImageViewController: UIViewController {
    
    
    
    init(with photo: UIImage) {
        self.backgroundImage = photo
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    var backgroundImage = UIImage()
    
    var imageView1: UIImageView!
    //var imageView: UIImageView!
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    public let imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true

        return imageView
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print("image added")
        view.addSubview(scrollView)
        //view.addSubview(imageView)
        scrollView.addSubview(imageView)
        imageView.image = backgroundImage
        scrollView.maximumZoomScale = 4
        scrollView.minimumZoomScale = 1
        scrollView.delegate = self
       
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        imageView.frame = view.bounds
        imageView.center = view.center
     
    }


}


extension TestImageViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
