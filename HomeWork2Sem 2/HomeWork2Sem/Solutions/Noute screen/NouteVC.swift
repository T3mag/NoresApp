//
//  NouteViewController.swift
//  HomeWork2Sem
//
//  Created by Артур Миннушин on 27.03.2024.
//

import UIKit

class NouteVC: UIViewController {

    var noutesView: NouteView = NouteView(frame: .zero)
    var indexPath: IndexPath?
    var viewModel: NoutesViewModel?
    var identifire: Int16?
    init(indexPath: IndexPath, viewModel: NoutesViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.indexPath = indexPath
        self.viewModel = viewModel
        setupNoteInfo()
    }
    init(viewModel: NoutesViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        noutesView.createNouteInfo()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        view = noutesView
    }
    func setupNoteInfo() {
        let note = viewModel?.getNouteInfo(indexPath: self.indexPath!)
        identifire = note?.id
        noutesView.setupNouteInfo(date: note?.date ?? Date(),
                                  nouteName: note?.name ?? "Ошибка",
                                  noute: note?.note ?? "Ошибка")
    }
    override func viewWillDisappear(_ animated: Bool) {
        let info: [String] = noutesView.getNouteInfo()
        if !noutesView.isNew {
            viewModel?.updateCoreDataInformationById(identifire: identifire!, info: info)
        } else {
            viewModel?.createCoreDataInformationd(info: info)
        }
    }
}
