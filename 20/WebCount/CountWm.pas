unit CountWm;

interface

uses
  Windows, SysUtils, HTTPApp;

type
  TWebModule1 = class(TWebModule)
    procedure WebModule1WebActionItem1Action(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  end;

var
  WebModule1: TWebModule1;

implementation

{$R *.DFM}

uses
  Graphics, Jpeg, ExtCtrls, Classes;

procedure TWebModule1.WebModule1WebActionItem1Action(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  Bitmap: TBitmap; // Image: TImage;
  nHit: Integer;
  LogFile: Text;
  LogFileName: string;
  Jpeg1: TJpegImage;
  Stream: TMemoryStream;
begin
  LogFileName := 'WebCont.log';
  System.Assign (LogFile, LogFileName);
  try
    // read if the file exists
    if FileExists (LogFileName) then
    begin
      Reset (LogFile);
      Readln (LogFile, nHit);
      Inc (nHit);
    end
    else
      nHit := 0;
    // saves the new data
    Rewrite (LogFile);
    Writeln (LogFile, nHit);
  finally
    Close (LogFile);
  end;
  // simple version (text only counter)
  Response.Content := IntToStr (nHit);

  // create a bitmap in memory
  Bitmap := TBitmap.Create;
  try
    Bitmap.Width := 120;
    Bitmap.Height := 25;
    // draw the digits
    Bitmap.Canvas.Font.Name := 'Arial';
    Bitmap.Canvas.Font.Size := 14;
    Bitmap.Canvas.Font.Color := RGB (255, 127, 0);
    Bitmap.Canvas.Font.Style := [fsBold];
    Bitmap.Canvas.TextOut (1, 1, 'Hits: ' +
      FormatFloat ('###,###,###', Int (nHit)));
    // convert to JPEG and output
    Jpeg1 := TJpegImage.Create;
    try
      Jpeg1.CompressionQuality := 50;
      Jpeg1.Assign(Bitmap);
      Stream := TMemoryStream.Create;
      Jpeg1.SaveToStream (Stream);
      Stream.Position := 0;
      Response.ContentType := 'image/jpeg';
      Response.ContentStream := Stream;
      Response.SendResponse;
      // the response object will free the stream
    finally
      Jpeg1.Free;
    end;
  finally
    Bitmap.Free;
  end;
end;

end.
