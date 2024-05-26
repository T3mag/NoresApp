import Foundation
import CoreData

class MainNoutesViewModel {
    private let coreDataManager = CoreDataManager.shared
    @Published var noutes: [Note] = []
    init() {
        obtainSaveDataCoreData()
    }
    func obtainSaveDataCoreData() {
        noutes = coreDataManager.obtainSaveData()
    }
    func deleteNouteByIndexPath(indexPath: IndexPath) {
        coreDataManager.deleteNoutes(id: noutes[indexPath.row].id)
        obtainSaveDataCoreData()
    }
}

extension MainNoutesViewModel {
    func addDefaultDataInCoreData() {
        coreDataManager.obtainDefaultData()
    }
}
