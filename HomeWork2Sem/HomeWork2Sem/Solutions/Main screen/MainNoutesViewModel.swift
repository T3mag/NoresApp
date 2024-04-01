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
}

extension MainNoutesViewModel {
    func addDefaultDataInCoreData() {
        coreDataManager.obtainDefaultData()
    }
}
