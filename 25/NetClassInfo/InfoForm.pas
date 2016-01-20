unit InfoForm;

interface

uses
  {$IFDEF CLR}Borland.Vcl.StdCtrls{$ELSE}StdCtrls {$ENDIF},
  {$IFDEF CLR}Borland.Vcl.Controls{$ELSE}Controls {$ENDIF},
	{$IFDEF CLR}Borland.Delphi.Classes{$ELSE}Classes  {$ENDIF},
	{$IFDEF CLR}Borland.Vcl.Graphics{$ELSE}Graphics {$ENDIF},
	{$IFDEF CLR}Borland.Vcl.Forms{$ELSE}Forms    {$ENDIF},
	{$IFDEF CLR}Borland.Vcl.ExtCtrls{$ELSE}ExtCtrls {$ENDIF},
	{$IFDEF CLR}Borland.Vcl.Buttons{$ELSE}Buttons  {$ENDIF},
	{$IFDEF CLR}Borland.Vcl.Menus{$ELSE}Menus    {$ENDIF};

type
  TForm1 = class(TForm)
    ListParent: TListBox;
    Label1: TLabel;
    EditInfo: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    ListClasses: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure ListClassesClick(Sender: TObject);
  private
    ClassArray: array of TClass;
{$IFDEF CLR}		procedure InitializeControls;{$ENDIF}
  public
    { Public declarations }
{$IFDEF CLR}		constructor Create(AOwner: TComponent); override;{$ENDIF}
  end;

var
  Form1: TForm1;

implementation

procedure TForm1.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  SetLength (ClassArray, 50);

  ClassArray [0] := TButton;
  ClassArray [1] := TBitBtn;
  ClassArray [2] := TEdit;
  ClassArray [3] := TPopupMenu;
  ClassArray [4] := TRadioButton;
  ClassArray [5] := TRadioGroup;
  ClassArray [6] := TPanel;
  ClassArray [7] := TCheckBox;
  ClassArray [8] := TForm;
  ClassArray [9] := TComboBox;
  ClassArray [10] := TGroupBox;
  ClassArray [11] := TSpeedButton;
  ClassArray [12] := TLabel;
  ClassArray [13] := TListBox;
  ClassArray [14] := TMainMenu;
  ClassArray [15] := TMemo;

  // copy class names to the listbox
  for I := 0 to 15 do
    ListClasses.Items.Add (ClassArray [I].ClassName);
  // select the first class
  ListClasses.ItemIndex := 0;
  // show initial information
  // ListClassesClick (Sender);
end;

procedure TForm1.ListClassesClick(Sender: TObject);
var
  MyClass: TClass;
begin
  MyClass := ClassArray [ListClasses.ItemIndex];
  EditInfo.Text := Format ('Name: %s - Size: %d bytes',
    [MyClass.ClassName, 0 {MyClass.InstanceSize}]);
  with ListParent.Items do
  begin
    Clear;
    while MyClass.ClassName <> 'Object' do
    begin
      MyClass := MyClass.ClassParent;
      Add (MyClass.ClassName);
    end;
  end;
end;

{$IFDEF CLR}constructor TForm1.Create(AOwner: TComponent);begin	inherited;	InitializeControls;  FormCreate (self);end;{$ENDIF}
{$IFDEF CLR}procedure TForm1.InitializeControls;begin
  // Initalizing all controls...
	Label3:= TLabel.Create(Self);
	Panel1:= TPanel.Create(Self);
	Label1:= TLabel.Create(Self);
	Label2:= TLabel.Create(Self);
	ListParent:= TListBox.Create(Self);
	EditInfo:= TEdit.Create(Self);
	ListClasses:= TListBox.Create(Self);

	// Form's PMEs'
	Left:= 217;
	Top:= 109;
	Width:= 397;
	Height:= 236;
	Caption:= 'NetClassInfo';
	Color:= clBtnFace;
	Font.Color:= clWindowText;
	Font.Height:= -11;
	Font.Name:= 'MS Sans Serif';
	Font.Style:= [];
	OnCreate:= FormCreate;

	with Label3 do
	begin
		Parent:= Self;
		Left:= 8;
		Top:= 8;
		Width:= 56;
		Height:= 13;
		Caption:= 'Class Name';
	end;

	with Panel1 do
	begin
		Parent:= Self;
		Left:= 168;
		Top:= 8;
		Width:= 209;
		Height:= 193;
		Caption:= 'Panel1';
		TabOrder:= 0;
	end;
	
	with Label1 do
	begin
		Parent:= Panel1;
		Left:= 8;
		Top:= 48;
		Width:= 63;
		Height:= 13;
		Caption:= 'Base Classes';
	end;
	
	with Label2 do
	begin
		Parent:= Panel1;
		Left:= 8;
		Top:= 8;
		Width:= 25;
		Height:= 13;
		Caption:= 'Class';
	end;
	
	with ListParent do
	begin
		Parent:= Panel1;
		Left:= 8;
		Top:= 64;
		Width:= 193;
		Height:= 121;
		Color:= clWindow;
		ItemHeight:= 13;
		TabOrder:= 0;
	end;
	
	with EditInfo do
	begin
		Parent:= Panel1;
		Left:= 8;
		Top:= 24;
		Width:= 193;
		Height:= 21;
		Color:= clWindow;
		ReadOnly:= True;
		TabOrder:= 1;
	end;
	
	with ListClasses do
	begin
		Parent:= Self;
		Left:= 8;
		Top:= 24;
		Width:= 153;
		Height:= 177;
		Color:= clWindow;
		ItemHeight:= 13;
		TabOrder:= 1;
		OnClick:= ListClassesClick;
	end;
end;{$ENDIF}
end.
