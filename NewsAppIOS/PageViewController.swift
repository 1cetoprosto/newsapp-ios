//
//  PageViewController.swift
//  NewsAppIOS
//
//  Created by leomac on 27.02.2021.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {

    
    @IBAction func pushRefreshAction(_ sender: UIBarButtonItem) {
        loadNews {
            self.showNewsControlers()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        
        self.showNewsControlers()
        
        loadNews {
            self.showNewsControlers()
        }
    }

    func showNewsControlers() {
        DispatchQueue.main.async {
            if let vc = self.pageViewController(for: 0) {
                self.setViewControllers([vc], direction: .forward, animated: true, completion: nil)
            }
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = ((viewController as? OneNewsViewController)?.index ?? 0) - 1
        return self.pageViewController(for: index)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = ((viewController as? OneNewsViewController)?.index ?? 0) + 1
        return self.pageViewController(for: index)
    }
    
    func pageViewController(for index: Int) -> OneNewsViewController? {
        
        if index < 0 {
            return nil
        }
        
        if index > articles.count {
            return nil
        }
        
        let vc = (storyboard?.instantiateViewController(identifier: "oneNewsSID") as! OneNewsViewController)
        vc.article = articles[index]
        vc.index = index
        
        return vc
    }
    
}
