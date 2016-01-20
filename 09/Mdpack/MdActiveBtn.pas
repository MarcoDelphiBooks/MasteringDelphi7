unit MdActiveBtn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TMdActiveButton = class(TButton)
  protected
    procedure MouseEnter (var Msg: TMessage);
      message cm_mouseEnter;
    procedure MouseLeave (var Msg: TMessage);
      message cm_mouseLeave;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Md', [TMdActiveButton]);
end;

{ TMdActiveButton }

procedure TMdActiveButton.MouseEnter(var Msg: TMessage);
begin
  Font.Style := Font.Style + [fsBold];
end;

procedure TMdActiveButton.MouseLeave(var Msg: TMessage);
begin
  Font.Style := Font.Style - [fsBold];
end;

end.
