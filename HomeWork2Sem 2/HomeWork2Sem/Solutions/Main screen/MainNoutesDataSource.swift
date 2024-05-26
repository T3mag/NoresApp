import Foundation
import UIKit
import Combine

class MainNoutesDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    private var noutes: [Note] = []
    private var cancelebels: Set<AnyCancellable> = []
    private var viewConroller: MainNoutesVC?
    init(mainNouteViewController: MainNoutesVC) {
        super.init()
        viewConroller = mainNouteViewController
        mainNouteViewController.$noutes
            .sink { [weak self] notes in
                    self?.noutes = notes }
            .store(in: &cancelebels)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noutes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "mainNoutesTableViewCell", for: indexPath) as? MainNoutesCell else { fatalError() }
        let item: Note = noutes[indexPath.row]
        cell.setupDataInCell(name: item.name!,
                             date: item.date!,
                             subTitle: item.note!)
        cell.accessibilityIdentifier = "Ячейка"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewConroller!.openNoutePage(indexPath: indexPath)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            self.viewConroller!.deleteNouteByIndexPath(indexPath: indexPath)
        }
    }
}
