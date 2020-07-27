//
//  ContentView.swift
//  CoffeeAPP
//
//  Created by Medcon on 2020/7/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var orderListvm  = OrderListViewModel()
    @State var showAdd = false
    var body: some View {
        NavigationView{
            OrderListView(orders: self.orderListvm.order)
                .navigationBarItems(
                    leading:Button(action: {
                        self.orderListvm.fetchOrders()
                    }) {
                        Image(systemName: "arrow.clockwise")
                    } ,
                    trailing: Button(action: {
                        self.showAdd = true
                    }) {
                        Image(systemName: "plus")
                    }
                )
                .navigationBarTitle("咖啡订单", displayMode: .inline)
                .sheet(isPresented: self.$showAdd, content: {
                    AddCoffeeOrderView(isPresented: self.$showAdd)
                })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
           
    }
}
