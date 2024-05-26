//
//  HomeWork2SemTests.swift
//  HomeWork2SemTests
//
//  Created by Артур Миннушин on 23.03.2024.
//

import XCTest
@testable import HomeWork2Sem

final class HomeWork2SemTests: XCTestCase {
    lazy var coreDataManager = CoreDataManager()
    func test_add_Noute() {
        //GIVEN
        let name = "Test Name"
        let text = "Test text"
        let date = "16 May 2024"
        let startCountNoute = coreDataManager.obtainSaveData().count
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM YYYY"
        //WHEN
        coreDataManager.addNoutes(name: name, date: dateFormatter.date(from: date)!, title: text)
        //THEN
        if coreDataManager.obtainSaveData().count - startCountNoute == 1 {
            XCTAssertTrue(true, "Все гуд")
        } else {
            XCTAssertTrue(false, "Не добавилось")
        }
    }
    func test_delete_Noute() {
        //GIVEN
        let id = 1
        let startCountNoute = coreDataManager.obtainSaveData().count
        //WHEN
        coreDataManager.deleteNoutes(id: 1)
        //THEN
        if coreDataManager.obtainSaveData().count - startCountNoute == -1 {
            XCTAssertTrue(true, "Все гуд")
        } else {
            XCTAssertTrue(false, "Не удалилось")
        }
    }
    func test_update_Noute() {
        //GIVEN
        let id: Int16 = 3
        let info: [String] = ["Test Name", "Test text", "16 May 2024"]
        let dateFormatter = DateFormatter()
        let noutes = coreDataManager.obtainSaveData()
        dateFormatter.dateFormat = "dd MMMM YYYY"
        //WHEN
        coreDataManager.updateCoreDataInfo(identifire: id, info: info)
        //THEN
        let noute = noutes.first(where: {$0.id == id})
        if noute != nil {
            if noute?.name == info[0] && noute?.date == dateFormatter.date(from: info[2]) && noute?.note == info[1] {
                XCTAssertTrue(true, "Все гуд")
            } else {
                XCTAssertTrue(false, "Не изменилось")
            }
        } else {
            XCTAssertTrue(false, "Не найденв ячейка")
        }
    }
}
