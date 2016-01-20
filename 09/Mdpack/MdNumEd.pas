unit MdNumEd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, StdCtrls;

type
  TMdNumEdit = class (TCustomEdit)
  private
    fInputError: TNotifyEvent;
  protected
    function GetValue: Integer;
    procedure SetValue (Value: Integer);
    procedure KeyPress(var Key: Char); override;
  public
    constructor Create (Owner: TComponent); override;
  published
    property OnInputError: TNotifyEvent
      read fInputError write fInputError;
    property Value: Integer
      read GetValue write SetValue default 0;
    property AutoSelect;
    property AutoSize;
    property BorderStyle;
    property CharCase;
    property Color;
    property Ctl3D;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property HideSelection;
    property MaxLength;
    property OEMConvert;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PasswordChar;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  end;

  TMdThousandEdit = class (TMdNumEdit)
  public
    procedure Change; override;
  end;

procedure Register;

implementation

constructor TMdNumEdit.Create (Owner: TComponent);
begin
  inherited Create (Owner);
  Value := 0;
end;

function TMdNumEdit.GetValue: Integer;
begin
  // set to 0 in case of error
  Result := StrToIntDef (Text, 0);
end;

procedure TMdNumEdit.KeyPress(var Key: Char);
begin
  if not (Key in ['0'..'9']) and not (Key = #8) then
  begin
    Key := #0; // pretend that nothing was pressed
    if Assigned (fInputError) then
      fInputError (Self);
  end
  else
    inherited;
end;

procedure TMdNumEdit.SetValue (Value: Integer);
begin
  Text := IntToStr (Value);
end;

procedure Register;
begin
  RegisterComponents ('Md', [TMdNumEdit, TMdThousandEdit]);
end;

{ TMdCurrencyEdit }

function StringToFloatSkipping (s: string): Extended;
var
  s1: string;
  I: Integer;
begin
  // remove non-numbers, but keep the decimal separator
  s1 := '';
  for i := 1 to length (s) do
   if s[i] in ['0'..'9'] then
     s1 := s1 + s[i];
  Result := StrToFloat (s1);
end;

procedure TMdThousandEdit.Change;
var
  CursorPos, // original position of the cursor
  LengthDiff: Integer; // number of new separators (+ or -)
begin
  if Assigned (Parent) then
  begin
    CursorPos := SelStart;
    LengthDiff := Length (Text);
    Text := FormatFloat ('#,###',
      StringToFloatSkipping (Text));
    LengthDiff := Length (Text) - LengthDiff;
    // move the cursor to the proper position
    SelStart := CursorPos + LengthDiff;
  end;
  inherited;
end;

end.
