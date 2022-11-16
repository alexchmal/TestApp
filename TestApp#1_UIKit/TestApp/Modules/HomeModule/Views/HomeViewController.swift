//
//  HomeViewController.swift
//  TestApp
//
//  Created by Alex Chmal on 15.11.22.
//

import UIKit

class HomeViewController: UIViewController {
    var tableView: UITableView!
    var indicatorView: UIActivityIndicatorView!
    
    var presenter: HomePresenterProtocol?
    
    let cellID = "homeTableViewCell"
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        prepareTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("Users", tableName: "Localizable", comment: "")
        
        presenter?.loadSource()
    }
    
    private func prepareTableView() {
        tableView = UITableView(frame: .zero, style: .plain)
        
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView.separatorStyle = .none
        
        tableView?.register(HomeTableViewCell.self, forCellReuseIdentifier: cellID)
        view.addSubview(tableView)
        
        tableView?.translatesAutoresizingMaskIntoConstraints = false
        
        tableView?.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView?.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        indicatorView = UIActivityIndicatorView(style: .large)
        view.addSubview(indicatorView)
        
        indicatorView?.translatesAutoresizingMaskIntoConstraints = false
        indicatorView?.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        indicatorView?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.itemCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! HomeTableViewCell
        presenter?.configure(cell: cell, index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        presenter?.showDetails(index: indexPath.row)
    }
}

extension HomeViewController: HomeViewProtocol {
    
    func showActivityIndicator(loading: Bool) {
        if loading {
            indicatorView.startAnimating()
        } else {
            indicatorView.stopAnimating()
        }
    }
    
    func reloadSource() {
        tableView.reloadData()
    }
}
