//
//  AlbumDetailView.swift
//  IOS-Example
//
//  Created by Александр Арсенюк on 25.04.2021.
//

import UIKit

class AlbumDetailView: UIView {
    
    // MARK: - Appearance
    
    private struct Appearance: Grid { }
    private let appearance = Appearance()
    
    // MARK: - Internal properties
    
    weak var refreshControlDelegate: RefreshControlDelegate?
    
    // MARK: - UI elements
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.register(
            PostCell.self,
            forCellReuseIdentifier: String(describing: PostCell.self)
        )
        return tableView
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.large
        return activityIndicator
    }()
    
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(
            self,
            action: #selector(refreshData),
            for: .valueChanged
        )
        return refreshControl
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        
    }
    
    private func addSubviews() {
        addSubview(tableView)
        addSubview(activityIndicator)
        tableView.addSubview(refreshControl)
    }
    
    private func makeConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    // MARK: - Action handlers
    
    @objc
    private func refreshData() {
        refreshControlDelegate?.refreshData { [weak self] in
            self?.refreshControl.endRefreshing()
        }
    }
    
}
