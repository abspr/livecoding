//
//  Environment.swift
//  quandoo
//
//  Created by Hosein Abbaspour on 3/9/24.
//

import Foundation

enum Environment: String {
    case debug, release
    
    // MARK: - Types
    struct Variable: RawRepresentable {
        let rawValue: String
        
        init(rawValue: String) {
            self.rawValue = rawValue
        }
        
        public static let env = Variable(rawValue: "ENV")
        public static let apiURL = Variable(rawValue: "API_URL")
    }
    
    // MARK: - Properties
    static let env: Environment = {
        Environment[Variable.env]
    }()
    
    // MARK: - Methods
    static subscript<T>(variable: Variable) -> T {
        guard let value = Environment.infoDictionary[variable.rawValue] as? T else {
            fatalError("\(variable) is not defined in Config.plist or can not be casted to \(String(describing: T.self))")
        }
        return value
    }
    
    static subscript<T: RawRepresentable>(variable: Variable) -> T where T.RawValue == String {
        guard let rawValue = Environment.infoDictionary[variable.rawValue] as? String else {
            fatalError("\(variable) is not defined in Config.plist or can not be casted to \(String(describing: T.self))")
        }
        guard let value = T.init(rawValue: rawValue) else {
            fatalError("Can't cast \(rawValue) to \(String(describing: T.self))")
        }
        return value
    }
    
    // MARK: - Internal helpers
    private static let infoDictionary: [String: Any] = {
        guard let dictUrl = Bundle.main.url(forResource: "Config", withExtension: "plist"),
              let dictData = try? Data(contentsOf: dictUrl),
              let dict = try? PropertyListSerialization.propertyList(from: dictData, format: nil) as? [String: Any] else {
            
            fatalError("Config.plist not found or contents are not dictionary")
        }
        return dict
    }()
}
