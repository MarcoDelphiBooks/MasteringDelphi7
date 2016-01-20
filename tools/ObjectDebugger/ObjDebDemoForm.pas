unit ObjDebDemoForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  CtwObjectDebugger;

procedure TForm1.Button1Click(Sender: TObject);
begin
  // do nothing...
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  TCantObjectDebugger.Create(self); 
end;

end.
