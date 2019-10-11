unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
i: Integer;
st: TStringList;
begin
  //создаем список строк:
  st:= TStringList.Create;
  try
  //генерируем список:
  for i:= -3 to 3 do begin
  st.Append('10/'+IntToStr(i)+'='+FloatToStr(10/i));
  end;
  //выводим список на экран:
  ShowMessage(st.Text);
  finally
  //st будет освобождена даже в случае run-time ошибки:
  st.Free;
  end;
end;

end.

