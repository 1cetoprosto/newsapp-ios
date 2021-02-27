//
//  OneNewsViewController.swift
//  NewsAppIOS
//
//  Created by leomac on 27.02.2021.
//

import UIKit
import SafariServices

class OneNewsViewController: UIViewController {
    
    var index:Int = 0
    
    var article: Article!
        
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelOpenInSafari: UIButton!
    
    
    @IBAction func pushOpenAction(_ sender: UIButton) {
        if let url = URL(string: article.url) {
            let svc = SFSafariViewController(url: url)
            present(svc, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelTitle.text = article.title
        labelDescription.text = article.description
        
        DispatchQueue.main.async {
            if let url = URL(string: self.article.urlToImage){
                if let data = try? Data(contentsOf: url) {
                    self.imageView.image = UIImage(data: data)
                } else {
                    self.activityIndicator.stopAnimating()
                }
            } else {
                self.activityIndicator.stopAnimating()
            }
            if URL(string: self.article.url) == nil {
                //скрываем кнопку
                self.labelOpenInSafari.isEnabled = false
            }
        }
    }
    
}
