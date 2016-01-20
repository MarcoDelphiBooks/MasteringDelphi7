unit GUIDForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    BtnNew: TButton;
    Memo1: TMemo;
    procedure BtnNewClick(Sender: TObject);
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

procedure TForm1.BtnNewClick(Sender: TObject);
var
  ID: TGUID;
  S: string;
begin
  if CoCreateGuid (Id) = s_OK then
  begin
    s := GUIDToString (Id);
    Memo1.Lines.Add (S);
  end;
end;

end.
