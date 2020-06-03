classdef gameCrossLine < handle
    
    properties
        
        board
        expectingPlayer
        nextStageList
        previousStage
        winPosOne % 1 = winning strategy 0 = may loss
        winNegOne % 1 = winning strategy 0 = may loss
        
    end
    
    methods(Static)
        function  out = pushState(obj)
            % return 1 if it exits already
            % return 0 if not
            persistent state_content
            persistent count
            if isempty(count)||isempty(state_content)
                count = 1;
                state_content = obj;
                out = 0;
                return
            end
            for o = state_content
                if o == obj
                    out = 1;
                    return
                end
            end
            count = count+1;
            state_content(count) = obj;
            out = 0;
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
        
        function out = encode_board(board)
            out = zeros(1, 1);
            len = length(board);
            for i = 1:len
                row = board{i};
                index = sum(row);
                if length(out) < index
                    out(index) = 1;
                else
                    out(index) = out(index)+1;
                end
            end
        end
    end
    
    methods
        function obj = gameCrossLine(board,expectingPlayer)
            
            if nargin == 2
                if isequal(class(board), 'cell')
                    obj.board = gameCrossLine.encode_board(board);
                else
                    obj.board = board;
                end
                obj.expectingPlayer = expectingPlayer;
            end
            
            if nargin == 0
                obj.board = [1 1 1];
                obj.expectingPlayer = 1;
            end
            
            if nargin == 1
                if isequal(class(board), 'cell')
                    obj.board = gameCrossLine.encode_board(board);
                else
                    obj.board = board;
                end
                obj.expectingPlayer = 1;
            end
        end
        
        function out = eq(obj1, obj2)
            if obj1.expectingPlayer ~= obj2.expectingPlayer
                out = 0;
                return
            end
            n1 = find(obj1.board ~= 0,1,'last');
            n2 = find(obj2.board ~= 0,1,'last');
                
            if isempty(n1) && isempty(n2)
                out = 1;
            elseif isempty(n1) || isempty(n2)
                out = 0;
                return
            elseif n1 ~= n2
                out = 0;
            else  
            out = isequal(obj1.board(1:n1),obj2.board(1:n2));
            end
        end

        function generatePossibleNextStepAndCompWinStatus(obj)
            % Ending part
            n = length(obj.board);
            
            
            if sum(obj.board) == 0
                if obj.expectingPlayer == 1
                    obj.winPosOne = 1;
                    obj.winNegOne = 0;
                elseif obj.expectingPlayer == -1
                    obj.winPosOne = 0;
                    obj.winNegOne = 1;
                end
                return
            end
            
            % Middle part
            obj.nextStageList = gameCrossLine;
            num = 1;
            for i = 1:n
                if obj.board(i) == 0
                    continue
                end
                
                for j = 1:ceil(i/2.0)
                    %when j is larger than i/2
                    if i>1 && j > i/2
                        nextboard = obj.board;
                        nextboard(i) = nextboard(i) - 1;
                        nextboard(floor(j-1)) = nextboard(floor(j-1))+2;
                        nextStage = gameCrossLine(nextboard, -obj.expectingPlayer);
                        nextStage.previousStage = obj;
                        if gameCrossLine.pushState(nextStage)
%                             disp('+')
                            continue
                        end
%                         disp('*')
                        nextStage.generatePossibleNextStepAndCompWinStatus;
                        
                        obj.nextStageList(num) = nextStage;
                        num = num+1;
                        continue
                    end
                    % wehn j <= i/2
                    for k = j:i
                        nextboard = obj.board;
                        nextboard(i) = nextboard(i) - 1;
                        if j > 1
                            nextboard(j-1) = nextboard(j-1) + 1;
                        end
                        if k < i
                            nextboard(i-k) = nextboard(i-k) + 1;
                        end
                        nextStage = gameCrossLine(nextboard, -obj.expectingPlayer);
                        if gameCrossLine.pushState(nextStage)
%                             disp('+')
                            continue
                        end
%                         disp('*')
                        nextStage.previousStage = obj;
                        nextStage.generatePossibleNextStepAndCompWinStatus;
                        
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
    end
end

