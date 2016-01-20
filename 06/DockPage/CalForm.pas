unit CalForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls;

type
  TForm3 = class(TForm)
    MonthCalendar1: TMonthCalendar;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses DateUtils;

{$R *.DFM}

procedure TForm3.FormCreate(Sender: TObject);
begin
  MonthCalendar1.Date := Today;
end;

end.
