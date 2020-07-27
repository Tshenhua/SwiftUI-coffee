//
//  OrderListViewModel.swift
//  CoffeeAPP
//
//  Created by Medcon on 2020/7/25.
//

import Foundation

class OrderListViewModel: ObservableObject {
    
   @Published var order = [OrderViewModel]()
    
    init() {
        self.fetchOrders()
    }
    
    func fetchOrders() {
        OrderService().getAllOrders { order in
            if let order = order {
                print("加载数据;\(order)")
                self.order = order.map(OrderViewModel.init)
            }
        }
    }
}

//MARK: -OrderViewModel
class OrderViewModel {
    
    let id = UUID()
    var order: Orders
    
    init(order: Orders) {
        self.order = order
    }
    
    var name: String {
        return self.order.name
    }
    
    var coffeeName: String {
        return self.order.coffeeName
    }
    
    var size: String {
        return self.order.size
    }
    
    var total: Double {
        return self.order.total
    }
    
    var coffeePic: String{
        switch (self.coffeeName){
        case "浓缩咖啡":
            return "c01"
        case "马琪雅朵":
            return "c02"
        case "美式咖啡":
            return "c03"
        default:
            return "c01"
        }
    }
}
