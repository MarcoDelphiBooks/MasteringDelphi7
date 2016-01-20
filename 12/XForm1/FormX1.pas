unit FormX1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, XForm1_TLB, ExtCtrls, StdVcl;

{$WARN SYMBOL_PLATFORM OFF}

type
  TFormX1 = class(TActiveForm, IFormX1)
    PaintBox1: TPaintBox;
    procedure FormPaint(Sender: TObject);
    procedure PaintBox1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    FEvents: IFormX1Events;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure PaintEvent(Sender: TObject);
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function Get_Active: WordBool; safecall;
    function Get_AutoScroll: WordBool; safecall;
    function Get_AutoSize: WordBool; safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    function Get_Caption: WideString; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_HelpFile: WideString; safecall;
    function Get_KeyPreview: WordBool; safecall;
    function Get_PixelsPerInch: Integer; safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    function Get_Scaled: WordBool; safecall;
    function Get_Visible: WordBool; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
  public
    { Public declarations }
    procedure Initialize; override;
  end;

implementation

uses ComObj, ComServ;

{$R *.DFM}

{ TFormX1 }

procedure TFormX1.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_FormX1Page); }
end;

procedure TFormX1.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IFormX1Events;
end;

procedure TFormX1.Initialize;
begin
  inherited Initialize;
  OnActivate := ActivateEvent;
  OnClick := ClickEvent;
  OnCreate := CreateEvent;
  OnDblClick := DblClickEvent;
  OnDeactivate := DeactivateEvent;
  OnDestroy := DestroyEvent;
  OnKeyPress := KeyPressEvent;
  OnPaint := PaintEvent;
end;

function TFormX1.Get_Active: WordBool;
begin
  Result := Active;
end;

function TFormX1.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TFormX1.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TFormX1.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TFormX1.Get_BiDiMode: TxBiDiMode;
begin
  Result := Ord(BiDiMode);
end;

function TFormX1.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TFormX1.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TFormX1.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TFormX1.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TFormX1.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TFormX1.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TFormX1.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TFormX1.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TFormX1.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TFormX1.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TFormX1.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TFormX1.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TFormX1.Get_Visible: WordBool;
begin
  Result := Visible;
end;

procedure TFormX1._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TFormX1.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TFormX1.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TFormX1.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TFormX1.Set_BiDiMode(Value: TxBiDiMode);
begin
  BiDiMode := TBiDiMode(Value);
end;

procedure TFormX1.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TFormX1.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TFormX1.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TFormX1.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TFormX1.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TFormX1.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TFormX1.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TFormX1.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TFormX1.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TFormX1.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TFormX1.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TFormX1.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TFormX1.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TFormX1.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TFormX1.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TFormX1.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TFormX1.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TFormX1.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TFormX1.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TFormX1.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TFormX1.PaintEvent(Sender: TObject);
begin
  Canvas.Brush.Color := clBlue;
  Canvas.Rectangle (20, 20,
    ClientWidth - 20, ClientHeight - 20);
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TFormX1.FormPaint(Sender: TObject);
begin
  Canvas.Brush.Color := clYellow;
  Canvas.Ellipse(0, 0, Width, Height);
end;

procedure TFormX1.PaintBox1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  PaintBox1.Canvas.Ellipse (X-10, Y-10, X+10, Y+10);
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TFormX1,
    Class_FormX1,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.
