//
//  DetailsViewController.swift
//  TestApp
//
//  Created by Alex Chmal on 16.11.22.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {
    let cellID = "detailsTableViewCell"
    
    var imageView: UIImageView!
    var tableView: UITableView!
    var presenter: DetailsPresenter?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.3).isActive = true
        
        prepareTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.prepareContent()
    }
    
    // MARK: - Helper
    
    private func prepareTableView() {
        tableView = UITableView(frame: .zero, style: .plain)
        
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView.separatorStyle = .none
        
        tableView?.register(DetailsTableViewCell.self, forCellReuseIdentifier: cellID)
        view.addSubview(tableView)
        
        tableView?.translatesAutoresizingMaskIntoConstraints = false
        
        tableView?.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0).isActive = true
        tableView?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView?.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.itemCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! DetailsTableViewCell
        presenter?.configure(cell: cell, index: indexPath.row)
        return cell
    }
}

extension DetailsViewController: DetailsViewProtocol {
    func updateHeaderImage(_ image: String) {
        guard let url = URL(string: image) else { return }
        imageView.kf.setImage(with: url)
    }
}
