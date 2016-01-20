unit SecondF;

interface

uses
  SysUtils, Windows, Messages, Classes,
  Graphics, Controls, Forms, Dialogs, StdCtrls;

type
  TSecondForm = class(TForm)
    CloseButton: TButton;
    procedure CloseButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SecondForm: TSecondForm;

implementation

{$R *.DFM}

uses
  ScreenF;

procedure TSecondForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TSecondForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  // actually delete the form.
  Action := caFree;
end;

end.

