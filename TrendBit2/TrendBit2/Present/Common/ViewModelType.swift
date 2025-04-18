//
//  ViewModelType.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import Combine
import Foundation

protocol ViewModelType: AnyObject, ObservableObject {
    associatedtype Input
    associatedtype Output

    var cancellables: Set<AnyCancellable> { get set }
    var input: Input { get set }
    var output: Output { get set }

    func transform()
}
