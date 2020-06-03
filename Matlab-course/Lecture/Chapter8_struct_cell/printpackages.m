function printpackages(packages)
fprintf("Item # cost price code\n\n");
for i = 1:numel(packages)
fprintf("%d %f %f %c\n", packages(i).item_no,...
    packages(i).cost,...
    packages(i).price,...
    packages(i).code);
end
end

