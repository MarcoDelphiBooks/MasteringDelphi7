unit EncForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TFormEncode = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Panel1: TPanel;
    BtnLoadPlain: TButton;
    BtnSaveEncoded: TButton;
    BtnLoadEncoded: TButton;
    Splitter1: TSplitter;
    procedure BtnSaveEncodedClick(Sender: TObject);
    procedure BtnLoadEncodedClick(Sender: TObject);
    procedure BtnLoadPlainClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEncode: TFormEncode;

implementation

{$R *.DFM}

uses
  EncodStr;

procedure TFormEncode.BtnSaveEncodedClick(Sender: TObject);
var
  EncStr: TEncodedStream;
begin
  if SaveDialog1.Execute then
  begin
    EncStr := TEncodedStream.Create(
      SaveDialog1.Filename, fmCreate);
    try
      Memo1.Lines.SaveToStream (EncStr);
    finally
      EncStr.Free;
    end;
  end;
end;

procedure TFormEncode.BtnLoadEncodedClick(Sender: TObject);
var
  EncStr: TEncodedStream;
begin
  if OpenDialog1.Execute then
  begin
    EncStr := TEncodedStream.Create(
      OpenDialog1.FileName, fmOpenRead);
    try
      Memo2.Lines.LoadFromStream (EncStr);
    finally
      EncStr.Free;
    end;
  end;
end;

procedure TFormEncode.BtnLoadPlainClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    Memo1.Lines.LoadFromFile (
      OpenDialog1.FileName);
end;

end.
