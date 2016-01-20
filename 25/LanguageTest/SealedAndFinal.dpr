program SealedAndFinal;

uses
  System.Windows.Forms,
  Borland.Delphi.SysUtils;

var
  aForm: Form;

type
  TBase = class
    procedure A; virtual;
  end;

  TDeriv1 = class (TBase)
    procedure A; override; {final;}
  end {sealed};

  // uncomment "sealed" and you'll get the error:
  // "cannot extend sealed class TDeriv1"

  // uncomment "final" and you'll get the error:
  // "cannot override a final method"

  TDeriv2 = class (TDeriv1)
    procedure A; override;
  end;


{ TBase }

procedure TBase.A;
begin

end;

{ TDeriv2 }

procedure TDeriv2.A;
begin
  inherited;

end;

{ TDeriv1 }

procedure TDeriv1.A;
begin
  inherited;

end;

begin
  aForm := Form.Create;
  aForm.Text := 'Hello, Delphi';
  Application.Run (aForm);
end.

