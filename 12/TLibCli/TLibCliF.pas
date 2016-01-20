unit TLibCliF;

interface

{$WARN SYMBOL_PLATFORM OFF} 

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, TLibDemo_tlb, Variants;

type
  TClientForm = class(TForm)
    BtnColor1: TButton;
    BtnColor2: TButton;
    BtnIntf: TButton;
    BtnVariant: TButton;
    BtnDispIntf: TButton;
    Bevel1: TBevel;
    ListResult: TListBox;
    BtnColorBis: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnColor1Click(Sender: TObject);
    procedure BtnColor2Click(Sender: TObject);
    procedure BtnIntfClick(Sender: TObject);
    procedure BtnVariantClick(Sender: TObject);
    procedure BtnDispIntfClick(Sender: TObject);
    procedure BtnColorBisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    MyServer, MyServerBis: Variant;
    IMyServer, IMyServerBis: IFirstServer;
    DMyServer: IFirstServerDisp;
  end;

var
  ClientForm: TClientForm;

implementation

{$R *.DFM}

procedure TClientForm.FormCreate(Sender: TObject);
begin
  // creates server objects
  IMyServer := CoFirstServer.Create;
  DMyServer := CoFirstServer.Create as IFirstServerDisp;
  MyServer := CoFirstServer.Create;
end;

procedure TClientForm.BtnColor1Click(Sender: TObject);
begin
  IMyServer.ChangeColor;
end;

procedure TClientForm.BtnColor2Click(Sender: TObject);
begin
  MyServer.ChangeColor;
end;

procedure TClientForm.BtnIntfClick(Sender: TObject);
var
  I, K: Integer;
  Ticks: Cardinal;
begin
  Screen.Cursor := crHourglass;
  try
    Ticks := GetTickCount;
    K := 0;
    for I := 1 to 100 do
      K := K + IMyServer.Value;
    Ticks := GetTickCount - Ticks;
    ListResult.items.Add (Format (
      'Interface: %d - Seconds %.3f', [K, Ticks / 1000]));
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TClientForm.BtnVariantClick(Sender: TObject);
var
  I, K: Integer;
  Ticks: Cardinal;
begin
  Screen.Cursor := crHourglass;
  try
    Ticks := GetTickCount;
    K := 0;
    for I := 1 to 100 do
      K := K + MyServer.Value;
    Ticks := GetTickCount - Ticks;
    ListResult.items.Add (Format (
      'Variant: %d - Seconds %.3f', [K, Ticks / 1000]));
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TClientForm.BtnDispIntfClick(Sender: TObject);
var
  I, K: Integer;
  Ticks: Cardinal;
begin
  Screen.Cursor := crHourglass;
  try
    Ticks := GetTickCount;
    K := 0;
    for I := 1 to 100 do
      K := K + DMyServer.Value;
    Ticks := GetTickCount - Ticks;
    ListResult.items.Add (Format (
      'DispIntf %d - Seconds %.3f', [K, Ticks / 1000]));
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TClientForm.BtnColorBisClick(Sender: TObject);
begin
  if varType (MyServerBis) = varEmpty then
    MyServerBis := CoFirstServer.Create;
  MyServerBis.ChangeColor;

  if not Assigned (IMyServerBis) then
    IMyServerBis := CoFirstServer.Create;
  IMyServerBis.ChangeColor;
end;

end.
