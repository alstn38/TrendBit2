//
//  ToastManager.swift
//  TrendBit2
//
//  Created by 강민수 on 4/19/25.
//

import Combine
import Foundation

final class ToastManager: ObservableObject {
    
    static let shared = ToastManager()
    
    @Published var isPresented = false
    @Published var message = ""
    
    private init() { }

    func show(message: String, duration: Double = 2.0) {
        self.message = message
        self.isPresented = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.isPresented = false
        }
    }
}
