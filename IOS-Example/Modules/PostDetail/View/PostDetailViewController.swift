//
//  PostDetailViewController.swift
//  IOS-Example
//
//  Created by Александр Арсенюк on 25.04.2021.
//

import UIKit

class PostDetailViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let postDetailView = PostDetailView()
    
    // MARK: - Public properties
    
    var presenter: PostDetailViewOutput?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = postDetailView
        configureView()
        setupTargets()
    }
    
    // MARK: - Private methods
    
    private func configureView() {
        let url = URL(string: presenter?.postDetail.url ?? "")
        postDetailView.scrollView.setupImage(with: url)
    }
    
    private func setupTargets() {
        postDetailView.closeButton.addTarget(
            self,
            action: #selector(dismissModule),
            for: .touchUpInside
        )
    }
    
    // MARK: - Action handlers
    
    @objc
    private func dismissModule() {
        dismiss(animated: true, completion: nil)
    }
    
}

extension PostDetailViewController: PostDetailViewInput { }
