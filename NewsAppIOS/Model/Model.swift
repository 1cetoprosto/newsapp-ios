//
//  Model.swift
//  NewsApp
//
//  Created by leomac on 26.02.2021.
//

import Foundation

var articles: [Article] = []

var urlToData: URL {
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]+"/data.json"
    let urlPath = URL(fileURLWithPath: path)
    return urlPath
}


func loadNews(completionHandler: (()->Void)?) {
    
    let apiKey: String = "82a94e16072144418eaa6c21365bbdf2"
    let url = URL(string: "https://newsapi.org/v2/everything?q=Apple&from=2021-02-26&sortBy=popularity&apiKey=\(apiKey)")!
    let session = URLSession(configuration: .default)
    
    let downLoadTask = session.downloadTask(with: url) {(urlFile, respons, error) in
        if urlFile != nil {
                        
            try? FileManager.default.copyItem(at: urlFile!, to: urlToData)
            parseNews()
            completionHandler?()
        }
    }
    
    downLoadTask.resume()
    
}

func parseNews() {

    let data = try? Data(contentsOf: urlToData)
    if data == nil {
        print("Data not received from server")
        return
    }
    
    let rootDirectoryAny = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
    if rootDirectoryAny == nil {
        print("Invalid json-file structure")
        return
    }
    
    let rootDirectory = rootDirectoryAny as? Dictionary<String, Any>
    if rootDirectory == nil {
        print("Invalid json-file structure")
        return
    }
    
    if let array = rootDirectory!["articles"] as? [Dictionary<String,Any>] {
        
        //var returnArray: [Article] = []
        
        for dict in array {
            let  newArticles = Article(dictionary: dict)
            articles.append(newArticles)
        }
    }
}


