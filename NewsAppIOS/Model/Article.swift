//
//  Article.swift
//  NewsApp
//
//  Created by leomac on 26.02.2021.
//

/*
 -"source": {
 "id": null,
 "name": "Lifehacker.com"
 },
 "author": "Brendan Hesse",
 "title": "How to Limit Google's Apps From Tracking You on Your Apple Devices",
 "description": "Apple recently updated its App Store and iOS privacy policies to force app developers to be more transparent about their data collection practices. As a result, users have a little more insight (and, ideally, control) over what data various companies can trac…",
 "url": "https://lifehacker.com/how-to-limit-googles-apps-from-tracking-you-on-your-app-1846357454",
 "urlToImage": "https://i.kinja-img.com/gawker-media/image/upload/c_fill,f_auto,fl_progressive,g_center,h_675,pg_1,q_80,w_1200/ro3eog6v2thmrfak5twa.jpg",
 "publishedAt": "2021-02-25T21:00:00Z",
 "content": "Apple recently updated its App Store and iOS privacy policies to force app developers to be more transparent about their data collection practices. As a result,users have a little more insight (and, … [+2995 chars]"
 */


import Foundation

struct Article {
    
    var author: String
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String
    var sourceName:String
    
    init(dictionary: Dictionary <String, Any>) {
        author = dictionary["author"] as? String ?? ""
        title = dictionary["title"] as? String ?? ""
        description = dictionary["description"] as? String ?? ""
        url = dictionary["url"] as? String ?? ""
        urlToImage = dictionary["urlToImage"] as? String ?? ""
        publishedAt = dictionary["publishedAt"] as? String ?? ""
        sourceName = (dictionary["source"] as? Dictionary <String, Any> ?? ["":""])["name"] as? String ?? ""
        
    }
}
