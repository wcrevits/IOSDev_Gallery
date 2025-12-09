//
//  PathStore.swift
//  
//
//  Created by Wout Crevits on 09/12/2025.
//

import Foundation

@Observable
class PathStore{
    var path = [Route]()
    
    func clear(){
        path = []
    }
}

