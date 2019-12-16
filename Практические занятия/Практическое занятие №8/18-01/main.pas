unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus, MyCript;

type

  { TfMain }

  TfMain = class(TForm)
    CD: TColorDialog;
    FD: TFontDialog;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    FileSaveAs: TMenuItem;
    N1: TMenuItem;
    FileExit: TMenuItem;
    EditMenu: TMenuItem;
    EditCancel: TMenuItem;
    N2: TMenuItem;
    EditCut: TMenuItem;
    N3: TMenuItem;
    EditSelectAll: TMenuItem;
    EditCopy: TMenuItem;
    MenuItem2: TMenuItem;
    EditPaste: TMenuItem;
    EditDelete: TMenuItem;
    MenuItem22: TMenuItem;
    FormatFont: TMenuItem;
    FormatMenu: TMenuItem;
    FormatColor: TMenuItem;
    N4: TMenuItem;
    FormatWordWrap: TMenuItem;
    CoderMenu: TMenuItem;
    CoderCode: TMenuItem;
    MenuItem3: TMenuItem;
    CoderDecode: TMenuItem;
    HelpMenu: TMenuItem;
    HelpAbout: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    FileMenu: TMenuItem;
    FileCreate: TMenuItem;
    FileOpen: TMenuItem;
    FileSave: TMenuItem;
    OD: TOpenDialog;
    SD: TSaveDialog;
    procedure CoderCodeClick(Sender: TObject);
    procedure CoderDecodeClick(Sender: TObject);
    procedure CoderMenuClick(Sender: TObject);
    procedure EditCancelClick(Sender: TObject);
    procedure EditCopyClick(Sender: TObject);
    procedure EditCutClick(Sender: TObject);
    procedure EditDeleteClick(Sender: TObject);
    procedure EditPasteClick(Sender: TObject);
    procedure FileCreateClick(Sender: TObject);
    procedure FileExitClick(Sender: TObject);
    procedure FileOpenClick(Sender: TObject);
    procedure FileSaveAsClick(Sender: TObject);
    procedure FileSaveClick(Sender: TObject);
    procedure FormatColorClick(Sender: TObject);
    procedure FormatFontClick(Sender: TObject);
    procedure FormatWordWrapClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.lfm}

{ TfMain }

procedure TfMain.FormCreate(Sender: TObject);
begin

end;

procedure TfMain.FileOpenClick(Sender: TObject);
begin
//проверка необходимости сохранения файла, как в Файл->Создать:
if Memo1.Modified then begin //изменения есть
//если пользователь согласен сохранить изменения:
if MessageDlg('Сохранение файла',
'Текущий файл был изменен. Сохранить изменения?',
mtConfirmation, [mbYes, mbNo, mbIgnore], 0) = mrYes then
FileSaveClick(Sender);
end; //if
//очищаем имя файла у диалога OpenDialog, изменяем заголовок, и
//вызываем метод LoadFromFile, если диалог состоялся
OD.FileName:= '';
OD.Title:= 'Открыть существующий файл';
if OD.Execute then begin
//очищаем Мемо, если есть текст:
if Memo1.Text <> '' then Memo1.Clear;
//читаем из файла
Memo1.Lines.LoadFromFile(Utf8ToSys(OD.FileName));
//копируем имя файла в диалог SaveDialog, чтобы потом знать,
//куда сохранять:
SD.FileName:= OD.FileName;
end; //if
end;

procedure TfMain.FileSaveAsClick(Sender: TObject);
begin
{Переписываем заголовок окна диалога, иначе он выйдет на английском.
Если сохранение произошло, то свойство Modified у Memo переводим в false,
так как все изменения уже сохранены}
SD.Title:= 'Сохранить как';
if SD.Execute then begin
Memo1.Lines.SaveToFile(Utf8ToSys(SD.FileName));
Memo1.Modified:= false;
end; //if
end;

procedure TfMain.FileSaveClick(Sender: TObject);
begin
{если имя файла известно, то не нужно вызывать диалог SaveDialog,
просто вызываем метод SaveToFile. }
if SD.FileName <> '' then begin
Memo1.Lines.SaveToFile(Utf8ToSys(SD.FileName));
//устанавливаем Modified в false, так как изменения уже сохранили:
Memo1.Modified:= false;
end //if
//иначе имя файла не известно, вызываем Сохранить как...:
else FileSaveAsClick(Sender);
end;

procedure TfMain.FormatColorClick(Sender: TObject);
begin
  CD.Color:= Memo1.Color;

if CD.Execute then Memo1.Color:= CD.Color;
end;

procedure TfMain.FormatFontClick(Sender: TObject);
begin


FD.Font:= Memo1.Font;

if FD.Execute then Memo1.Font:= FD.Font;

end;

procedure TfMain.FormatWordWrapClick(Sender: TObject);
begin

//изменяем меню:
FormatWordWrap.Checked:= not FormatWordWrap.Checked;
//присваиваем настройку Memo1:
Memo1.WordWrap:= FormatWordWrap.Checked;
//если перенос по словам включен, нужна только вертикальная
//линейка прокрутки, иначе нужны обе линейки:
if Memo1.WordWrap then Memo1.ScrollBars:= ssVertical
else Memo1.ScrollBars:= ssBoth;

end;

procedure TfMain.CoderCodeClick(Sender: TObject);
begin
//сначала очистим ключ:
MyCript.MyPassword:= '';
if InputQuery('Ввод ключа', 'Введите ключевое слово (фразу):',
MyCript.MyPassword) then
Memo1.Text:= MyCript.Write(MyCript.Encrypt(Memo1.Text));
end;

procedure TfMain.CoderDecodeClick(Sender: TObject);
begin
//сначала очистим ключ:
MyCript.MyPassword:= '';
if InputQuery('Ввод ключа', 'Введите ключевое слово (фразу):',
MyCript.MyPassword) then
Memo1.Text:= MyCript.Decrypt(MyCript.Read(Memo1.Text));
end;

procedure TfMain.CoderMenuClick(Sender: TObject);
begin

end;

procedure TfMain.EditCancelClick(Sender: TObject);
begin

Memo1.Undo;

end;

procedure TfMain.EditCopyClick(Sender: TObject);
begin
  Memo1.CopyToClipboard;
end;

procedure TfMain.EditCutClick(Sender: TObject);
begin
  Memo1.CutToClipboard;
end;

procedure TfMain.EditDeleteClick(Sender: TObject);
begin
  Memo1.ClearSelection;
end;

procedure TfMain.EditPasteClick(Sender: TObject);
begin
  Memo1.PasteFromClipboard;
end;

procedure TfMain.FileCreateClick(Sender: TObject);
begin
{Если есть изменения текста, спросим пользователя, не хочет ли он сохранить
их перед созданием нового текста}
if Memo1.Modified then begin
//если пользователь согласен сохранить изменения:
if MessageDlg('Сохранение файла',
'Текущий файл был изменен. Сохранить изменения?',
mtConfirmation, [mbYes, mbNo, mbIgnore], 0) = mrYes then
FileSaveClick(Sender);
end; //if
//теперь очищаем Мемо, если есть текст:
if Memo1.Text <> '' then Memo1.Clear;
//в SaveDialog убираем имя файла. это будет означать, что файл не сохранен:
SD.FileName:= '';
end;

procedure TfMain.FileExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfMain.Memo1Change(Sender: TObject);
begin

end;

procedure TfMain.MenuItem3Click(Sender: TObject);
begin

end;

procedure TfMain.MenuItem4Click(Sender: TObject);
begin

end;

end.

