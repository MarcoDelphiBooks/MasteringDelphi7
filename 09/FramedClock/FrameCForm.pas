unit FrameCForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MdClockFrame;

type
  TForm1 = class(TForm)
    MdFramedClock1: TMdFramedClock;
    MdFramedClock2: TMdFramedClock;
    procedure MdFramedClock1Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.MdFramedClock1Timer1Timer(Sender: TObject);
begin
  MdFramedClock1.Timer1Timer(Sender);
  Caption := TimeToStr (now);
end;

end.
