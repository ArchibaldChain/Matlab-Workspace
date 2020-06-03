function out = split_by_zero(line_)

zeros = find(line_ == 0);
if isempty(zeros)
    out{1} = line_;
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