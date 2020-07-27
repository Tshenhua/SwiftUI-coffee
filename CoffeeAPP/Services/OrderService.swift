//
//  OrderService.swift
//  CoffeeAPP
//
//  Created by Medcon on 2020/7/25.
//

import Foundation

class OrderService {
    
    func createOrder(order: Orders,completion: @escaping (CreateOrderResponse?)->())  {
        guard let url = URL(string: "https://necessary-veiled-fernleaf.glitch.me/orders") else {
            fatalError("链接地址错误")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(order)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else{
                DispatchQueue.main.async {
                    completion(nil)
                }

                return
            }
            let request = try? JSONDecoder().decode(CreateOrderResponse.self, from: data)
            DispatchQueue.main.async {
                completion(request)
            }
        }
        .resume()
    }
    
    func getAllOrders(completion:@escaping ([Orders]?) ->())  {
        
        guard let url = URL(string: "https://necessary-veiled-fernleaf.glitch.me/orders") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else{
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let orders = try? JSONDecoder().decode([Orders].self, from: data)
            
            DispatchQueue.main.async {
                completion(orders)
            }
        }.resume()
        
    }
}
