//
//  NouteViewController.swift
//  HomeWork2Sem
//
//  Created by Артур Миннушин on 27.03.2024.
//

import UIKit

class NouteVC: UIViewController {

    let noutesView = NouteView(frame: .zero)
    override func loadView() {
        view = noutesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
