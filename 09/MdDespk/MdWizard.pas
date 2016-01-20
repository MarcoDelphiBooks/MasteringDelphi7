unit MdWizard;

interface

uses
  ExptIntf, Windows;

type
  TMdExpert = class (TIExpert)
  public
    function GetStyle: TExpertStyle; override;
    function GetName: string; override;
    function GetAuthor: string; override;
    function GetComment: string; override;
    function GetPage: string; override;
    function GetGlyph: HICON; override;
    function GetState: TExpertState; override;
    function GetIDString: string; override;
    function GetMenuText: string; override;
    procedure Execute; override;
  end;

procedure Register;

implementation

uses
  Dialogs, ToolIntf, SysUtils;

function TMdExpert.GetStyle: TExpertStyle;
begin
  // show up in the Help menu
  Result := esStandard;
end;

function TMdExpert.GetName: String;
begin
  // official name
  Result := 'MDWizard'
end;

function TMdExpert.GetAuthor: string;
begin
  Result := 'Marco Cantù';
end;

function TMdExpert.GetComment: String;
begin
  Result := 'Mastering Delphi Wizard';
end;

function TMdExpert.GetPage: string;
begin
  Result := '';
end;

function TMdExpert.GetGlyph: HICON;
begin
  Result := 0;
end;

function TMdExpert.GetState: TExpertState;
begin
  // always enabled, never checked
  Result := [esEnabled];
end;

function TMdExpert.GetIDString: String;
begin
  // must be unique
  Result := 'MarcoCantu.MDWizard'
end;

function TMdExpert.GetMenuText: String;
begin
  // the text of the menu item
  Result := '&Mastering Delphi Wizard...'
end;

procedure TMdExpert.Execute;
begin
  // the actual code, showing some internal information
  MessageDlg (
    'Mastering Delphi Wizard'#13#13 +

    'Current project: '#13 +
    ToolServices.GetProjectName + #13 +
    '(units: ' + IntToStr (ToolServices.GetUnitCount) +
    ', forms: ' + IntToStr (ToolServices.GetFormCount) + ')'#13#13 +

    'Current file: '#13 +
    ToolServices.GetCurrentFile + #13#13 +

    'Delphi information in the registry is under:'#13 +
    ToolServices.GetBaseRegistryKey,
    mtInformation, [mbOK], 0);
end;

procedure Register;
begin
  RegisterLibraryExpert (TMdExpert.Create);
end;

end.
