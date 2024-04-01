//
//  MainNoutesVCViewController.swift
//  HomeWork2Sem
//
//  Created by Артур Миннушин on 24.03.2024.
//

import UIKit
import Combine

class MainNoutesVC: UIViewController {

    private let noutesView = MainNoutesView(frame: .zero)
    private var noutesViewModel: MainNoutesViewModel!
    private var noutesTableViewDataSource: MainNoutesDataSource!
    private var cancelebels: Set<AnyCancellable> = []
    @Published var noutes: [Note] = []
    init(noutesViewModel: MainNoutesViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.noutesViewModel = noutesViewModel
        setupBindings()
        noutesTableViewDataSource = MainNoutesDataSource(mainNouteViewController: self)
    }
    override func loadView() {
        view = noutesView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        noutesView.viewController = self
        noutesView.setupDataSource(dataSource: noutesTableViewDataSource)
        setupnavigationBar()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupBindings() {
        noutesViewModel.$noutes
            .sink { [weak self] noutes in
                self?.noutes = noutes
            }
            .store(in: &cancelebels)
    }
}
extension MainNoutesVC {
    func setupnavigationBar() {
        let leftBarButton = UIBarButtonItem(
            image: UIImage(systemName: "info.circle"),
            style: .plain, target: self, action: nil)
        let rightBarButton = UIBarButtonItem(
            image: UIImage(systemName: "square.and.pencil"),
            style: .plain, target: self, action: nil)
        rightBarButton.tintColor = .white
        leftBarButton.tintColor = .white
        navigationItem.leftBarButtonItem = leftBarButton
        navigationItem.rightBarButtonItem = rightBarButton
    }
    func openNoutePage() {
        let noutePageVC = NouteVC()
        navigationController?.pushViewController(noutePageVC, animated: true)
    }
}
