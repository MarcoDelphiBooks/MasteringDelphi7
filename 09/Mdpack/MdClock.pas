unit MdClock;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics,
  Controls, StdCtrls, ExtCtrls;

type
  TMdClock = class (TCustomLabel)
  private
    FTimer: TTimer;
    procedure UpdateClock (Sender: TObject);
  public
    constructor Create (AOwner: TComponent); override;
  published
    property Align;
    property Alignment;
    property Color;
    property Font;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Transparent;
    property Visible;
    property Timer: TTimer read FTimer;
  end;

procedure Register;

implementation

{type
  TMdClockTimer = class (ExtCtrls.TTimer)
  protected
    procedure Timer; override;
  end;}

constructor TMdClock.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);
  // create the internal timer object
  FTimer := TTimer.Create (Self);
  FTimer.Name := 'ClockTimer';
  FTimer.OnTimer := UpdateClock;
  FTimer.Enabled := True;
  FTimer.SetSubComponent (True);
  UpdateClock (self); // update right away
end;

procedure Register;
begin
  RegisterComponents('Md', [TMdClock]);
end;

{ TMdClockTimer }

procedure TMdClock.UpdateClock (Sender: TObject);
begin
  // set the current time as caption
  Caption := TimeToStr (Time);
end;

end.
