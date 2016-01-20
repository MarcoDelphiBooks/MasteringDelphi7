unit PublisherForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MdComEvents_TLB;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Inform: IMdInform;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

  {$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Inform.Informs (20, Edit1.Text);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Inform := CoMdInform.Create;
end;

end.
