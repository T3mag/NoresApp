//
//  MainViewNoutes.swift
//  HomeWork2Sem
//
//  Created by Артур Миннушин on 24.03.2024.
//

import UIKit

class MainNoutesView: UIView {
    var viewController: MainNoutesVC!
    
    lazy var notesHeadLabel: UILabel = {
        var label = UILabel()
        label.text = "Заметки 2.0"
        label.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textFieldSearchIconView: UIView = {
        let findTextFieldImageView = UIImageView(frame: CGRect(x: 8.0, y: 10.0, width: 20.0, height: 20.0))
        let image = UIImage(systemName: "magnifyingglass")
        findTextFieldImageView.image = image
        findTextFieldImageView.contentMode = .scaleAspectFit
        findTextFieldImageView.tintColor = .gray
        findTextFieldImageView.backgroundColor = .clear
        let findTextFieldView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 40))
        findTextFieldView.addSubview(findTextFieldImageView)
        findTextFieldView.backgroundColor = .clear
        return findTextFieldView
    }()
    
    lazy var notesSeachTextField: UITextField = {
        var textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "Поиск",
            attributes: [NSAttributedString.Key.foregroundColor:
                            UIColor(red: 146/255, green: 146/255, blue: 154/255, alpha: 1)]
        )
        textField.keyboardType = .webSearch
        textField.textColor = UIColor(red: 146/255, green: 146/255, blue: 154/255, alpha: 1)
        textField.backgroundColor = UIColor(red: 28/255, green: 27/255, blue: 29/255, alpha: 1)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 10
        textField.leftViewMode = UITextField.ViewMode.always
        textField.leftView = textFieldSearchIconView
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        addSubviews()
    }
    
    func addSubviews() {
        addSubview(notesHeadLabel)
        addSubview(notesSeachTextField)
        NSLayoutConstraint.activate([
            notesHeadLabel.topAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            notesHeadLabel.leadingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            notesSeachTextField.topAnchor.constraint(
                equalTo: notesHeadLabel.bottomAnchor, constant: 15),
            notesSeachTextField.leadingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            notesSeachTextField.trailingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            notesSeachTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
