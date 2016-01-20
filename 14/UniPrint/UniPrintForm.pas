unit UniPrintForm;

interface

uses
  SysUtils, Dialogs, ExtCtrls, DBCtrls, StdCtrls, Graphics,
  Mask, DB, DBTables, Printers, FMTBcd, SqlExpr, ComCtrls,
  Classes, Controls, Forms, math, DBXpress;

type
  TNavigator = class(TForm)
    PrintAllButton: TButton;
    SQLConnection1: TSQLConnection;
    EmplData: TSQLDataSet;
    ProgressBar1: TProgressBar;
    EmplCountData: TSQLDataSet;
    cbFile: TCheckBox;
    procedure PrintAllButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Navigator: TNavigator;

implementation

{$R *.DFM}

{$WARN UNIT_PLATFORM OFF}
uses
  FileCtrl;

procedure PrintOutDataSet (data: TDataSet; progress: TProgressBar;
  Font: TFont; toFile: Boolean = False; maxSize: Integer = 30);
var
  PrintFile: TextFile;
  I: Integer;
  strDir, sizeStr: string;
  oldFont: TFontRecall;
begin
  // assign the output to a printer or a file
  if toFile then
  begin
    SelectDirectory('Choose a folder', '', strDir);
    AssignFile (PrintFile,
      IncludeTrailingPathDelimiter(strDir) + 'output.txt');
  end
  else
    AssignPrn (PrintFile);
  Rewrite (PrintFile);

  // set the font and keep the original one
  oldFont := TFontRecall.Create (Printer.Canvas.Font);
  try
    Printer.Canvas.Font := Font;
    try
      data.Open;
      try
        // print header (field names) in bold
        Printer.Canvas.Font.Style := [fsBold];
        for I := 0 to data.FieldCount - 1 do
        begin
          sizeStr := IntToStr (min (
            data.Fields[i].DisplayWidth, maxSize));
          Write (PrintFile, Format ('%-' + sizeStr + 's',
            [data.Fields[i].FieldName]));
        end;
        Writeln (PrintFile);

        // for each record of the dataset
        Printer.Canvas.Font.Style := [];
        while not data.EOF do
        begin
          // print out each field of the record
          for I := 0 to data.FieldCount - 1 do
          begin
            sizeStr := IntToStr (min (
              data.Fields[i].DisplayWidth, maxSize));
            Write (PrintFile, Format ('%-' + sizeStr + 's',
              [data.Fields[i].AsString]));
          end;
          Writeln (PrintFile);
          // advance ProgressBar
          progress.Position := progress.Position + 1;
          data.Next;
        end;
      finally
        // close the dataset
        data.Close;
      end;
    finally
      // reassign the original printer font
      oldFont.Free;
    end;
  finally
    // close the printer/file
    CloseFile (PrintFile);
  end;
end;

procedure TNavigator.PrintAllButtonClick(Sender: TObject);
var
  Font: TFont;
begin
  // set ProgressBar range
  EmplCountData.Open;
  try
    ProgressBar1.Max := EmplCountData.Fields[0].AsInteger;
  finally
    EmplCountData.Close;
  end;

  Font := TFont.Create;
  try
    Font.Name := 'Courier New';
    Font.Size := 9;
    PrintOutDataSet (EmplData, ProgressBar1, Font, cbFile.Checked);
  finally
    Font.Free;
  end;
end;

end.
