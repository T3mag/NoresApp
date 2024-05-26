//
//  NouteView.swift
//  HomeWork2Sem
//
//  Created by Артур Миннушин on 27.03.2024.
//

import UIKit

class NouteView: UIView {
    var isNew: Bool = true
    lazy var nouteHeadTextView: UITextField = {
        var textView = UITextField()
        textView.font = UIFont.systemFont(ofSize: 23, weight: .heavy)
        textView.textColor = .white
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Заголовок"
        textView.backgroundColor = .clear
        return textView
    }()
    lazy var nouteTextView: UITextView = {
        var textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.textColor = .white
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = true
        textView.backgroundColor = .clear
        return textView
    }()
    lazy var nouteDataLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func createNouteInfo() {
        isNew = true
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM YYYY"
        nouteHeadTextView.text = "Заголовок"
        nouteDataLabel.text = dateFormatter.string(from: date)
    }
    func setupNouteInfo(date: Date, nouteName: String, noute: String) {
        isNew = false
        nouteHeadTextView.text = nouteName
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM YYYY"
        nouteDataLabel.text = dateFormatter.string(from: date)
        nouteTextView.text = noute
        self.setNeedsLayout()
    }
    func setupUI() {
        addSubview(nouteHeadTextView)
        addSubview(nouteDataLabel)
        addSubview(nouteTextView)
        NSLayoutConstraint.activate([
            nouteDataLabel.topAnchor.constraint(
                equalTo: topAnchor, constant: 75),
            nouteDataLabel.centerXAnchor.constraint(
                equalTo: safeAreaLayoutGuide.centerXAnchor),
            nouteHeadTextView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            nouteHeadTextView.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            nouteHeadTextView.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            nouteTextView.topAnchor.constraint(
                equalTo: nouteHeadTextView.bottomAnchor, constant: 10),
            nouteTextView.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            nouteTextView.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            nouteTextView.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    func getNouteInfo() -> [String] {
        var info: [String] = []
        info.append(nouteHeadTextView.text!)
        info.append(nouteTextView.text!)
        info.append(nouteDataLabel.text!)
        return info
    }
}
