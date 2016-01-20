unit AppSForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TServerForm = class(TForm)
    lbLog: TListBox;
  private
    { Private declarations }
  public
    procedure Add (strLog: string);
  end;

var
  ServerForm: TServerForm;

implementation

{$R *.DFM}

{ TServerForm }

procedure TServerForm.Add(strLog: string);
begin
  // add item and move to it
  lbLog.ItemIndex := lbLog.Items.Add (strLog);
end;

end.
