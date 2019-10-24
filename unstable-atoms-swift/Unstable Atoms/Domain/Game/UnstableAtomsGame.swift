//
// Created by Samuel Kodytek on 29/09/2019.
// Copyright (c) 2019 Educanet. All rights reserved.
//

import Foundation

class UnstableAtomsGame: UnstableAtoms {

    // TODO: Implement
    private(set) var winner: Player = .none
    
    func whoIsWinner() {
        for column in fields {
            for field in column {
                if(field.owner == .red){
                    return winner = .red
                } else {
                    return winner = .blue
                }
            }
        }
    }

    // TODO: Implement
    private(set) var playerOnMove: Player = .red
        
    func wichPlayer() {
        if(playerOnMove == .red) {
            self.playerOnMove = .blue;
        } else {
            self.playerOnMove = .red;
        }
    }

    // TODO: Implement
    private(set) var fields: [[Field]] = []
        
    
    private (set) var rows: Int
    
    private (set) var columns: Int
    
    init(rows: Int, columns: Int) {
        fields = Array(repeating: Array(repeating: Field(owner: .none, amountOfAtoms: 0), count: rows), count: columns)
        self.rows = rows
        self.columns = columns
    }
    
    // TODO: Implement
    func makeMove(coordinate: Coordinate) {
        
        addAtom(coordinate: coordinate)
        
        wichPlayer()
        
    }
    
    private func addAtom(coordinate: Coordinate) {
        
        if(isIn(coordinate: coordinate) == true) {
            
            if(isOwner(coordinate: coordinate) == true) {
            
                let x = fields[coordinate.x][coordinate.y].amountOfAtoms
        
                print("\(coordinate.x) - \(coordinate.y)")
        
                if(x == 0) {
                    fields[coordinate.x][coordinate.y] = Field(owner: playerOnMove, amountOfAtoms: 1)
                }
                if(x == 1) {
                    fields[coordinate.x][coordinate.y] = Field(owner: playerOnMove, amountOfAtoms: 2)
                }
                if(x == 2) {
                    fields[coordinate.x][coordinate.y] = Field(owner: playerOnMove, amountOfAtoms: 3)
                }
                if(x == 3) {
                    fields[coordinate.x][coordinate.y] = Field(owner: playerOnMove, amountOfAtoms: 0)
            
                    addAtom(coordinate: Coordinate(x: coordinate.x - 1, y: coordinate.y ))
                    addAtom(coordinate: Coordinate(x: coordinate.x + 1, y: coordinate.y ))
                    addAtom(coordinate: Coordinate(x: coordinate.x, y: coordinate.y + 1))
                    addAtom(coordinate: Coordinate(x: coordinate.x, y: coordinate.y - 1))
                }
            }
        }
    }
    
    func isIn(coordinate: Coordinate) -> Bool {
                
        if(coordinate.x >= 0 && coordinate.x < columns && coordinate.y >= 0 && coordinate.y < rows) {
            return true;
        } else {
            return false;
        }
    }
    
    func isOwner(coordinate: Coordinate) -> Bool {
        
        if(fields[coordinate.x][coordinate.y].owner == playerOnMove || fields[coordinate.x][coordinate.y].owner == .none ) {
            return true;
        } else {
            return false;
        }
    }
    
    
}

