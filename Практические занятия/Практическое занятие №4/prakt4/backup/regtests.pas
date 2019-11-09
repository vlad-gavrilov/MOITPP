unit RegTests;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, testregistry, testcase1, testcase2;

implementation

initialization
  RegisterTest(TTestCase1);
  //RegisterTest(TTestCase2);
end.
