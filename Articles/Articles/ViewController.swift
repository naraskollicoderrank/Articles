//
//  ViewController.swift
//  Articles
//
//  Created by Avika on 02/08/20.
//  Copyright © 2020 Narasimhaiah Kolli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let viewModel: ArticlesViewModel = ArticlesViewModel()
    lazy var articlesview: ArticlesView = {
        return ArticlesView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "Articles"
        self.view = articlesview
        getCities()
        binder()
    }
}

//MARK: API calls
extension ViewController {
    func binder() {
        self.viewModel.model.bindAndFire { (articles) in
                   
        }
    }
    func getCities() {
        self.viewModel.getArticles(page: 1, count: 10, successHandler: { (data, error) in
            
        }, failureHandler: { (data, error) in
            
        })
    }
}
