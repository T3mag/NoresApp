import UIKit

class MainNoutesCell: UITableViewCell {
    lazy var nouteNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Error name"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        return label
    }()
    lazy var nouteDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Error date"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 146/255, green: 146/255, blue: 154/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    lazy var nouteSubtitileLabel: UILabel = {
         let label = UILabel()
         label.text = "Error subtitle"
         label.translatesAutoresizingMaskIntoConstraints = false
         label.textColor = UIColor(red: 146/255, green: 146/255, blue: 154/255, alpha: 1)
         label.font = UIFont.systemFont(ofSize: 13)
         return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    func setupLayout() {
        addSubview(nouteNameLabel)
        addSubview(nouteDateLabel)
        addSubview(nouteSubtitileLabel)
        let view = UIView()
        view.backgroundColor = UIColor(red: 44/255, green: 43/255, blue: 45/255, alpha: 1)
        self.selectedBackgroundView = view
        backgroundColor = UIColor(red: 28/255, green: 27/255, blue: 29/255, alpha: 1)
        NSLayoutConstraint.activate([
            nouteNameLabel.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            nouteNameLabel.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            nouteDateLabel.topAnchor.constraint(
                equalTo: nouteNameLabel.bottomAnchor, constant: 10),
            nouteDateLabel.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            nouteDateLabel.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            nouteSubtitileLabel.topAnchor.constraint(
                equalTo: nouteNameLabel.bottomAnchor, constant: 10),
            nouteSubtitileLabel.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 110),
            nouteSubtitileLabel.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            nouteSubtitileLabel.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    func setupDataInCell(name: String, date: Date, subTitle: String) {
        nouteNameLabel.text = name
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        nouteDateLabel.text = dateFormatter.string(from: date)
        nouteSubtitileLabel.text = subTitle
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
