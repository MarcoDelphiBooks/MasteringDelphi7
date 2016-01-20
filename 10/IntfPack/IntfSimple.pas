unit IntfSimple;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, IntfColSel,
  ColorGrd;

type
  TFormSimpleColor = class(TForm, IColorSelect)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ColorGrid1: TColorGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure SetSelColor (Col: TColor);
    function GetSelColor: TColor;
  public
    procedure ApplyClick (Sender: TObject);
    function Display (Modal: Boolean = True): Boolean;
  published
    property SelectedColor: TColor
      read GetSelColor write SetSelColor;
  end;

implementation

{$R *.DFM}

procedure TFormSimpleColor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // used by the modeless form
  Action := caFree;
end;

procedure TFormSimpleColor.ApplyClick(Sender: TObject);
begin
  // set the color of the main form
  Application.MainForm.Color := SelectedColor;
end;

// set and get properties

function TFormSimpleColor.GetSelColor: TColor;
begin
  Result := ColorGrid1.ForegroundColor;
end;

procedure TFormSimpleColor.SetSelColor (Col: TColor);
begin
  ColorGrid1.ForegroundIndex :=
    ColorGrid1.ColorToIndex(Col)
end;

function TFormSimpleColor.Display(Modal: Boolean): Boolean;
begin
  Result := True; // default
  if Modal then
    Result := (ShowModal = mrOK)
  else
  begin
    BitBtn1.Caption := 'Apply';
    BitBtn1.OnClick := ApplyClick;
    BitBtn2.Kind := bkClose;
    Show;
  end;
end;

initialization
  RegisterColorSelect (TFormSimpleColor);

end.
