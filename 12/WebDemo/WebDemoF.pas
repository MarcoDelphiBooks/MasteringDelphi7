unit WebDemoF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, OleCtrls, StdCtrls, ComCtrls, ToolWin,
  ImgList, shdocvw;

type
  TForm1 = class(TForm)
    WebBrowser1: TWebBrowser;
    OpenDialog1: TOpenDialog;
    StatusBar1: TStatusBar;
    ControlBar1: TControlBar;
    Panel1: TPanel;
    BtnOpen: TSpeedButton;
    BtnGo: TSpeedButton;
    ComboURL: TComboBox;
    procedure BtnOpenClick(Sender: TObject);
    procedure WebBrowser1DownloadComplete(Sender: TObject);
    procedure WebBrowser1TitleChange(Sender: TObject;
      const Text: WideString);
    procedure BtnGoClick(Sender: TObject);
    procedure ComboURLKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure WebBrowser1StatusTextChange(Sender: TObject;
      const Text: WideString);
    procedure WebBrowser1DownloadBegin(Sender: TObject);
  private
    { Private declarations }
  public
    procedure GotoPage (ReqUrl: string);
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.BtnOpenClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
      GotoPage (OpenDialog1.FileName);
end;

procedure TForm1.WebBrowser1DownloadComplete(Sender: TObject);
var
  NewUrl: string;
begin
  StatusBar1.Panels[0].Text := 'Done';
  // add URL to combobox
  NewUrl := WebBrowser1.LocationURL;
  if (NewUrl <> '') and
      (ComboURL.Items.IndexOf (NewUrl) < 0) then
    ComboURL.Items.Add (NewUrl);
end;

procedure TForm1.WebBrowser1TitleChange(Sender: TObject;
  const Text: WideString);
begin
  Caption := Text;
end;

procedure TForm1.BtnGoClick(Sender: TObject);
begin
  GotoPage (ComboUrl.Text);
end;

procedure TForm1.ComboURLKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    GotoPage (ComboUrl.Text);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  GotoPage (ExtractFilePath (Application.ExeName) +
    'greeting.htm');
end;

procedure TForm1.GotoPage(ReqUrl: string);
begin
  WebBrowser1.Navigate (ReqUrl, EmptyParam, EmptyParam,
    EmptyParam, EmptyParam);
end;

procedure TForm1.WebBrowser1StatusTextChange(Sender: TObject;
  const Text: WideString);
begin
  StatusBar1.Panels[1].Text := Text;
end;

procedure TForm1.WebBrowser1DownloadBegin(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := 'Downloading ' +
    WebBrowser1.LocationURL + '...';
end;

end.
