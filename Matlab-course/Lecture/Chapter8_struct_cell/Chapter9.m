%% Structure

package = struct("sdf",3, "abc", 3,"def",5)

onepart = struct('part_no',123, 'quantity',4,'costper', 33.95)

package.item1 = 123
package.item2 = 222

package = rmfield(package, 'item1')

isfield(package, 'item1')

%% comma-separated list
{2,3,"3",[5,3,3]}

c{1} = 2
c{2} = 'x'
[a,b] = c{:}

a1 = 'a'
a2 = 23

[b1,b2] = deal(a1,a2)

function addressStruct(Struct, field)
    if isfield(Sturct, field)
        fprintf(Struct.(field))
    else
        fprintf('Error')
    end
end