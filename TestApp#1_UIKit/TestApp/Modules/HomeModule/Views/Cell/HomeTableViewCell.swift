//
//  HomeTableViewCell.swift
//  TestApp
//
//  Created by Alex Chmal on 15.11.22.
//

import UIKit
import Kingfisher

protocol HomeTableViewCellProtocol {
    func updateAvatar(urlString: String)
    func updateNameLabel(text: String)
    func updatePhotoCountLabel(text: String)
}

class BaseCell: UITableViewCell {
    var contentBGView: UIView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareContent()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func prepareContent() {
        
        if contentBGView == nil {
            contentBGView = UIView()
            addSubview(contentBGView)
            contentBGView?.translatesAutoresizingMaskIntoConstraints = false
            
            contentBGView?.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
            contentBGView?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
            contentBGView?.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
            contentBGView?.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
            contentBGView?.layer.cornerRadius = 26
        }
        contentBGView?.layer.borderColor = UIColor.systemBlue.cgColor
        contentBGView?.layer.borderWidth = 1
    }
}

class HomeTableViewCell: BaseCell {
    
    var avatarImageView: UIImageView!
    var nameLabel: UILabel!
    var photoCountLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareContent()
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    private func prepareContent() {
    
        if avatarImageView == nil {
            avatarImageView = UIImageView()
            contentBGView.addSubview(avatarImageView)
            avatarImageView?.translatesAutoresizingMaskIntoConstraints = false
            
            avatarImageView?.topAnchor.constraint(equalTo: contentBGView.topAnchor, constant: 18).isActive = true
            
            avatarImageView?.leadingAnchor.constraint(equalTo: contentBGView.leadingAnchor, constant: 18).isActive = true

            
            avatarImageView?.widthAnchor.constraint(equalToConstant: 50).isActive = true
            avatarImageView?.heightAnchor.constraint(equalToConstant: 50).isActive = true
            avatarImageView?.layer.cornerRadius = 50/2
            avatarImageView?.clipsToBounds = true
        }
        
        
        if nameLabel == nil {
            nameLabel = UILabel()
            nameLabel.textColor = .systemBlue
            contentBGView.addSubview(nameLabel)
            nameLabel?.translatesAutoresizingMaskIntoConstraints = false
            
            nameLabel?.topAnchor.constraint(equalTo: contentBGView.topAnchor, constant: 18).isActive = true

            nameLabel?.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 18).isActive = true
            nameLabel?.trailingAnchor.constraint(equalTo: contentBGView.trailingAnchor, constant: 18).isActive = true
        }
        
        if photoCountLabel == nil {
            photoCountLabel = UILabel()
            photoCountLabel.textColor = .systemBlue
   
            contentBGView.addSubview(photoCountLabel)
            photoCountLabel?.translatesAutoresizingMaskIntoConstraints = false
            
            photoCountLabel?.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
            photoCountLabel?.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 0).isActive = true
            photoCountLabel?.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 0).isActive = true
            photoCountLabel?.bottomAnchor.constraint(equalTo: contentBGView.bottomAnchor, constant: -18).isActive = true
        }
    }
}

extension HomeTableViewCell: HomeTableViewCellProtocol {
    func updateNameLabel(text: String) {
        nameLabel.text = text
    }
    
    func updatePhotoCountLabel(text: String) {
        photoCountLabel.text = text
    }
    
    func updateAvatar(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        avatarImageView.kf.setImage(with: url)
    }
}
