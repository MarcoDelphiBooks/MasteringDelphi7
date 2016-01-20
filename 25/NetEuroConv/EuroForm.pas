unit EuroForm;

// ************************************************************************ //
// WARNING
// -------
// The code declared in this file was generated from data read from a
// a *.DFM file using Dfm2Pas 1.0. This tool was meant to help you
// with the conversion of Delphi forms into Morpheus until we have an 
// IDE and a Form designer.
// Keep in mind that we do not expect it to give you a 100% conversion
// but significantly reduce the amount of work you'd have to do.
// For now we expect to achieve between 90 and 99% of the necessary conversion.
//
// For a list of known issues check the README file (readme.txt).
//
// If you have any problems or suggestions please let us know.
// ************************************************************************ //


interface

uses
	{$IFDEF CLR}Borland.Win32.Windows{$ELSE}Windows{$ENDIF},
	{$IFDEF CLR}Borland.Win32.Messages{$ELSE}Messages{$ENDIF},
	{$IFDEF CLR}Borland.Delphi.SysUtils{$ELSE}SysUtils{$ENDIF},
	{$IFDEF CLR}Borland.Delphi.Variants{$ELSE}Variants{$ENDIF},
	{$IFDEF CLR}Borland.Delphi.Classes{$ELSE}Classes{$ENDIF},
	{$IFDEF CLR}Borland.Vcl.Graphics{$ELSE}Graphics{$ENDIF},
	{$IFDEF CLR}Borland.Vcl.Controls{$ELSE}Controls{$ENDIF},
	{$IFDEF CLR}Borland.Vcl.Forms{$ELSE}Forms{$ENDIF},
	{$IFDEF CLR}Borland.Vcl.Dialogs{$ELSE}Dialogs{$ENDIF},
	{$IFDEF CLR}Borland.Vcl.StdCtrls{$ELSE}StdCtrls{$ENDIF};

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
{$IFDEF CLR}		procedure InitializeControls;{$ENDIF}
  public
    { Public declarations }
{$IFDEF CLR}		constructor Create(AOwner: TComponent); override;{$ENDIF}
  end;

var
  Form1: TForm1;

implementation

uses
	EuroConvConst,
	{$IFDEF CLR}Borland.Delphi.ConvUtils{$ELSE}ConvUtils{$ENDIF},
	{$IFDEF CLR}Borland.Delphi.Math{$ELSE}Math{$ENDIF};

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

{$IFDEF CLR}constructor TForm1.Create(AOwner: TComponent);begin	inherited;	InitializeControls;  FormCreate (self);end;{$ENDIF}
{$IFDEF CLR}procedure TForm1.InitializeControls;begin
  // Initalizing all controls...
	Label1:= TLabel.Create(Self);
	Label2:= TLabel.Create(Self);
	Button1:= TButton.Create(Self);
	EditValue:= TEdit.Create(Self);
	EditResult:= TEdit.Create(Self);
	ListTypes:= TListBox.Create(Self);
	ListTypes2:= TListBox.Create(Self);

	// Form's PMEs'
	Left:= 195;
	Top:= 108;
	Width:= 414;
	Height:= 250;
	Caption:= 'Euro Conversion';
	Color:= clBtnFace;
	Font.Charset:= DEFAULT_CHARSET;
	Font.Color:= clWindowText;
	Font.Height:= -11;
	Font.Name:= 'MS Sans Serif';
	Font.Style:= [];
	OnCreate:= FormCreate;
	
	with Label1 do
	begin
		Parent:= Self;
		Left:= 8;
		Top:= 196;
		Width:= 30;
		Height:= 13;
		Caption:= 'Value:';
	end;
	
	with Label2 do
	begin
		Parent:= Self;
		Left:= 214;
		Top:= 196;
		Width:= 33;
		Height:= 13;
		Caption:= 'Result:';
	end;
	
	with Button1 do
	begin
		Parent:= Self;
		Left:= 168;
		Top:= 8;
		Width:= 75;
		Height:= 177;
		Caption:= 'Convert';
		TabOrder:= 0;
		OnClick:= Button1Click;
	end;
	
	with EditValue do
	begin
		Parent:= Self;
		Left:= 40;
		Top:= 192;
		Width:= 145;
		Height:= 21;
		TabOrder:= 1;
		Text:= '120';
	end;
	
	with EditResult do
	begin
		Parent:= Self;
		Left:= 256;
		Top:= 192;
		Width:= 145;
		Height:= 21;
		TabOrder:= 2;
	end;
	
	with ListTypes do
	begin
		Parent:= Self;
		Left:= 8;
		Top:= 8;
		Width:= 153;
		Height:= 177;
		ItemHeight:= 13;
		TabOrder:= 3;
	end;
	
	with ListTypes2 do
	begin
		Parent:= Self;
		Left:= 248;
		Top:= 5;
		Width:= 153;
		Height:= 180;
		ItemHeight:= 13;
		TabOrder:= 4;
	end;
end;{$ENDIF}
end.
