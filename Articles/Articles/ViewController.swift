//
//  ViewController.swift
//  Articles
//
//  Created by Avika on 02/08/20.
//  Copyright © 2020 Narasimhaiah Kolli. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ArticlesDataProtocol {
    let viewModel: ArticlesViewModel = ArticlesViewModel()
    @IBOutlet weak var tableView: UITableView!
    var articles: [Article]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.viewModel.delegate = self
        self.view.backgroundColor = .white
        self.navigationItem.title = "Articles"
        getArticles()
    }
}

//MARK: API calls
extension ViewController {
    
    func getArticles() {
        self.viewModel.getArticles(page: 1, count: 10)
    }
    
    func updateArticles(articles: [Article]?) {
        if let articlesArray = articles {
            self.updateView(articles: articlesArray)
        }
    }
    
    func  updateView(articles: [Article]) {
        self.articles = articles
        if let _ = tableView {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
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
