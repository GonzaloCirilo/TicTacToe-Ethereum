pragma solidity ^0.4.24;
contract TicTacToe {
    int[] table = new int[](9);
    bool isOver;
    
    function reset() public {
        isOver = false;
        for(uint i = 0; i < 9; i++){
            table[i] = 0;
        }
        isOver = false;
    }
    
    
    constructor() public{
        isOver = false;
        for(uint i = 0; i < 9; i++){
            table[i] = 0;
        }
        isOver = false;
    }
    
    function getTable() public returns (int[]){
        return table;
    }
    
    function posibleCond(uint pos1, uint pos2, uint pos3) private returns (int){
        if(table[pos1]+table[pos2]+table[pos3] == 3 || table[pos1]+table[pos2]+table[pos3] == 6){
            return (table[pos1]+table[pos2]+table[pos3])/3;
        }
        return 0;
    }
    
    function filledCells() private returns (int){
        int cont = 0;
        for(uint i = 0; i < 9; i++){
            if(table[i]!=0){
                cont++;
            }
        }
        if(cont == 9){
            return cont;
        }else{
            return 0;
        }
    }
    
    function move(int token, uint pos) public {
        table[pos] = token;
    }
    
    function checkWinner() public returns (int){//returns 1 for x, 2 for, 9 for draw and 0 for no winner
        return posibleCond(0,1,2) + posibleCond(3,4,5) + posibleCond(6,7,8) + posibleCond(0,3,6) + posibleCond(1,4,7) + posibleCond(2,5,8) + posibleCond(0,4,8) + posibleCond(6,4,2) + filledCells();
    }
}