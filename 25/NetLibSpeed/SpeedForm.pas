unit SpeedForm;

interface

uses
  Borland.Delphi.Classes,
  Borland.Delphi.SysUtils,
  Borland.VCL.Graphics,
  Borland.VCL.Controls,
  Borland.VCL.Forms,
  Borland.VCL.Dialogs,
  Borland.VCL.StdCtrls;

type
  TForm1 = class(TForm)
    ScrollBox1: TScrollBox;
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create (AOwner: TComponent); override;
  end;

var
  Form1: TForm1;

implementation

procedure TForm1.Button1Click(Sender: TObject);
var
  i: Integer;
  time: TDateTime;
begin
  time := Now;
  for I := 0 to 500 do
  begin
    with TEdit.Create (self) do
    begin
      SetBounds (Random (ScrollBox1.ClientWidth),
        Random (ScrollBox1.ClientHeight),
        50, 16);
      Parent := ScrollBox1;
      Text := 'Edit ' + IntToStr (I);
    end;
    with TButton.Create (self) do
    begin
      SetBounds (Random (ScrollBox1.ClientWidth),
        Random (ScrollBox1.ClientHeight),
        Width, Height); // default
      Parent := ScrollBox1;
      Caption := 'Button ' + IntToStr (I);
    end;
//     Application.ProcessMessages;
  end;
  time := Now - time;
  Label1.Caption := FormatDateTime ('nn:ss.zzz', time);
end;


constructor TForm1.Create(AOwner: TComponent);
begin
  inherited;

  Left := 192;
  Top := 107;
  Width := 666  ;
  Height := 446;
  Caption := 'LibSpeed';
  Color := clBtnFace;
  Font.Color := clWindowText;
  Font.Height := -11;
  Font.Name := 'MS Sans Serif';
  Font.Style := [];

  Label1 := TLabel.Create (self);
  with Label1 do
  begin
    Left := 176;
    Top := 24;
    Width := 32;
    Height := 13;
    Caption := 'Label1';
    Parent := self;
  end;
  ScrollBox1 := TScrollBox.Create (self);
  with ScrollBox1 do
  begin
    Left := 24;
    Top := 64;
    Width := 625;
    Height := 337;
    TabOrder := 0;
    Parent := self;
  end;
  Button1 := TButton.Create(self);
  with Button1 do
  begin
    Left := 32;
    Top := 16;
    Width := 75;
    Height := 25;
    Caption := 'Test';
    TabOrder := 1;
    OnClick := Button1Click;
    Parent := self;
  end;
end;

end.
