//
//  NouteView.swift
//  HomeWork2Sem
//
//  Created by Артур Миннушин on 27.03.2024.
//

import UIKit

class NouteView: UIView {
    lazy var nouteHeadTextView: UILabel = {
        var label = UILabel()
        label.text = "Загаловок"
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var nouteTextView: UILabel = {
        var textView = UILabel()
        textView.text = "Текстозоцзщуоазцщоуазщцоащзцоа"
        textView.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        textView.textColor = .white
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    lazy var noutedataLabel: UILabel = {
        var label = UILabel()
        label.text = "дата"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupLayout() {
        addSubview(nouteHeadTextView)
        addSubview(nouteTextView)
        addSubview(noutedataLabel)
        NSLayoutConstraint.activate([
            nouteHeadTextView.topAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            nouteHeadTextView.leadingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            noutedataLabel.topAnchor.constraint(
                equalTo: nouteHeadTextView.bottomAnchor, constant: 10),
            noutedataLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            nouteTextView.topAnchor.constraint(
                equalTo: noutedataLabel.bottomAnchor, constant: 10),
            nouteTextView.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            nouteTextView.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            nouteTextView.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
}
