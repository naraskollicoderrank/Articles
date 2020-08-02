//
//  ArticlesView.swift
//  Articles
//
//  Created by Avika on 02/08/20.
//  Copyright © 2020 Narasimhaiah Kolli. All rights reserved.
//

import UIKit

class ArticlesView: UIView, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var articles: [Article]?
    
    func configure() {
        self.backgroundColor = .white
    }
    
    func  updateView(articles: [Article]) {
        self.articles = articles
        if let _ = tableView {
            self.tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 1
        if let articleObj = self.articles,articleObj.count > 0 {
            count = articleObj.count
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.reuseidentifier, for: indexPath) as? ArticleTableViewCell
        if let articleObj = self.articles, articleObj.count > indexPath.row {
            cell?.configure(article: articleObj[indexPath.row])
        }
        return cell ?? UITableViewCell()
    }
}
