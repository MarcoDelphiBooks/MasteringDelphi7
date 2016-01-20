unit CRefForm;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

type
  // class reference type (redeclaration)
  TControlClass = class of TControl;

  TForm1 = class(TForm)
    Panel1: TPanel;
    RbtnRadio: TRadioButton;
    RbtnButton: TRadioButton;
    RbtnEdit: TRadioButton;
    procedure RbtnRadioClick(Sender: TObject);
    procedure RbtnButtonClick(Sender: TObject);
    procedure RbtnEditClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    ClassRef: TControlClass;
    Counter: Integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.RbtnRadioClick(Sender: TObject);
begin
  ClassRef := TRadioButton;
end;

procedure TForm1.RbtnButtonClick(Sender: TObject);
begin
  ClassRef := TButton;
end;

procedure TForm1.RbtnEditClick(Sender: TObject);
begin
  ClassRef := TEdit;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ClassRef := TRadioButton;
end;

procedure TForm1.FormMouseDown(
  Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  NewCtrl: TControl;
  MyName: String;
begin
  // create the control
  NewCtrl := ClassRef.Create (Self);
  // hide it temporarily, to avoid flickering
  NewCtrl.Visible := False;
  // set parent and position
  NewCtrl.Parent := Self;
  NewCtrl.Left := X;
  NewCtrl.Top := Y;
  // compute the unique name (and caption)
  Inc (Counter);
  MyName := ClassRef.ClassName + IntToStr (Counter);
  Delete (MyName, 1, 1);
  NewCtrl.Name := MyName;
  // now show it
  NewCtrl.Visible := True;
end;


end.
