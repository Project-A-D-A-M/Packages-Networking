//
//  File.swift
//
//
//  Created by Joao Paulo Carneiro on 21/08/24.
//
import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

final class CacheManager {
    
    static let shared: CacheManager = CacheManager()
    
    private var cache = NSCache<NSString, NSObject>()
    
    private init() { }
    
    func setObject(forkey key: URLRequest, object: NSObject) {
        guard let urlString = key.url?.absoluteString as? NSString else {
            print("Error on set object with url: \(key) on \(#file) - \(#function)")
            return
        }
        cache.setObject(object, forKey: urlString)
    }
    
    func getObject<T: NSObject>(forkey key: URLRequest) -> T? {
        guard let urlString = key.url?.absoluteString as? NSString else {
            print("Error on get object with url: \(key) on \(#file) - \(#function)")
            return nil
        }
        
        return cache.object(forKey: urlString) as? T
    }
}
