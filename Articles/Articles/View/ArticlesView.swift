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
    
    func  updateView(articles: [Article]) {
        self.articles = articles
        self.tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        if let larticles = articles,
        larticles.count > 0 {
            count = larticles.count
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.reuseidentifier, for: indexPath) as? ArticleTableViewCell
        if let articlesArray = self.articles, articlesArray.count > indexPath.row {
            cell?.configure(article: articlesArray[indexPath.row])
        }
        return cell ?? UITableViewCell()
    }
}
