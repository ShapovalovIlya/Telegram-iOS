//
//  TimeManager.swift
//  Telegram
//
//  Created by Илья Шаповалов on 15.01.2023.
//

import Foundation
import SwiftSignalKit

public final class TimeManager {
    
    private let baseUrl = "http://worldtimeapi.org/api/timezone/Europe/Moscow"
    
    public enum TimeAPIError: Error {
      case invalidURL
    }
    
    public init() { }
    
    public func timeSignal() -> Signal<TimeAPIModel, Error> {
        Signal { [weak self] subscriber in
            self?.getTime { result in
                switch result {
                case .success(let model):
                    subscriber.putNext(model)
                    subscriber.putCompletion()
                case .failure(let error):
                    subscriber.putError(error)
                }
            }
            return ActionDisposable {}
        }
    }
    
    public func getTime(completion: @escaping(Result<TimeAPIModel, Error>) -> Void) {
        guard let url = URL(string: baseUrl) else {
            completion(.failure(TimeAPIError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if error != nil {
                completion(.failure(error!))
            }
            
            if data != nil {
                TimeManager.decodeTime(from: data!, completion: completion)
            }
        }
        
        task.resume()
    }
    
    private static func decodeTime(from data: Data, completion: @escaping(Result<TimeAPIModel, Error>) -> Void) {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let model = try decoder.decode(TimeAPIModel.self, from: data)
            completion(.success(model))
        } catch {
            completion(.failure(error))
        }
    }
    
}
