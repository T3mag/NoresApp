//
//  MainNoutesVCViewController.swift
//  HomeWork2Sem
//
//  Created by Артур Миннушин on 24.03.2024.
//

import UIKit

class MainNoutesVC: UIViewController {

    let noutesView = MainNoutesView(frame: .zero)
    
    override func loadView() {
        view = noutesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noutesView.viewController = self
        setupnavigationBar()
    }
    
    func setupnavigationBar() {
        let rightBarButton = UIBarButtonItem(image: UIImage(systemName: "info.circle"), style: .plain, target: self, action: nil)
        rightBarButton.tintColor = .white
        navigationItem.rightBarButtonItem = rightBarButton
    }
}
