unit TestCase1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testregistry, Calculator;

type
  TTestCase1= class(TTestCase)
  private
    FCalc: CalculatorClass;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure Addition;
    procedure Subtraction;
    procedure Multiplication;
    procedure Division;
  end;

implementation

procedure TTestCase1.SetUp;
begin
  FCalc := CalculatorClass.Create;
end;

procedure TTestCase1.TearDown;
begin
  FCalc.Free;
end;

procedure TTestCase1.Addition;
begin
  //AssertEquals(FCalc.Addition(34.3, 56.5), 90.8);
  AssertEquals(FCalc.Addition(98, 36.6), 71);
end;

procedure TTestCase1.Subtraction;
begin
  AssertEquals(FCalc.Subtraction(76.1, 25.8), 50.3);
end;

procedure TTestCase1.Multiplication;
begin
  //AssertEquals(FCalc.Multiplication(20, 3.5), 70);
  AssertEquals(FCalc.Multiplication(0, 31.87), 31.87);
end;

procedure TTestCase1.Division;
begin
  AssertEquals(FCalc.Division(99.99999, 3), 33.33333);
end;

end.
