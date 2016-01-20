unit ScreenF;

interface

uses
  SysUtils, Windows, Messages, Classes,
  Graphics, Controls, Forms, Dialogs, StdCtrls;

type
  TMainForm = class(TForm)
    FormsLabel: TLabel;
    FormsListBox: TListBox;
    NewButton: TButton;
    ActiveLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure NewButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject;
      var Action: TCloseAction);
    procedure FormsListBoxClick(Sender: TObject);
  private
    nForms: Integer;
  public
    procedure FillFormsList (Sender: TObject);
    // handler of a user defined Windows message
    procedure ChildClosed (var Message: TMessage);
      message wm_User;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

uses
  SecondF;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FillFormsList (Self);
  // set the secondary form's counter to 0
  nForms := 0;
  // activate an event handler of the screen object
  Screen.OnActiveFormChange := FillFormsList;
end;

procedure TMainForm.FillFormsList (Sender: TObject);
var
  I: Integer;
begin
  // skip code in destruction phase
  if Assigned (FormsListBox) then
  begin
    FormsLabel.Caption := 'Forms: ' + IntToStr (Screen.FormCount);
    FormsListBox.Clear;
    // write class name and form title to the list box
    for I := 0 to Screen.FormCount - 1 do
      FormsListBox.Items.Add (Screen.Forms[I].ClassName +
        ' - ' + Screen.Forms[I].Caption);
    ActiveLabel.Caption := 'Active Form : ' +
      Screen.ActiveForm.Caption;
  end;
end;

procedure TMainForm.ChildClosed (var Message: TMessage);
begin
  // handler of the user message sent by the secondary form
  FillFormsList (Self);
end;

procedure TMainForm.NewButtonClick(Sender: TObject);
var
  NewForm: TSecondForm;
begin
  {create a new form, set its caption, and run it}
  NewForm := TSecondForm.Create (Self);
  Inc (nForms);
  NewForm.Caption := 'Second ' + IntToStr (nForms);
  NewForm.Show;
end;

procedure TMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  // VERY IMPORTANT! disable the event handler to avoid a GPFault
  // Screen.OnActiveFormChange := nil;
end;

procedure TMainForm.FormsListBoxClick(Sender: TObject);
begin
  // activate the form the user has clicked onto
  Screen.Forms [FormsListBox.ItemIndex].BringToFront;
end;

end.
 
