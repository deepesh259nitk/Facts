//
//  ViewController.swift
//  CatFacts
//
//  Created by Deepesh Vasthimal on 19/12/2023.
//

import UIKit

class CatFactViewController: UIViewController, CatFactViewModelOutput {

    enum Section {
        case main
    }
    
    enum Constants {
        static let factTitle = NSLocalizedString("factTitle", comment: "")
        static let searchTextPlaceholder = NSLocalizedString("searchTextPlaceholder", comment: "")
        static let errorTitle = NSLocalizedString("errorTitle", comment: "")
        static let alertButtonTitle = NSLocalizedString("alertButtonTitle", comment: "")
    }
    
    let searchController = UISearchController(searchResultsController: nil)
    private var catFactViewModel: CatFactViewModel
    private var tableView: UITableView!
    private var dataSource: UITableViewDiffableDataSource<Section, CatFact>!
    var catFacts: [CatFact] = []
    
    init(catFactViewModel: CatFactViewModel) {
        self.catFactViewModel = catFactViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = Constants.factTitle
        setUpSearchController()
        configureTableView()
        configureDataSource()
        catFactViewModel.delegate = self
        showLoadingView()
    
        DispatchQueue.main.async {
            self.catFactViewModel.fetchCatFact()
        }

    }

    func setUpSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = Constants.searchTextPlaceholder
        
        navigationItem.searchController = searchController
        definesPresentationContext = false
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func configureTableView() {
        
        tableView = UITableView()
        tableView.register(CatFactCell.self, forCellReuseIdentifier: CatFactCell.Constants.resuseID)
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.allowsSelection = false
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .systemBlue
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)]
        )
    }
    
    // MARK: ViewModel Output Methods
    func updateView(with catFacts: [CatFact]) {
        dismissLoadingView()
        self.catFacts = catFacts
        self.updateData(on: self.catFacts)
    }
    
    func updateView(with error: Error) {
        dismissLoadingView()
        guard let netWorkError = error as? NetworkError else {
            return
        }
        presentCFAlertOnMainThread(title: Constants.errorTitle, message: netWorkError.description, buttonTitle: Constants.alertButtonTitle)
    }

    //MARK: UITableView Diffable Data Source methods
    func configureDataSource() {
        dataSource = UITableViewDiffableDataSource<Section, CatFact>(tableView: tableView, cellProvider: { tableView, indexPath, catFact in
            let cell = tableView.dequeueReusableCell(withIdentifier: CatFactCell.Constants.resuseID) as! CatFactCell
            cell.set(catFact: catFact)
            return cell
        })
    }
    
    func updateData(on catFacts: [CatFact]) {
        var snapShot = NSDiffableDataSourceSnapshot<Section, CatFact>()
        snapShot.appendSections([.main])
        snapShot.appendItems(catFacts)
        DispatchQueue.main.async {
            self.dataSource.apply(snapShot, animatingDifferences: true)
        }
    }
}
                               
// MARK: SearchController methods
extension CatFactViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let searchText = searchController.searchBar.text, !searchText.isEmpty else {
            self.updateData(on: self.catFacts)
            return
        }
        
        let filteredFacts = CatFact.filter(in: self.catFacts, with: searchText)
        self.updateData(on: filteredFacts)
    }
}
