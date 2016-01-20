unit MdListAct;

interface

uses
  ActnList, Classes, StdCtrls, ExtActns, Controls;

type
  TMdCustomListAction = class (TListControlAction)
  protected
    function TargetList (Target: TObject): TCustomListBox;
    function GetControl(Target: TObject): TCustomListControl;
  public
    procedure UpdateTarget (Target: TObject); override;
  published
    property Caption;
    property Enabled;
    property HelpContext;
    property Hint;
    property ImageIndex;
    property ListControl;
    property ShortCut;
    property SecondaryShortCuts;
    property Visible;
    property OnHint;
  end;

  TMdListCutAction = class (TMdCustomListAction)
  public
    procedure ExecuteTarget(Target: TObject); override;
  end;

  TMdListCopyAction = class (TMdCustomListAction)
  public
    procedure ExecuteTarget(Target: TObject); override;
  end;

  TMdListPasteAction = class (TMdCustomListAction)
  public
    procedure UpdateTarget (Target: TObject); override;
    procedure ExecuteTarget (Target: TObject); override;
  end;

procedure Register;

implementation

uses
  Windows, Clipbrd;

function TMdCustomListAction.GetControl(
  Target: TObject): TCustomListControl;
begin
  Result := Target as TCustomListControl;
end;

function TMdCustomListAction.TargetList (Target: TObject): TCustomListBox;
begin
  Result := GetControl (Target) as TCustomListBox;
end;

procedure TMdCustomListAction.UpdateTarget(Target: TObject);
begin
  Enabled := (TargetList (Target).Items.Count > 0)
    and (TargetList (Target).ItemIndex >= 0);
end;

procedure TMdListCopyAction.ExecuteTarget(Target: TObject);
begin
  with TargetList (Target) do
    Clipboard.AsText := Items [ItemIndex];
end;

procedure TMdListCutAction.ExecuteTarget(Target: TObject);
begin
  with TargetList (Target) do
  begin
    Clipboard.AsText := Items [ItemIndex];
    Items.Delete (ItemIndex);
  end;
end;

procedure TMdListPasteAction.ExecuteTarget(Target: TObject);
begin
  TargetList (Target).Items.Add (Clipboard.AsText);
end;

procedure TMdListPasteAction.UpdateTarget(Target: TObject);
begin
  Enabled := Clipboard.HasFormat (CF_TEXT);
end;

procedure Register;
begin
  RegisterActions ('List',
    [TMdListCutAction, TMdListCopyAction, TMdListPasteAction],
    nil);
end;

end.
