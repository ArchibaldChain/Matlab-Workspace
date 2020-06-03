classdef ticTacToeGeneralized < handle
  
  properties
    
    board
    expectingPlayer
    nextStageList
    previousStage
    winPosOne % 2 = winning strategy, 1 = not-lossing strategy, 0 = may loss
    winNegOne % 2 = winning strategy, 1 = not-lossing strategy, 0 = may loss

  end
  
  methods
    
    function obj = ticTacToeGeneralized(board,expectingPlayer)
      
      if nargin == 0
        obj.board = NaN(3);
        obj.expectingPlayer = 1;
      end
      
      if nargin == 1
        obj.board = board;
        obj.expectingPlayer = 1;
      end
      
      if nargin == 2
        obj.board = board;
        obj.expectingPlayer = expectingPlayer;
      end
      
    end
    
    function generatePossibleNextStepAndCompWinStatus(obj)
      
      iNaN = find(isnan(obj.board(:)));
      nPos = length(iNaN); % Pos = empty position
      
      Pos = obj.board == 1;
      Pos_r = any(all(Pos,1));
      Pos_c = any(all(Pos,2));
      Pos_d1 = all(Pos([1,5,9]));
      Pos_d2 = all(Pos([3,5,7]));
      
      Neg = obj.board == -1;
      Neg_r = any(all(Neg,1));
      Neg_c = any(all(Neg,2));
      Neg_d1 = all(Neg([1,5,9]));
      Neg_d2 = all(Neg([3,5,7]));
      
      if Pos_r || Pos_c || Pos_d1 || Pos_d2
        obj.winPosOne = 2;
        obj.winNegOne = 0;
        obj.nextStageList = [];
        return;
        
      elseif Neg_r || Neg_c || Neg_d1 || Neg_d2
        obj.winPosOne = 0;
        obj.winNegOne = 2;
        obj.nextStageList = [];
        return;
        
      elseif nPos == 0
        obj.winPosOne = 1;
        obj.winNegOne = 1;
        obj.nextStageList = [];
        return;
      end
      

      obj.nextStageList = ticTacToeGeneralized;
      
      for iPos = nPos:-1:1
        
        nextBoard = obj.board;
        nextBoard(iNaN(iPos)) = obj.expectingPlayer;
        nextGame = ticTacToeGeneralized(nextBoard,-obj.expectingPlayer);
        nextGame.previousStage = obj;
        nextGame.generatePossibleNextStepAndCompWinStatus;
        
        obj.nextStageList(iPos) = nextGame;
        
      end
      
      if obj.expectingPlayer == 1
        obj.winPosOne = max([obj.nextStageList.winPosOne]);
        obj.winNegOne = min([obj.nextStageList.winNegOne]);
      elseif obj.expectingPlayer == -1
        obj.winPosOne = min([obj.nextStageList.winPosOne]);
        obj.winNegOne = max([obj.nextStageList.winNegOne]);
      end
        
    end

  end
  
end