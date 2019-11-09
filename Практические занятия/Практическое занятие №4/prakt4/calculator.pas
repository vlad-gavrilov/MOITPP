unit Calculator;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  CalculatorClass = class
  public
    function Addition(arg1, arg2: real) : real;
    function Subtraction(arg1, arg2: real) : real;
    function Multiplication(arg1, arg2: real) : real;
    function Division(arg1, arg2: real) : real;
  end;

implementation

function CalculatorClass.Addition(arg1, arg2: real) : real;
begin
  Addition := arg1 + arg2;
end;

function CalculatorClass.Subtraction(arg1, arg2: real) : real;
begin
  Subtraction := arg1 - arg2;
end;

function CalculatorClass.Multiplication(arg1, arg2: real) : real;
begin
  Multiplication := arg1 * arg2;
end;

function CalculatorClass.Division(arg1, arg2: real) : real;
begin
  if arg2 <> 0 then
  begin
    Division := arg1 / arg2;
  end
  else
  begin
    Division := 999999999;
  end;
end;

end.
