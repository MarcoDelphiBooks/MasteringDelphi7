unit SendForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TSenderForm = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    Button2: TButton;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    procedure ShowSender(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SenderForm: TSenderForm;

implementation

{$R *.DFM}

procedure TSenderForm.ShowSender(Sender: TObject);
begin
  Memo1.Lines.Add ('Class Name: ' +
    Sender.ClassName);

  if Sender.ClassParent <> nil then
    Memo1.Lines.Add ('Parent Class: ' +
      Sender.ClassParent.ClassName);

  Memo1.Lines.Add ('Instance Size: ' +
    IntToStr (Sender.InstanceSize));

  // if the object is (exactly) of the TButton type
  if Sender.ClassType = TButton then
    Memo1.Lines.Add ('TButton ClassType');

  // if the object is a given object
  if Sender = Button1 then
    Memo1.Lines.Add ('This is Button1');

  if Sender.InheritsFrom (TButton) then
    Memo1.Lines.Add ('Sender inherits from TButton');

  if Sender is TButton then
    Memo1.Lines.Add ('Sender is a TButton');

  // leave a blank line
  Memo1.Lines.Add ('');
end;

end.
