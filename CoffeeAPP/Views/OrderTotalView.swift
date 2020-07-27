//
//  OrderTotalView.swift
//  CoffeeAPP
//
//  Created by Medcon on 2020/7/26.
//

import SwiftUI

struct OrderTotalView: View {
    let total: Double
    var body: some View {
        HStack(alignment:.center){
            Spacer()
            Text(String(format: "$%.2f", total))
                .font(.largeTitle)
                .foregroundColor(.green)
            Spacer()
        }
    }
}

struct OrderTotalView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTotalView(total: 49.89)
    }
}
