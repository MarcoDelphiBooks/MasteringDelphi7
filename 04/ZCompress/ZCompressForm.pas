unit ZCompressForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    btnCompress: TButton;
    btnDecompress: TButton;
    Memo1: TMemo;
    edOrigin: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edCompressed: TEdit;
    procedure btnCompressClick(Sender: TObject);
    procedure btnDecompressClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Zlib;

{$R *.dfm}

// CompressStream returns the compression rate
function CompressStream (aSource, aTarget: TStream): Single;
var
  comprStream: TCompressionStream;
begin
  comprStream := TCompressionStream.Create(
    clFastest, aTarget);
  try
    comprStream.CopyFrom(aSource, aSource.Size);
    Result := comprStream.CompressionRate;
  finally
    comprStream.Free;
  end;
end;

// DecompressStream
procedure DecompressStream (aSource, aTarget: TStream) ;
var
  decompStream: TDecompressionStream;
  nRead: Integer;
  Buffer: array [0..1023] of Char;
begin
  decompStream := TDecompressionStream.Create(aSource);
  try
    // aStreamDest.CopyFrom (decompStream, size) doens't work
    // properly as you don't know the size in advance,
    // I've used a similar "manual" code
    repeat
      nRead := decompStream.Read(Buffer, 1024);
      aTarget.Write (Buffer, nRead);
    until nRead = 0;
  finally
    decompStream.Free;
  end;
end;

procedure TForm1.btnCompressClick(Sender: TObject);
var
  aStreamSource, aStreamDest: TFileStream;
begin
  aStreamSource := TFileStream.Create (edOrigin.Text, fmOpenRead);
  aStreamDest := TFileStream.Create (edCompressed.Text, fmCreate);
  try
    CompressStream (aStreamSource, aStreamDest);
    aStreamDest.Position := 0;
    Memo1.Lines.LoadFromStream (aStreamDest);
  finally
    aStreamSource.Free;
    aStreamDest.Free;
  end;
end;

procedure TForm1.btnDecompressClick(Sender: TObject);
var
  aStreamSource: TFileStream;
  aStreamDest: TMemoryStream;
begin
  aStreamSource := TFileStream.Create (edCompressed.Text, fmOpenRead);
  aStreamDest := TMemoryStream.Create;
  try
    DecompressStream(aStreamSource, aStreamDest);
    aStreamDest.Position := 0;
    Memo1.Lines.LoadFromStream(aStreamDest);
  finally
    aStreamSource.Free;
    aStreamDest.Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // prefix the file names with the path of the program
  edOrigin.Text := ExtractFilePath (Application.ExeName) + edOrigin.Text;
  edCompressed.Text := ExtractFilePath (Application.ExeName) + edCompressed.Text;
end;

end.
