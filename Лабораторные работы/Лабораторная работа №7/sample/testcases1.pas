unit TestCases1;

interface

uses
  fpcunit, testregistry, Stats;
type
  TTestCases1 = Class(TTestCase)
  published
    procedure Test1;
    procedure Test2;
    procedure Test3;
    procedure Test4;
    procedure Test5;
    procedure Test6;
    procedure Test7;
  end;

implementation
uses
  Sysutils, StrUtils;

procedure TTestCases1.Test1;
begin
  Stats.CalcStats('t1.csv');
  AssertEquals('WRONG ERROR MESSAGE - ', 1, intError);
end;

procedure TTestCases1.Test2;
begin
  Stats.CalcStats('t2.csv');
  AssertEquals('WRONG ERROR MESSAGE - ', 2, intError);
end;

procedure TTestCases1.Test3;
var
  f : text;
  strLine : string;
begin
  Stats.CalcStats('t3.csv');
  assignfile(f, 'results.csv');
  reset(f);
  readln(f, strLine);
  strLine := RightStr(strLine, 1);
  AssertEquals('WRONG ERROR MESSAGE 1 - ', 5, strToInt(strLine));

  readln(f, strLine);
  strLine := RightStr(strLine, 1);
  AssertEquals('WRONG ERROR MESSAGE 2 - ', 5, strToInt(strLine));

  readln(f, strLine);
  strLine := RightStr(strLine, 1);
  AssertEquals('WRONG ERROR MESSAGE 3 - ', 3, strToInt(strLine));

  readln(f, strLine);
  strLine := RightStr(strLine, 1);
  AssertEquals('WRONG ERROR MESSAGE 4 -3 ', 6, strToInt(strLine));

  readln(f, strLine);
  strLine := RightStr(strLine, 1);
  AssertEquals('WRONG ERROR MESSAGE 5 - ', 6, strToInt(strLine));

  readln(f, strLine);
  strLine := RightStr(strLine, 1);
  AssertEquals('WRONG ERROR MESSAGE 6 - ', 3, strToInt(strLine));

  readln(f, strLine);
  strLine := RightStr(strLine, 1);
  AssertEquals('WRONG ERROR MESSAGE 7 - ', 3, strToInt(strLine));
  closeFile(f);
end;

procedure TTestCases1.Test4;
begin
  Stats.CalcStats('t4.csv');
  AssertEquals('WRONG ERROR MESSAGE - ', 4, intError);
end;

procedure TTestCases1.Test5;
begin
  Stats.CalcStats('t5.csv');
  AssertEquals('WRONG male result - ', 'NoMales', strMalePassRate);
  AssertEquals('WRONG female result - ', '66.67', strFemalePassRate);
end;

procedure TTestCases1.Test6;
begin
  Stats.CalcStats('t6.csv');
  AssertEquals('WRONG male result - ', '66.67', strMalePassRate);
  AssertEquals('WRONG female result - ', 'NoFemales', strFemalePassRate);
end;

procedure TTestCases1.Test7;
begin
  Stats.CalcStats('t7.csv');
  AssertEquals('WRONG male result - ', '75.56', strMalePassRate);
  AssertEquals('WRONG female result - ', '78.18', strFemalePassRate);
end;

initialization
  RegisterTest(TTestCases1);
end.
