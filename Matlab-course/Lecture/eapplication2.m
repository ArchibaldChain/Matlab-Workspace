% Call a function eoption to display the menu and return the user's choice.

choice = eoption;

while choice ~= 4

  switch choice

    case 1
      % Call a function explaine to print an expanation of e.
      explaine;

    case 2
      % Call a function limite that will prompt the user for n and calculate
      limite;

    case 3
      % Call a function expfn that will prompt the user for x and print both
      % the value of built-in exp(x) and an aproximate value for exp(x)
      expfn
  end

  choice = eoption;
  
end

function choice = eoption()

printChoices;

choice = input('Please choose an option: ');

while ~ismember(choice,1:4)

  disp('Error - please choose one of the options.');
  printChoices;
  choose = input('Please choose an option: ');
  
end

  function printChoices
    fprintf('1) Explanation \n');
    fprintf('2) Limit \n');
    fprintf('3) Exponential function \n');
    fprintf('4) Exit program \n');
  end

end

function explaine()

fprintf('The constant e is called the natural exponential base. It is used extensively in mathematics and \n')
fprintf('engineering. The value of the constant e is 2.7183. Raising e to the power of x is so common that this \n')
fprintf('is called the exponential function. An approximation for e is found using a limit. An approximation for \n')
fprintf('the exponential function can be found using a series. \n')

end

function limite()

% prompt the user for an positive n
n = input('Enter a positive number: ');
while n <= 0
  fprintf('You entered a number %.2f \n',n);
  n = input('Enter a positive number: ');
end
  
% calculate and print the approximate value of e using n
fprintf('An approximation of e with n = %.2f is %.2f \n',n,(1+1/n)^n);

end

function expfn()

% prompt the user for x
x = input('input value of x:');

% print the value of built-in exp(x)
fprintf('The exact value exp(x) = %.4f\n', exp(x));

% print the value of approximate exp(x)
fprintf('The approximate value exp(x) = %.4f\n',appExp(x,4));

  function y = appExp(x,n)
    y = sum(x.^(0:(n-1))./factorial(0:(n-1)));
  end

end
