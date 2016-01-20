unit Viewer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus;

type
  TViewerForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Load1: TMenuItem;
    N1: TMenuItem;
    Close1: TMenuItem;
    Help1: TMenuItem;
    AboutPoliform1: TMenuItem;
    Panel1: TPanel;
    ButtonLoad: TButton;
    CloseButton: TButton;
    OpenDialog1: TOpenDialog;
    procedure AboutPoliform1Click(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure Load1Click(Sender: TObject);
    procedure ButtonLoadClick(Sender: TObject); virtual;
  private
    { Private declarations }
  public
    procedure LoadFile; virtual; abstract;
  end;

var
  ViewerForm: TViewerForm;

implementation

{$R *.DFM}

procedure TViewerForm.AboutPoliform1Click(Sender: TObject);
begin
  MessageDlg ('PoliForm, or Polymorphic Inherited Forms'#13 +
    'written by Marco Cantù for "Mastering Delphi"',
    mtInformation, [mbOK], 0);
end;

procedure TViewerForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TViewerForm.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TViewerForm.Load1Click(Sender: TObject);
begin
  LoadFile;
end;

procedure TViewerForm.ButtonLoadClick(Sender: TObject);
begin
  ShowMessage ('Error: File loading code missing');
end;

end.
