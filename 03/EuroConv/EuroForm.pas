unit EuroForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    EditValue: TEdit;
    EditResult: TEdit;
    ListTypes: TListBox;
    ListTypes2: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
   EuroConvConst, ConvUtils, Math;

procedure TForm1.Button1Click(Sender: TObject);
var
  nConverted: Double;
  BaseType, DestType: TConvType;
begin
  // simple conversions (test)
  {EditResult.Text := FloatToStrF (
    Convert (StrToFloat (EditValue.Text),
    cuDEM, cuITL), ffNumber, 15, 3)}

  DescriptionToConvType(cbEuroCurrency,
    ListTypes.Items [ListTypes.ItemIndex], BaseType);
  DescriptionToConvType(cbEuroCurrency,
    ListTypes2.Items [ListTypes2.ItemIndex], DestType);

  // plain conversions
  {nConverted := Convert (StrToFloat (EditValue.Text),
    BaseType, DestType);
  EditResult.Text := FloatToStrF (nConverted, ffNumber, 15, 4);}

  // Euro "rounding" conversion
  nConverted := EuroConvert (StrToFloat (EditValue.Text),
    BaseType, DestType, 4);
  EditResult.Text := FloatToStrF (nConverted, ffNumber, 15, 4);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  ATypes: TConvTypeArray;
  i: Integer;
begin
  GetConvTypes(cbEuroCurrency, ATypes);
  for i := Low(aTypes) to High(aTypes) do
    ListTypes.Items.Add (
      ConvTypeToDescription (aTypes[i]));
  // copy items to the second list
  ListTypes2.Items := ListTypes.Items;
  // select first of each list
  ListTypes.ItemIndex := 0;
  ListTypes2.ItemIndex := 0;
end;

end.
