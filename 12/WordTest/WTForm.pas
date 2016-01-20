unit WTForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    SaveDialog1: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

uses
  ComObj, ActiveX;

var
  OldWord, NewWord: Variant;

function GetOrCreateObject (const ClassName: string): IDispatch;
var
  ClassID: TGUID;
  Unknown: IUnknown;
begin
  ClassID := ProgIDToClassID (ClassName);
  if Succeeded (GetActiveObject (ClassID, nil, Unknown)) then
    OleCheck (Unknown.QueryInterface (IDispatch, Result))
  else
    Result := CreateOleObject (ClassName);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
{  try
    OldWord := GetActiveOleObject ('Word.Basic');
  except
    OldWord := CreateOleObject ('Word.Basic');
  end;}
  OldWord := GetOrCreateObject ('Word.Basic');
  NewWord := GetOrCreateObject ('Word.Application');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  OldWord.FileNew;
  OldWord.AppShow;
  OldWord.Insert ('Mastering Delphi by Marco Cantù');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  OldWord.FileNew;
  OldWord.AppShow;
  OldWord.Isnert ('Mastering Delphi by Marco Cantù');
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  Document, Range: Variant;
begin
  NewWord.Visible := True;
  NewWord.Documents.Add;
  // insert text
  NewWord.Documents.Item(1).Range.
    Text := 'Mastering Delphi by Marco Cantù';
  // get document and add paragraph
  Document := NewWord.Documents.Item(1);
  Document.Paragraphs.Add;
  Document.Paragraphs.Add;
  // select the third paragraph in a 'range'
  Range := Document.Paragraphs.Item(3).Range;
  Range.Text := 'Hello, Delphians';
  Range.Bold := 1;
  Range.Font.Size := 30;
  // save the resulting file
  if SaveDialog1.Execute then
    Document.SaveAs (WideString (SaveDialog1.Filename), 0);
    {Document.SaveAs (
      FileName := WideString (SaveDialog1.Filename),
      FileFormat := 0, // word native format
      SaveNativePictureFormat := 1); // true}
end;

end.
