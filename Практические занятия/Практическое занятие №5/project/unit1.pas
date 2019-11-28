unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  side1, side2, side3: real;
  answer: string;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  if (Edit1.Text <> '') then
    side1 := strToFloat(Edit1.Text)
  else
    side1 := 1;

  if (Edit2.Text <> '') then
    side2 := strToFloat(Edit2.Text)
  else
    side2 := 1;

  if (Edit3.Text <> '') then
    side3 := strToFloat(Edit3.Text)
  else
    side3 := 1;

  if (side1 = 0) or (side2 = 0) or (side3 = 0) then
    answer := 'Длина не может быть равна 0'
  else
  if (side1 > 0) and (side2 > 0) and (side3 > 0) then
  begin
    if (side1 = side2) and (side2 = side3) then
      answer := 'Равносторонний'
    else
    if (side1 = side2) or (side2 = side3) or (side1 = side3) then
      answer := 'Равнобедренный'
    else
      answer := 'Неравносторонний';
  end
  else
    answer := 'Длина не может быть отрицательной';

  Edit4.Text := answer;
end;

end.

