//
//  DetailsTableViewCell.swift
//  TestApp
//
//  Created by Alex Chmal on 16.11.22.
//

import UIKit

protocol DetailsTableViewCellProtocol {
    func updateTitleLabel(text: String)
    func updateBodyCountLabel(text: String)
}

class DetailsTableViewCell: BaseCell {
    
    var titleLabel: UILabel!
    var bodyLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareContent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func prepareContent() {
        
        if titleLabel == nil {
            titleLabel = UILabel()
            titleLabel.numberOfLines = 0
            self.addSubview(titleLabel)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            
            titleLabel.topAnchor.constraint(equalTo: contentBGView.topAnchor, constant: 18).isActive = true
            titleLabel.leadingAnchor.constraint(equalTo: contentBGView.leadingAnchor, constant: 18).isActive = true
            titleLabel.trailingAnchor.constraint(equalTo: contentBGView.trailingAnchor, constant: -18).isActive = true
        }
        
        if bodyLabel == nil {
            bodyLabel = UILabel()
            bodyLabel.numberOfLines = 0
            self.addSubview(bodyLabel)
            bodyLabel.translatesAutoresizingMaskIntoConstraints = false
            
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
            bodyLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0).isActive = true
            bodyLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 0).isActive = true
            bodyLabel?.bottomAnchor.constraint(equalTo: contentBGView.bottomAnchor, constant: -18).isActive = true
        }
    }
}

extension DetailsTableViewCell: DetailsTableViewCellProtocol {
    func updateTitleLabel(text: String) {
        titleLabel.text = text
    }
    
    func updateBodyCountLabel(text: String) {
        bodyLabel.text = text
    }
}
