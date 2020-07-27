//
//  OrderListView.swift
//  CoffeeAPP
//
//  Created by Medcon on 2020/7/25.
//

import Foundation

import SwiftUI

struct OrderListView: View {
    
    let orders:[OrderViewModel]
    
   
    init(orders:[OrderViewModel]) {
        self.orders = orders
    }
    
    var body: some View {
        List{
            ForEach(self.orders,id:\.id) {order in
                HStack{
                    Image(order.coffeePic)
                        .resizable()
                        .frame(width:100,height:100)
                        .cornerRadius(5)
                    VStack{
                        Text(order.name)
                            .font(.body)
                            .padding([.bottom,.leading], 10)
                        HStack{
                            Text(order.coffeeName)
                                .font(.caption)
                                .fontWeight(.bold)
                                .padding(.all, 10)
                                .background(Color.orange)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            
                            Text(order.size)
                                .font(.caption)
                                .fontWeight(.bold)
                                .padding(.all, 10)
                                .background(Color.yellow)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                       
                }
            }
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(orders: [OrderViewModel(order: Orders(name: "浓缩咖啡", coffeeName: "浓缩咖啡", size: "大杯", total: 10.00))])
    }
}
