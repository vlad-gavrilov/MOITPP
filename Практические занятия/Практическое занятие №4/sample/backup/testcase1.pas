unit TestCase1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, Calcs;

type
  TTestCase1= class(TTestCase)
  private
    FCalc: TCalc;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure Clear;
    procedure Add;
    procedure Sub;
  end;

implementation

procedure TTestCase1.SetUp;
begin
  FCalc:= TCalc.Create;
end;

procedure TTestCase1.TearDown;
begin
  FCalc.Free;
end;

procedure TTestCase1.Clear;
begin
  FCalc.Clear;
  AssertEquals(FCalc.Accumulator, 0);
end;

procedure TTestCase1.Add;
begin
  FCalc.Add(42);
  AssertEquals(FCalc.Accumulator, 42);
end;

procedure TTestCase1.Sub;
begin
  FCalc.Sub(42);
  AssertEquals(FCalc.Accumulator, -42);
end;

initialization
  RegisterTest(TTestCase1);
end.
