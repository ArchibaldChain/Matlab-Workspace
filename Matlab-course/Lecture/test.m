y = @(x) x+2
fun(1, @fun22)

function y = fun22(x)
y = x+4
end
function fun(x, fun)
    y = fun(x)
end