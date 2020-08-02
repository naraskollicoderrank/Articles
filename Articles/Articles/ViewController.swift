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
    lazy var articlesview: ArticlesView = {
        let articlesView = ArticlesView()
        articlesView.configure()
        return articlesView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.viewModel.delegate = self
        self.view.backgroundColor = .white
        self.navigationItem.title = "Articles"
        self.view = articlesview
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
            self.articlesview.updateView(articles: articlesArray)
        }
    }
}
