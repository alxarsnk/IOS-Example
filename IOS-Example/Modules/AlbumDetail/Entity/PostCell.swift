//
//  PostCell.swift
//  IOS-Example
//
//  Created by Александр Арсенюк on 25.04.2021.
//

import UIKit
import SDWebImage

class PostCell: UITableViewCell {
    
    // MARK: - Internal properties
    
    private struct Appearance: Grid {
        let alphaComponent06: CGFloat = 0.06
        let opacity1: Float = 1
        let size150: CGFloat = 150
    }
    private let appearance = Appearance()
    
    override var reuseIdentifier: String? {
        return String(describing: self)
    }
    
    // MARK: - UI elements
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = appearance.xxsSpace
        view.layer.shadowRadius = appearance.xxsSpace
        view.layer.shadowColor = UIColor.black.withAlphaComponent(appearance.alphaComponent06).cgColor
        view.layer.shadowOpacity = appearance.opacity1
        view.layer.masksToBounds = false
        return view
    }()
    
    lazy var postImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = appearance.xxsSpace
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.setColor(.black)
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        setupStyle()
        addSubviews()
        makeConstraints()
    }
    
    private func setupStyle() {
        selectionStyle = .none
        backgroundColor = .white
        layer.masksToBounds = false
    }
    
    private func addSubviews() {
        contentView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(postImageView)
    }
    
    private func makeConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
                .inset(appearance.xsSpace)
        }
        
        postImageView.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
                .inset(appearance.xsSpace)
            make.size.equalTo(appearance.size150)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(postImageView.snp.top)
            make.bottom.lessThanOrEqualToSuperview()
                .inset(appearance.xsSpace)
            make.trailing.equalToSuperview()
                .inset(appearance.xsSpace)
            make.leading.equalTo(postImageView.snp.trailing)
                .offset(appearance.xxsSpace)
        }
    }
    
}

extension PostCell {
    
    func configure(with viewModel: Post) {
        let url = URL(string: viewModel.thumbnailUrl)
        postImageView.sd_setImage(with: url, completed: nil)
        titleLabel.text = viewModel.title
    }
    
}
