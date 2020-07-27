//
//  AddCoffeeOrderView.swift
//  CoffeeAPP
//
//  Created by Medcon on 2020/7/25.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    @ObservedObject private var addCoffeeOrdervm = AddCoffeeOrderViewModel()
    @Binding var isPresented: Bool
    var body: some View {
        NavigationView{
            
            VStack{
                HStack{ URLImage(url: "https://img.chinaz.com/2020/img/chinaz-logo.png")
                   .aspectRatio(contentMode: .fit)
                }.padding(.all,10)
                .cornerRadius(10)
                .frame(width: 200, height: 100, alignment: .center)
                    
                Form{
                   
                    
                    Section(header: Text("订单信息").font(.body)) {
                        
                        TextField("订单名称", text: self.$addCoffeeOrdervm.name)
                    }
                    
                    Section(header: Text("选择咖啡")) {
                        ForEach(addCoffeeOrdervm.coffeeList,id:\.name){ coffee in
                            CoffeeCellView(coffee: coffee, selection: self.$addCoffeeOrdervm.coffeeName)
                        }
                    }
                    
                    Section(header: Text("选择咖啡"), footer: OrderTotalView(total: self.addCoffeeOrdervm.total)) {
                        Picker(selection: self.$addCoffeeOrdervm.size, label: Text("价格")) {
                            Text("小杯").tag("小杯")
                            Text("中杯").tag("中杯")
                            Text("大杯").tag("大杯")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    

                }
                HStack {
                    Button(action: {
                        self.addCoffeeOrdervm.placeOder()
                        self.isPresented = false
                    }) {
                        Text("确认订单")
                    }
                }
                .padding(EdgeInsets(top: 12, leading: 100, bottom: 12, trailing: 100))
                .foregroundColor(.white)
                .background(Color.green)
                .cornerRadius(5)

            }
            .navigationBarTitle("添加订单")
        }
    }
}

struct AddCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView(isPresented: .constant(false))
            .colorScheme(.light)
    }
}

struct CoffeeCellView: View {
    var coffee: CoffeeViewModel
    @Binding var selection: String
    var body: some View {
        HStack{
            Image(coffee.imageURL)
                .resizable()
                .frame(width:100,height:100)
                .cornerRadius(10)
            Text(coffee.name)
            Spacer()
            Image(systemName: self.selection == coffee.name ? "checkmark" : "")
                .padding()
        }
        .onTapGesture(perform: {
            self.selection = self.coffee.name
            print(self.selection)
        })
    }
}
