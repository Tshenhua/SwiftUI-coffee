//
//  AddCoffeeOrderViewModel.swift
//  CoffeeAPP
//
//  Created by Medcon on 2020/7/25.
//

import Foundation

class AddCoffeeOrderViewModel: ObservableObject {
    var name: String = ""
    @Published var coffeeName: String = ""
    @Published var size: String = "小杯"
    
    private var webservice: OrderService
    
    var coffeeList:[CoffeeViewModel] {
        return Coffee.all().map(CoffeeViewModel.init)
    }
    
    init() {
        self.webservice = OrderService()
    }
    
    var total: Double{
        return calculateTotalPrice()
    }
    
    func placeOder() {
        let order = Orders(name: self.name, coffeeName: self.coffeeName, size: self.size, total: self.total)
        self.webservice.createOrder(order: order) { _ in
            
        }
    }
    
    //MARK: -价格
    private func priceForSize() -> Double{
        let price = ["小杯":2.0,"中杯":3.0,"大杯":4.0]
        print(self.size)
        return price[self.size]!
    }
    
    private func calculateTotalPrice() -> Double {
        let coffeevm = coffeeList.first { $0.name == coffeeName}
        if let coffeevm = coffeevm {
            return coffeevm.price * priceForSize()
        } else {
            return 0.0
        }
    }
}
