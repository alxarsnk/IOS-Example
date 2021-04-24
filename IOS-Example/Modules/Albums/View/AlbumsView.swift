//
//  AlbumsView.swift
//  IOS-Example
//
//  Created by Александр Арсенюк on 25.04.2021.
//

import UIKit
import SnapKit

class AlbumsView: UIView {
    
    // MARK: - Internal properties
    
    private struct Appearance: Grid { }
    private let appearance = Appearance()
    
    // MARK: - UI elements
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
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
    }
    
    private func makeConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
