unit CreateF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    ListBox2: TListBox;
  public
    constructor Create (AOwner: TComponent); override;
    procedure AfterConstruction; override;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  ListBox1.Items.Add ('OnCreate');

  ListBox2 := TListBox.Create (Self);
  ListBox2.Parent := Self;
  ListBox2.Align := alClient;
  ListBox2.Items.Add ('A first item');
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  ListBox1.Items.Add ('OnShow');
end;

constructor TForm1.Create(AOwner: TComponent);
begin
  inherited Create (AOwner);

  ListBox1.Items.Add ('After inherited create');
  if Assigned (ListBox2) then
    ListBox2.Items.Add ('A second item');
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  ListBox1.Items.Add ('OnActivate');
end;

procedure TForm1.AfterConstruction;
begin
  inherited AfterConstruction;
  ListBox1.Items.Add ('After inherited AfterConstruction');
end;

end.
