unit FishClientForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, InvokeRegistry, Rio, SOAPHTTPClient,
  ComCtrls, Grids, DBGrids, DBCtrls, DB, DBClient;

type
  TForm1 = class(TForm)
    Image1: TImage;
    btnGetImage: TButton;
    btnGetCds: TButton;
    StatusBar1: TStatusBar;
    HTTPRIO1: THTTPRIO;
    Edit1: TEdit;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    DBImage1: TDBImage;
    DBGrid1: TDBGrid;
    procedure btnGetImageClick(Sender: TObject);
    procedure btnGetCdsClick(Sender: TObject);
    procedure HTTPRIO1HTTPWebNode1ReceivingData(Read, Total: Integer);
  private
    { Private declarations }
    nRead: Integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  ISoapFish1;

procedure TForm1.btnGetImageClick(Sender: TObject);
var
  sAtt: TSoapAttachment;
  memStr: TMemoryStream;
  bmp: TBitmap;
begin
  nRead := 0;
  sAtt := (HttpRio1 as ISoapFish).GetImage (Edit1.Text);
  memStr := TMemoryStream.Create;
  sAtt.SaveToStream(memStr);
  memStr.Position := 0;

  bmp := TBitmap.Create;
  bmp.LoadFromStream(memStr);
  Canvas.Draw (10, 100, bmp);

  // Image1.Picture.Bitmap := bmp;
  bmp.Free;
  // free the bitmap?
  memStr.Free;
end;

procedure TForm1.btnGetCdsClick(Sender: TObject);
var
  sAtt: TSoapAttachment;
  memStr: TMemoryStream;
begin
  nRead := 0;
  sAtt := (HttpRio1 as ISoapFish).GetCds;
  try
    memStr := TMemoryStream.Create;
    try
      sAtt.SaveToStream(memStr);
      memStr.Position := 0;
      ClientDataSet1.LoadFromStream(MemStr);
    finally
      memStr.Free;
    end;
  finally
    DeleteFile (sAtt.CacheFile);
    sAtt.Free;
  end;
end;

procedure TForm1.HTTPRIO1HTTPWebNode1ReceivingData(
  Read, Total: Integer);
begin
  Inc (nRead, Read);
  StatusBar1.SimpleText := IntToStr (nRead);
  Application.ProcessMessages;
end;

end.
