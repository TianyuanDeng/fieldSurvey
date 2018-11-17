//
//  ClassificaitonEventLoader.swift
//  Field Survey
//
//  Created by Deng tianyuan on 11/16/18.
//  Copyright © 2018 Deng tianyuan. All rights reserved.
//

import Foundation

class ClassificaitonEventLoader {
    
    class func load(jsonFileName: String) -> ClassificationEvents? {
        var classifciationEvents: ClassificationEvents?
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        if let jsonFileUrl = Bundle.main.url(forResource: jsonFileName, withExtension: ".json"),
            let jsonData = try? Data(contentsOf: jsonFileUrl) {
            classifciationEvents = try? jsonDecoder.decode(ClassificationEvents.self, from: jsonData)
        }
        
        return classifciationEvents
    }
}
