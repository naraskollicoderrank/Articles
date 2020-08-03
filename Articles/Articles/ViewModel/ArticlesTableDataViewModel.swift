//
//  ArticlesTableDataViewModel.swift
//  Articles
//
//  Created by Avika on 03/08/20.
//  Copyright © 2020 Narasimhaiah Kolli. All rights reserved.
//

import UIKit

class ArticlesTableDataViewModel: NSObject {

    weak var viewModel: ArticlesViewModel?
    
    init(viewModel: ArticlesViewModel) {
        self.viewModel = viewModel
        super.init()
    }
}

extension ArticlesTableDataViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 1
        if let articleObj = self.viewModel?.articles,articleObj.count > 0 {
            count = articleObj.count
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.reuseidentifier, for: indexPath) as? ArticleTableViewCell
        cell?.selectionStyle = .none
        if let articleObj = self.viewModel?.articles, articleObj.count > indexPath.row {
            cell?.configure(article: articleObj[indexPath.row])
        }
        return cell ?? UITableViewCell()
    }
}
