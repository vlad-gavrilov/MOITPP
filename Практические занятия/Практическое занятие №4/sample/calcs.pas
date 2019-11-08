unit Calcs;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TCalc = class
  private
    FAccumulator: Integer;
  public
    procedure Clear;
    procedure Add(Value: Integer);
    procedure Sub(Value: Integer);
    property Accumulator: Integer read FAccumulator;
  end;

implementation

{ TCalc }

procedure TCalc.Clear;
begin
  FAccumulator:= 0;
end;

procedure TCalc.Add(Value: Integer);
begin
  FAccumulator:= FAccumulator + Value;
end;

procedure TCalc.Sub(Value: Integer);
begin
  FAccumulator:= FAccumulator - Value;
end;

end.
