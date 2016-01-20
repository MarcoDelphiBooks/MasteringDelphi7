unit MdCompEdit;

interface

uses
  DesignIntf, DesignEditors;

type
  TMdListCompEditor = class (TComponentEditor)
    function GetVerbCount: Integer; override;
    function GetVerb(Index: Integer): string; override;
    procedure ExecuteVerb(Index: Integer); override;
    procedure Edit; override;
  end;

procedure Register;

implementation

uses
  SysUtils, Dialogs, StdCtrls, MdListDial;

function TMdListCompEditor.GetVerbCount: Integer;
begin
  Result := 3;
end;

function TMdListCompEditor.GetVerb (Index: Integer): string;
begin
  case Index of
    0: Result := 'MdListDialog (©Cantù)';
    1: Result := '&About this component...';
    2: Result := '&Preview...';
  end;
end;

procedure TMdListCompEditor.ExecuteVerb (Index: Integer);
begin
  case Index of
    0: ; // nothing to do
    1: MessageDlg (
      'This is a simple component editor'#13 +
      'built by Marco Cantù'#13 +
      'for the book "Mastering Delphi"',
      mtInformation, [mbOK], 0);
    2: with Component as TMdListDialog do
      Execute;
  end;
end;

procedure TMdListCompEditor.Edit;
begin
  // produce a beep and show the about box
  Beep;
  ExecuteVerb (0);
end;

procedure Register;
begin
  RegisterComponentEditor (
    TMdListDialog, TMdListCompEditor);
end;

end.
