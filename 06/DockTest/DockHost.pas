unit DockHost;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TForm2 = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDockDrop(Sender: TObject; Source: TDragDockObject; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses DockForm;

{$R *.DFM}

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DockClientCount > 0 then
    DockClients [0].ManualDock (Form1.Panel1);
end;

procedure TForm2.FormDockDrop(Sender: TObject; Source: TDragDockObject; X,
  Y: Integer);
begin
  Show;
end;

end.
