unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ExtCtrls, ExtDlgs, ComCtrls;

type

  { TfMain }

  TfMain = class(TForm)
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    FileMenu: TMenuItem;
    Fileopen: TMenuItem;
    FileSaveas: TMenuItem;
    MenuItem1: TMenuItem;
    FileExit: TMenuItem;
    MenuItem2: TMenuItem;
    CloseMenu: TMenuItem;
    pWindowMaximize: TMenuItem;
    pWidowMinimize: TMenuItem;
    pWindowNormal: TMenuItem;
    pWindowMenu: TMenuItem;
    pFileOpen: TMenuItem;
    pFileSaveAs: TMenuItem;
    pFileMenu: TMenuItem;
    OD: TOpenDialog;
    OPD: TOpenPictureDialog;
    PopupMenu1: TPopupMenu;
    SPD: TSavePictureDialog;
    ToolBar1: TToolBar;
    bExit: TToolButton;
    ToolButton1: TToolButton;
    bOpen: TToolButton;
    ToolButton2: TToolButton;
    bSaveAs: TToolButton;
    WindowMaximize: TMenuItem;
    WindowMinimize: TMenuItem;
    WindowNormal: TMenuItem;
    WindowMenu: TMenuItem;
    procedure bExitClick(Sender: TObject);
    procedure bOpenClick(Sender: TObject);
    procedure CloseMenuClick(Sender: TObject);
    procedure FileExitClick(Sender: TObject);
    procedure FileMenuClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure pFileOpenClick(Sender: TObject);
    procedure pWindowNormalClick(Sender: TObject);
    procedure WindowMaximizeClick(Sender: TObject);
    procedure WindowMenuClick(Sender: TObject);
    procedure WindowMinimizeClick(Sender: TObject);
    procedure WindowNormalClick(Sender: TObject);
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

procedure TfMain.Image1Click(Sender: TObject);
begin

end;

procedure TfMain.pFileOpenClick(Sender: TObject);
begin

end;

procedure TfMain.pWindowNormalClick(Sender: TObject);
begin

end;

procedure TfMain.WindowMaximizeClick(Sender: TObject);
begin
  fMain.WindowState:= wsMaximized;
end;

procedure TfMain.WindowMenuClick(Sender: TObject);
begin

end;

procedure TfMain.WindowMinimizeClick(Sender: TObject);
begin
  fMain.WindowState:= wsMinimized;
end;

procedure TfMain.WindowNormalClick(Sender: TObject);
begin
  fMain.WindowState:= wsNormal;
end;

procedure TfMain.FileMenuClick(Sender: TObject);
begin

end;

procedure TfMain.FileExitClick(Sender: TObject);
begin
Close;
end;

procedure TfMain.CloseMenuClick(Sender: TObject);
begin

end;

procedure TfMain.bExitClick(Sender: TObject);
begin

end;

procedure TfMain.bOpenClick(Sender: TObject);
begin

end;

end.

