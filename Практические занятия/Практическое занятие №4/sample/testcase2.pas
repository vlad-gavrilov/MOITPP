unit TestCase2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, Calcs;

type
  TTestCase2= class(TTestCase)
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

procedure TTestCase2.SetUp;
begin
  FCalc:= TCalc.Create;
end;

procedure TTestCase2.TearDown;
begin
  FCalc.Free;
end;

procedure TTestCase2.Clear;
begin
  FCalc.Clear;
  AssertEquals(FCalc.Accumulator, 0);
end;

procedure TTestCase2.Add;
begin
  FCalc.Add(42);
  AssertEquals(FCalc.Accumulator, 42);
end;

procedure TTestCase2.Sub;
begin
  FCalc.Sub(42);
  AssertEquals(FCalc.Accumulator, -42);
end;

//initialization
//  RegisterTest(TTestCase2);
end.
