import Foundation
import CoreData
import Combine

class CoreDataManager {
    var data: [Note] = []
    static let shared = CoreDataManager()
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreData")
        container.loadPersistentStores(completionHandler: {( _, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    func updateCoreDataInfo(identifire: Int16, info: [String]) {
        guard let noute = obtainSaveData().first(where: {$0.id == identifire}) else { return }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM YYYY"
        noute.name = info[0]
        noute.note = info[1]
        noute.date = dateFormatter.date(from: info[2])
        if viewContext.hasChanges {
            try? viewContext.save()
        }
    }
    func addNoutes(name: String, date: Date, title: String) {
        let noute = Note(context: viewContext)
        var previousId: Int16 = 0
        noute.name = name
        noute.note = title
        if obtainSaveData().count == 1 {
            noute.id = 1
        } else {
            for savedNoute in obtainSaveData() {
                if savedNoute.id - previousId > 1 {
                    noute.id = savedNoute.id - 1
                    break
                } else {
                    previousId = savedNoute.id
                }
            }
            noute.id = previousId + 1
        }
        noute.date = Date()
        if viewContext.hasChanges {
            try? viewContext.save()
        }
    }
    func deleteNoutes(id: Int16) {
        guard let noute = obtainSaveData().first(where: {$0.id == id}) else { return }
        viewContext.delete(noute)
        if viewContext.hasChanges {
            try? viewContext.save()
        }
    }
    func obtainSaveData() -> [Note] {
        let noutesFetchRequest = Note.fetchRequest()
        let sortDescription = NSSortDescriptor(key: "id", ascending: true)
        noutesFetchRequest.sortDescriptors = [sortDescription]
        let result = try? viewContext.fetch(noutesFetchRequest)
        return result ?? []
    }
    func obtainDefaultData() {
        var dateComponents = DateComponents()
        dateComponents.year = 2024
        dateComponents.month = 10
        dateComponents.day = 10
        addNoutes(name: "Привет, это первый тестовый пост",
                  date: Calendar.current.date(from: dateComponents)!,
                  title: "Хз че тут писать, ведь это тестовый файл для работы")
        dateComponents.year = 2023
        dateComponents.month = 1
        dateComponents.day = 1
        addNoutes(name: "Привет, это второй тестовый пост",
                  date: Calendar.current.date(from: dateComponents)!,
                  title: "Хз че тут писать, ведь это тестовый файл для работы")
        dateComponents.year = 2024
        dateComponents.month = 1
        dateComponents.day = 10
        addNoutes(name: "Привет, это третий тестовый пост",
                  date: Calendar.current.date(from: dateComponents)!,
                  title: "Хз че тут писать, ведь это тестовый файл для работы")
    }
}
