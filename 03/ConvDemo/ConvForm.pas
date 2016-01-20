unit ConvForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Types, StdCtrls, ConvUtils, StdConvs, StrUtils;

type
  TForm1 = class(TForm)
    ComboFamilies: TComboBox;
    ListTypes: TListBox;
    EditType: TEdit;
    EditAmount: TEdit;
    EditConverted: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BtnSimple: TButton;
    Label6: TLabel;
    EditDestination: TEdit;
    BtnConvert: TButton;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ChangeFamily(Sender: TObject);
    procedure BtnSimpleClick(Sender: TObject);
    procedure DoConvert(Sender: TObject);
    procedure EditTypeDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure EditTypeDragDrop(Sender, Source: TObject; X, Y: Integer);
  private
    aFamilies: TConvFamilyArray;
    CurrFamily: TConvFamily;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  GetConvFamilies (aFamilies);
  for i := Low(aFamilies) to High(aFamilies) do
    ComboFamilies.Items.Add (
      ConvFamilyToDescription (aFamilies[i]));
  // get the first and fire event
  ComboFamilies.ItemIndex := 0;
  ChangeFamily (self);
end;

procedure TForm1.ChangeFamily(Sender: TObject);
var
  aTypes: TConvTypeArray;
  i: Integer;
begin
  ListTypes.Clear;
  CurrFamily := aFamilies [ComboFamilies.ItemIndex];
  GetConvTypes (CurrFamily, aTypes);
  for i := Low(aTypes) to High(aTypes) do
    ListTypes.Items.Add (
      ConvTypeToDescription (aTypes[i]));
end;

procedure TForm1.BtnSimpleClick(Sender: TObject);
begin
  // samples

  // convert temperatures: celsius to fahrenheit
  ShowMessage ('31 Celsius -> ' + FloatToStr (
    Convert (31, tuCelsius, tuFahrenheit)) + ' Fahrenheit');

  // convert speed: miles per hour to meters per seconds
  ShowMessage ('20 Miles/Hour -> ' + FloatToStr (
    Convert(20, duMiles, tuHours, duMeters, tuSeconds)) +
    ' Meters/Second');
end;

procedure TForm1.DoConvert(Sender: TObject);
var
  BaseType, DestType: TConvType;
begin
  // get and check base type
  if not DescriptionToConvType(CurrFamily, EditType.Text, BaseType) then
    EditType.Font.Color := clRed
  else
    EditType.Font.Color := clBlack;

  // get and check destination type
  if not DescriptionToConvType(CurrFamily, EditDestination.Text, DestType) then
    EditDestination.Font.Color := clRed
  else
    EditDestination.Font.Color := clBlack;

  if (DestType = 0) or (BaseType = 0) then
    EditConverted.Text := 'Invalid type'
  else
    EditConverted.Text := FloatToStr (Convert (
      StrToFloat (EditAmount.Text), BaseType, DestType));
end;

procedure TForm1.EditTypeDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := True;
end;

procedure TForm1.EditTypeDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  (Sender as TEdit).Text := (Source as TListBox).Items
    [(Source as TListBox).ItemIndex];
end;

end.
