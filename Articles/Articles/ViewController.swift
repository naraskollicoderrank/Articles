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
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.viewModel.delegate = self
        self.view.backgroundColor = .white
        self.navigationItem.title = "Articles"
        self.tableView.rowHeight = 350
        self.tableView.estimatedRowHeight = 350
        self.tableView.dataSource = self.viewModel.delegateanddatasource
        //self.tableView.prefetchDataSource = self.viewModel.delegateanddatasource
        
        getArticles()
    }
}

//MARK: API calls
extension ViewController : ArticlesDataProtocol{
    
    func getArticles() {
        self.viewModel.getArticles(page: 1, count: 10)
    }
    
    func updateArticles() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}


