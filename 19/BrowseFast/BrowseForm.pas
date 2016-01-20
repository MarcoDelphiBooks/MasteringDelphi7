unit BrowseForm;

interface

uses
  SysUtils, Types, Classes, Variants, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QComCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, QExtCtrls, IdURI;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    ToolButton4: TToolButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Memo1: TMemo;
    ComboURL: TComboBox;
    TextBrowser1: TTextBrowser;
    IdHTTP1: TIdHTTP;
    StatusBar1: TStatusBar;
    ToolButton2: TToolButton;
    procedure ToolButton4Click(Sender: TObject);
    procedure ComboURLKeyPress(Sender: TObject; var Key: Char);
    procedure TextBrowser1HighlightText(Sender: TObject;
      const HighlightedText: WideString);
    procedure TextBrowser1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
  private
    LastUrl, NewRequest: String;
    nPos: Integer;
  public
    procedure GoToUrl (NewUrl: String);
  end;

var
  Form1: TForm1;

implementation

{$R *.xfm}

procedure TForm1.ToolButton4Click(Sender: TObject);
begin
  GoToUrl (ComboUrl.Text);
  // reset back button
  nPos := 0;
end;

procedure TForm1.ComboURLKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    ToolButton4Click (Sender);
end;

procedure TForm1.TextBrowser1HighlightText(Sender: TObject;
  const HighlightedText: WideString);
begin
  StatusBar1.SimpleText := 'Goto: ' + HighlightedText;
  NewRequest := HighlightedText;
end;

procedure TForm1.TextBrowser1Click(Sender: TObject);
var
  Uri: TIdUri;
begin
  if NewRequest <> '' then
  begin
    Uri := TIdUri.Create (LastUrl);
    if Pos ('http:', NewRequest) > 0 then
      GoToUrl (NewRequest)
    else if NewRequest [1] = '/' then
      GoToUrl ('http://' + Uri.Host + NewRequest)
    else
      GoToUrl ('http://' + Uri.Host + Uri.Path + NewRequest);
    nPos := 0;
  end;
end;

procedure TForm1.GoToUrl(NewUrl: String);
begin
  // add to history list
  if (NewUrl <> '') then
  begin
    if ComboURL.Items.IndexOf (NewUrl) < 0 then
      ComboURL.Items.Insert (0, NewUrl);
    ComboURL.Text := NewUrl;
  end;

  TextBrowser1.Text := IdHttp1.Get (NewUrl);
  Memo1.Lines.Text := TextBrowser1.Text;
  // TextBrowser1.Factory.FilePath.Add (NewUrl);
  LastUrl := NewUrl;
  NewRequest := '';
end;

procedure TForm1.ToolButton2Click(Sender: TObject);
begin
  Inc (nPos);
  if NPos < ComboUrl.Items.Count then
    GoToUrl(ComboUrl.Items[nPos])
  else
    ToolButton2.Enabled := False;
end;

end.
