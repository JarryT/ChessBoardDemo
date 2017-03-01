//
//  ChessPieces.swift
//  ChessBoard
//
//  Created by 汤军 on 17/2/28.
//  Copyright © 2017年 TJarry. All rights reserved.
//

import UIKit

class Knight: UIButton{
    
    var locate: Locate?
    
    private func rankForwardSteps(rank: Int, inColumn column: Int) -> Locate?{
        
        if rank >= Locate.ranks.count || rank < 0{
            return nil
        }else{
            return Locate.locate(columnIndex: column, rankIndex: rank)
        }
    }
    
    private func columnForwardSteps(column: Int,inRank rank: Int) -> Locate?{
        if column >= Locate.columns.count || column < 0 {
            return nil
        }else{
            return Locate.locate(columnIndex: column, rankIndex: rank)
        }
    }
    
    func isForwardStepsContainsStep(step: String) -> Bool{
        
        // forwardSteps is limited by Locate , Brain and the current locate
        var forwardSteps = [Locate]()
        
        if let locate = locate {
            
            //up
            if let rank = locate.rankIndex ,let column = locate.columnIndex, let locate = rankForwardSteps(rank: rank + 2, inColumn: column){
                
                if let rank = locate.rankIndex ,let column = locate.columnIndex,let locate = columnForwardSteps(column: column + 1, inRank: rank){
                    forwardSteps.append(locate)
                }
                if let rank = locate.rankIndex ,let column = locate.columnIndex,let locate = columnForwardSteps(column: column - 1, inRank: rank){
                    forwardSteps.append(locate)
                }
            }
            //bottom
            if let rank = locate.rankIndex ,let column = locate.columnIndex,let locate = rankForwardSteps(rank: rank - 2, inColumn: column){
                
                if let rank = locate.rankIndex ,let column = locate.columnIndex,let locate = columnForwardSteps(column: column + 1, inRank: rank){
                    forwardSteps.append(locate)
                }
                if let rank = locate.rankIndex ,let column = locate.columnIndex,let locate = columnForwardSteps(column: column - 1, inRank: rank){
                    forwardSteps.append(locate)
                }
            }
            //left
            if let rank = locate.rankIndex ,let column = locate.columnIndex,let locate = rankForwardSteps(rank: rank, inColumn: column - 2){
                
                if let rank = locate.rankIndex ,let column = locate.columnIndex,let locate = columnForwardSteps(column: column , inRank: rank + 1){
                    forwardSteps.append(locate)
                }
                if let rank = locate.rankIndex ,let column = locate.columnIndex,let locate = columnForwardSteps(column: column , inRank: rank - 1){
                    forwardSteps.append(locate)
                }
            }
            //right
            if let rank = locate.rankIndex ,let column = locate.columnIndex,let locate = rankForwardSteps(rank: rank, inColumn: column + 2){
                
                if let rank = locate.rankIndex ,let column = locate.columnIndex,let locate = columnForwardSteps(column: column , inRank: rank + 1){
                    forwardSteps.append(locate)
                }
                if let rank = locate.rankIndex ,let column = locate.columnIndex,let locate = columnForwardSteps(column: column , inRank: rank - 1){
                    forwardSteps.append(locate)
                }
            }
            
            //check
            for locate in forwardSteps {
                let str = "\(locate.column)\(locate.rank)"
                if step == str {
                    return true
                }
            }
            return false
        }else{
            return false
        }
    }
}
