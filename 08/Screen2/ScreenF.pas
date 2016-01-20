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
  protected
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
  public
    procedure ActiveFormChange (Sender: TObject);
    procedure FillFormsList;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

uses
  SecondF;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FillFormsList;
  // set the secondary form's counter to 0
  nForms := 0;
  // activate an event handler of the screen object
  Screen.OnActiveFormChange := ActiveFormChange;
end;

procedure TMainForm.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and Showing
      and (AComponent is TForm) then
    FillFormsList;
end;

procedure TMainForm.FillFormsList;
var
  I: Integer;
begin
  if assigned (FormsListBox) then
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

procedure TMainForm.ActiveFormChange (Sender: TObject);
begin
  FillFormsList;
end;

procedure TMainForm.NewButtonClick(Sender: TObject);
begin
  // create a new form, set its caption, and run it.
  with TSecondForm.Create(Application) do begin
    Inc (nForms);
    Caption := 'Second ' + IntToStr (nForms);
    Show;
  end;
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
