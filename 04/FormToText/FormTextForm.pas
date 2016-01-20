unit FormTextForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  TformText = class(TForm)
    memoOut: TMemo;
    pBar: TPanel;
    btnResource: TButton;
    btnCurrent: TButton;
    btnPanel: TButton;
    procedure btnResourceClick(Sender: TObject);
    procedure btnCurrentClick(Sender: TObject);
    procedure btnPanelClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ConvertAndShow (aStream: TStream);
  end;

var
  formText: TformText;

implementation

{$R *.DFM}

procedure TformText.btnResourceClick(Sender: TObject);
var
  ResStr: TResourceStream;
begin
  ResStr := TResourceStream.Create(
    hInstance, 'TFORMTEXT', RT_RCDATA);
  try
    ConvertAndShow (ResStr);
  finally
    ResStr.Free
  end;
end;

procedure TformText.btnCurrentClick(Sender: TObject);
var
  MemStr: TStream;
begin
  MemStr := TMemoryStream.Create;
  try
    MemStr.WriteComponent (Self);
    ConvertAndShow (MemStr);
  finally
    MemStr.Free
  end;
end;

procedure TformText.ConvertAndShow (aStream: TStream);
var
  ConvStream: TStream;
begin
  aStream.Position := 0;
  ConvStream := TMemoryStream.Create;
  try
    ObjectBinaryToText (aStream, ConvStream);
    ConvStream.Position := 0;
    MemoOut.Lines.LoadFromStream (ConvStream);
  finally
    ConvStream.Free
  end;
end;

procedure TformText.btnPanelClick(Sender: TObject);
var
  MemStr: TStream;
begin
  MemStr := TMemoryStream.Create;
  try
    MemStr.WriteComponent (pBar);
    ConvertAndShow (MemStr);
  finally
    MemStr.Free
  end;
end;

end.
