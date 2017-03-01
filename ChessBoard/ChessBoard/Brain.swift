//
//  Brain.swift
//  ChessBoard
//
//  Created by 汤军 on 17/2/27.
//  Copyright © 2017年 TJarry. All rights reserved.
//

import UIKit

extension Locate{
    var rankIndex: Int?{
        return Locate.ranks.index(of: self.rank)
    }
    var columnIndex: Int?{
        return Locate.columns.index(of: self.column)
    }
}

struct Locate {
    
    static let columns = ["a","b","c","d","e","f","g","h"]
    static let ranks = [1,2,3,4,5,6,7,8]
    
    var active: Bool = false
    var rank: Int = 0
    var column: String = ""
    
    static func locate(columnIndex: Int, rankIndex: Int) -> Locate{
        
        var locate = Locate()
        
        if columnIndex < 0 || rankIndex < 0 || columnIndex >= Locate.columns.count || rankIndex >= Locate.ranks.count {
            locate.active = false
        }else{
            locate.active = true
            locate.column = Locate.columns[columnIndex]
            locate.rank = Locate.ranks[rankIndex]
        }
        return locate
    }
    
    static func locate(column: String, rank: Int) -> Locate?{
        
        var locate = Locate()
        
        if let _ = Locate.columns.index(of: column),let _ = Locate.ranks.index(of: rank) {
            
            locate.column = column
            locate.rank = rank
            return locate
        }else{
            return nil
        }
    }
    
    func isEqualTo(locate: Locate) -> Bool{
        return (self.column == locate.column) && (self.rank == locate.rank)
    }
    
}

