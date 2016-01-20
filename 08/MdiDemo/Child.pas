unit Child;

interface

uses Windows, Classes, Graphics, Forms, Controls, StdCtrls, Dialogs;

type
  TChildForm = class(TForm)
    Memo1: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Memo1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    fModified: Boolean;
    procedure SetModified(const Value: Boolean);
  public
    procedure Load (FileName: string);
    procedure Save;
    property Modified: Boolean
      read FModified write SetModified;
  end;

var
  ChildForm: TChildForm;

implementation

{$R *.DFM}

procedure TChildForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TChildForm.Memo1Change(Sender: TObject);
begin
  fModified := True;
end;

procedure TChildForm.FormCreate(Sender: TObject);
begin
  fModified := False;
end;

procedure TChildForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := not fModified or (MessageDlg ('Close without saving?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes);
end;

procedure TChildForm.Load (FileName: string);
begin
  Memo1.Lines.LoadFromFile (FileName);
  Caption := FileName;
  fModified := False;
end;

procedure TChildForm.Save;
begin
  Memo1.Lines.SaveToFile (Caption);
  fModified := False;
end;

procedure TChildForm.SetModified(const Value: Boolean);
begin
  FModified := Value;
end;

end.

