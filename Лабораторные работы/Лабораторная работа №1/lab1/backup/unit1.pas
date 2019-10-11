unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

procedure TForm1.Edit2Change(Sender: TObject);
begin

end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.Label2Click(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  s: string;
  a: real;
  answer: real;
  code: integer;
begin
  s:=Edit1.Text;
  //a:=strToFloat(s);
  val(s, a, code);
  if (code <> 0) then
  begin
    s:='Ошибка ввода!';
  end
  else
  begin
    if (abs(a) > 3) then
    begin
      answer:=3;
    end
    else
    begin
      answer:=3-abs(a);
    end;
    s:=floatToStr(answer);
  end;
  Edit2.Text:=s;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Close;
end;


end.

