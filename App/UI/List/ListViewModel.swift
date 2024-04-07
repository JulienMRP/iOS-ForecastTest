//
//  ListViewModel.swift
//  App
//
//

import Global
import GlobalUI
import Combine

class ListViewModel {
    @Inject var service: ForecastService
    private var bag = Set<AnyCancellable>()

    var datas = CurrentValueSubject<[TableViewSection], Never>([])
    
    private(set) var tableViewData = [TableViewData]() {
        didSet {
            self.datas.send([TableViewSection(identifier: "section",
                                              datas: self.tableViewData)])
        }
    }

    var showDetail: ((ForecastItem) -> Void)?

    var title: String {
        let appName = Bundle.main.infoDictionary?[kCFBundleNameKey as String] as! String
        if AppEnvironment.shared.environment == .network {
            return appName
        } else {
            return "\(appName) (mock demo)"
        }
    }
    

    init() {
        setBindings()
    }

    func switchEnvironment() {
        bag.removeAll()
        AppEnvironment.shared.switchEnvironment()
        GlobalContainer.resetNetworkContainer()
        AppModule.shared.registerServices()
        service = GlobalContainer.defaultContainer.resolve(ForecastService.self)!
        setBindings()
    }
    
    private func setBindings() {
        service.items
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.createSection($0) }
            .store(in: &bag)
    }
    
    private func createSection(_ items: ForecastItems) {
        let datas: [TableViewData] = items.map {
            ListCellData(forecast: $0)
                .set(trailingActions: [self.trailingAction(item: $0)])
                .set(separator: .full)
                .set(separatorColor: .lightGray)
                .did { [weak self] data in
                    guard let self = self, let item = data as? ListCellData else { return }
                    self.showDetail?(item.forecast)
                }

        }
        self.tableViewData = datas
    }

    private func trailingAction(item: ForecastItem) -> TableViewContextualAction {
        return TableViewContextualAction(title: "Delete", style: .destructive, backgroundColor: .red) { item in
            item.remove(to: &self.tableViewData)
        }
    }
}
