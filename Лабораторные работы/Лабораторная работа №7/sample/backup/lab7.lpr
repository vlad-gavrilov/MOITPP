program PassStats2;
  {$APPTYPE CONSOLE}
uses
  SysUtils, Stats, TestCases1;
begin
  Stats.CalcStats('marksheet.csv');
  readln;
end.
