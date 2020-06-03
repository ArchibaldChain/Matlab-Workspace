classdef gameCrossLine < handle
  
  properties
    
    board
    expectingPlayer
    nextStageList
    previousStage
    winPosOne % 1 = winning strategy 0 = may loss
    winNegOne % 1 = winning strategy 0 = may loss

  end
  
  methods
    
    function obj = gameCrossLine(board,expectingPlayer)
      
      if nargin == 2
        obj.board = board;
        obj.expectingPlayer = expectingPlayer;
      end
      
      if nargin == 0
        obj.board = {[1],[1,1],[1,1,1]};
        obj.expectingPlayer = 1;
      end
      
      if nargin == 1
        obj.board = {[1],[1,1],[1,1,1]};
        obj.expectingPlayer = 1;
      end
      
    end
    
    function generatePossibleNextStepAndCompWinStatus(obj)
        
    end

  end
  
end