unit PeSound;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DesignIntf, DesignEditors;

type
  TSoundProperty = class (TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
    procedure Edit; override;
  end;

procedure Register;

implementation

uses
  MdSounB, // component unit
  PeFSound; // sound editor form

function TSoundProperty.GetAttributes:
  TPropertyAttributes;
begin
  // allow direct editing and multiple selection
  Result := [paDialog, paMultiSelect, paValueList, paSortList];
end;

procedure TSoundProperty.GetValues(Proc: TGetStrProc);
begin
  // provide a list of system sounds
  Proc ('Maximize');
  Proc ('Minimize');
  Proc ('MenuCommand');
  Proc ('MenuPopup');
  Proc ('RestoreDown');
  Proc ('RestoreUp');
  Proc ('SystemAsterisk');
  Proc ('SystemDefault');
  Proc ('SystemExclamation');
  Proc ('SystemExit');
  Proc ('SystemHand');
  Proc ('SystemQuestion');
  Proc ('SystemStart');
  Proc ('AppGPFault');
end;

procedure TSoundProperty.Edit;
begin
  SoundForm := TSoundForm.Create (Application);
  try
    SoundForm.ComboBox1.Text := GetValue;
    // show the dialog box
    if SoundForm.ShowModal = mrOK then
      SetValue (SoundForm.ComboBox1.Text);
  finally
    SoundForm.Free;
  end;
end;

procedure Register;
begin
  RegisterPropertyEditor (TypeInfo(string),
    TMdSoundButton, 'SoundUp', TSoundProperty);
  RegisterPropertyEditor (TypeInfo(string),
    TMdSoundButton, 'SoundDown', TSoundProperty);
end;

end.
