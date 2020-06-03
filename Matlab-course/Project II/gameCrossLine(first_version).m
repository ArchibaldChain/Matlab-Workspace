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
            % Ending part
            n = length(obj.board);
            one_count = 0;
            equal_board = {};
         
            for i = 1:n
                one_count = one_count + sum(obj.board{i} == 1);
                
                
                % ----------------------------------------
                line_ = obj.board{i};
                zeros = find(line_ == 0);
                if isempty(zeros)
                    out{1} = line_;
                else
                    
                    min_i = min(zeros);
                    max_i = max(zeros);
                    
                    if min_i == 1  && max_i == length(line_)
                        out = {};
                    elseif min_i >1 && max_i == length(line_)
                        out{1} = line_(1:min_i-1);
                    elseif  min_i == 1 && max_i < length(line_)
                        out{1} = line_(max_i+1:end);
                    else
                        out{1} = line_(1:min_i-1);
                        out{2} = line_(max_i+1:end);
                    end
                end
                % ----------------------------------------
                
                equal_board = [equal_board(:)', out(:)'];
            end
            if one_count == 1
                if obj.expectingPlayer == 1
                    obj.winPosOne = 0;
                    obj.winNegOne = 1;
                elseif obj.expectingPlayer == -1
                    obj.winPosOne = 1;
                    obj.winNegOne = 0;
                end
                return
            end
            
            % Middle part
            obj.nextStageList = gameCrossLine;
            num = 1;
            for i = 1:length(equal_board)
                len = length(equal_board{i});
                copy_board = equal_board;
                for k = 1:len
                    
                    temp = equal_board{i};
                    for j = k:len
                        temp(j) = 0;
                        copy_board{i} = temp;

                        nextStage = gameCrossLine(copy_board, -obj.expectingPlayer);
                        nextStage.generatePossibleNextStepAndCompWinStatus;
                        nextStage.previousStage = obj;
                        
                        obj.nextStageList(num) = nextStage;
                        num = num+1;
                    end
                    
                end
            end
            
            
            % Judge win or lose
            if obj.expectingPlayer == 1
                obj.winPosOne = max([obj.nextStageList.winPosOne]);
                obj.winNegOne = min([obj.nextStageList.winNegOne]);
            elseif obj.expectingPlayer == -1
                obj.winPosOne = min([obj.nextStageList.winPosOne]);
                obj.winNegOne = max([obj.nextStageList.winNegOne]);
            end
            
        end
            function out = split_by_zero(line_)
        
                    zeros = find(line_ == 0);
                    if isempty(zeros)
                        out{1} = line_;
                        return
                    end
                    if length(line_) == 1
                        out{1} = {};
                        return
                    end
                    min_i = min(zeros);
                    max_i = max(zeros);
        
                    if min_i == 1  && max_i == length(line_)
                        out = {};
                    elseif min_i >1 && max_i == length(line_)
                        out{1} = line_(1:min_i-1);
                    elseif  min_i == 1 && max_i < length(line_)
                        out{1} = line_(max_i+1:end);
                    else
                        out{1} = line_(1:min_i-1);
                        out{2} = line_(max_i+1:end);
                    end
                end
        
    end
end