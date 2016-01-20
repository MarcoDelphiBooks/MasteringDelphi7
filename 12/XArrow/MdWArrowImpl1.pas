unit MdWArrowImpl1;

interface

uses
  Windows, ActiveX, Classes, Controls, Graphics, Menus, Forms, StdCtrls,
  ComServ, StdVCL, AXCtrls, XArrow_TLB, MdWArrow;

{$WARN SYMBOL_PLATFORM OFF}

type
  TMdWArrowX = class(TActiveXControl, IMdWArrowX)
  private
    { Private declarations }
    FDelphiControl: TMdWArrow;
    FEvents: IMdWArrowXEvents;
    procedure ArrowDblClickEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    procedure InitializeControl; override;
    function Get_ArrowHeight: Integer; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_Direction: TxMdWArrowDir; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Filled: WordBool; safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_ArrowHeight(Value: Integer); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_Direction(Value: TxMdWArrowDir); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Filled(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_FillColor: Integer; safecall;
    procedure Set_FillColor(Value: Integer); safecall;
    function Get_PenColor: Integer; safecall;
    procedure Set_PenColor(Value: Integer); safecall;
  end;

implementation

uses ComObj, XAPPage;

{ TMdWArrowX }

procedure TMdWArrowX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  DefinePropertyPage(Class_PropertyPage1);
end;

procedure TMdWArrowX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IMdWArrowXEvents;
end;

procedure TMdWArrowX.InitializeControl;
begin
  FDelphiControl := Control as TMdWArrow;
  FDelphiControl.OnArrowDblClick := ArrowDblClickEvent;
  FDelphiControl.OnClick := ClickEvent;
end;

function TMdWArrowX.Get_ArrowHeight: Integer;
begin
  Result := FDelphiControl.ArrowHeight;
end;

function TMdWArrowX.Get_Cursor: Smallint;
begin
  Result := Smallint(FDelphiControl.Cursor);
end;

function TMdWArrowX.Get_Direction: TxMdWArrowDir;
begin
  Result := Ord(FDelphiControl.Direction);
end;

function TMdWArrowX.Get_DoubleBuffered: WordBool;
begin
  Result := FDelphiControl.DoubleBuffered;
end;

function TMdWArrowX.Get_Enabled: WordBool;
begin
  Result := FDelphiControl.Enabled;
end;

function TMdWArrowX.Get_Filled: WordBool;
begin
  Result := FDelphiControl.Filled;
end;

function TMdWArrowX.Get_Visible: WordBool;
begin
  Result := FDelphiControl.Visible;
end;

procedure TMdWArrowX.ArrowDblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnArrowDblClick;
end;

procedure TMdWArrowX.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TMdWArrowX.Set_ArrowHeight(Value: Integer);
begin
  FDelphiControl.ArrowHeight := Value;
end;

procedure TMdWArrowX.Set_Cursor(Value: Smallint);
begin
  FDelphiControl.Cursor := TCursor(Value);
end;

procedure TMdWArrowX.Set_Direction(Value: TxMdWArrowDir);
begin
  FDelphiControl.Direction := TMdWArrowDir(Value);
end;

procedure TMdWArrowX.Set_DoubleBuffered(Value: WordBool);
begin
  FDelphiControl.DoubleBuffered := Value;
end;

procedure TMdWArrowX.Set_Enabled(Value: WordBool);
begin
  FDelphiControl.Enabled := Value;
end;

procedure TMdWArrowX.Set_Filled(Value: WordBool);
begin
  FDelphiControl.Filled := Value;
end;

procedure TMdWArrowX.Set_Visible(Value: WordBool);
begin
  FDelphiControl.Visible := Value;
end;

function TMdWArrowX.Get_FillColor: Integer;
begin
  Result := ColorToRGB (FDelphiControl.Brush.Color);
end;

procedure TMdWArrowX.Set_FillColor(Value: Integer);
begin
  FDelphiControl.Brush.Color := Value;
end;

function TMdWArrowX.Get_PenColor: Integer;
begin
  Result := ColorToRGB (FDelphiControl.Pen.Color);
end;

procedure TMdWArrowX.Set_PenColor(Value: Integer);
begin
  FDelphiControl.Pen.Color := Value;
end;

initialization
  TActiveXControlFactory.Create(
    ComServer,
    TMdWArrowX,
    TMdWArrow,
    Class_MdWArrowX,
    1,
    '',
    0,
    tmApartment);
end.
