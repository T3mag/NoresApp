//
//  NoutesViewModel.swift
//  HomeWork2Sem
//
//  Created by Артур Миннушин on 14.05.2024.
//

import Foundation
import Combine

class NoutesViewModel {
    private let dataManager = CoreDataManager.shared
    @Published var noutes: [Note] = []
    init() {
        obtainSaveDataCoreData()
    }
    func obtainSaveDataCoreData() {
        noutes = dataManager.obtainSaveData()
    }
    func getNouteInfo(indexPath: IndexPath) -> Note {
        return noutes[indexPath.row]
    }
    func updateCoreDataInformationById(identifire: Int16, info: [String]) {
        dataManager.updateCoreDataInfo(identifire: identifire, info: info)
    }
    func createCoreDataInformationd(info: [String]) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM YYYY"
        dataManager.addNoutes(name: info[0], date: dateFormatter.date(from: info[2])!, title: info[1])
    }
}
