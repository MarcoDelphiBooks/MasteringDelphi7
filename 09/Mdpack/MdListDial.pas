unit MdListDial;

interface

uses
  SysUtils, Windows, Messages, Classes,
  Graphics, Controls, Forms, Dialogs, StdCtrls,
  Buttons;

type
  TMdListDialog = class (TComponent)
  private
    FLines: TStrings;
    FSelected: Integer;
    FTitle: string;
    function GetSelItem: string;
    procedure SetLines (Value: TStrings);
    function GetLines: TStrings;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute: Boolean;
    property SelItem: string
      read GetSelItem;
  published
    property Lines: TStrings
      read GetLines write SetLines;
    property Selected: Integer
      read FSelected write FSelected;
    property Title: string
      read FTitle write FTitle;
  end;

type
  TMdListBoxForm = class(TForm)
    ListBox1: TListBox;
    Button1: TButton;
    Button2: TButton;
    procedure ListBox1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

{$R *.DFM}

procedure Register;

implementation

// component methods

constructor TMdListDialog.Create(AOwner: TComponent);
begin
  inherited Create (AOwner);
  FLines := TStringList.Create;
  FTitle := 'Choose a string';
end;

destructor TMdListDialog.Destroy;
begin
  FLines.Free;
  inherited Destroy;
end;

function TMdListDialog.GetSelItem: string;
begin
  if (Selected >= 0) and (Selected < FLines.Count) then
    Result := FLines [Selected]
  else
    Result := '';
end;

function TMdListDialog.GetLines: TStrings;
begin
  Result := FLines;
end;

procedure TMdListDialog.SetLines (Value: TStrings);
begin
  FLines.Assign (Value);
end;

function TMdListDialog.Execute: Boolean;
var
  ListBoxForm: TMdListBoxForm;
begin
  if FLines.Count = 0 then
    raise EStringListError.Create ('No items in the list');
  ListBoxForm := TMdListBoxForm.Create (nil);
  try
    ListBoxForm.ListBox1.Items := FLines;
    ListBoxForm.ListBox1.ItemIndex := FSelected;
    ListBoxForm.Caption := FTitle;
    if ListBoxForm.ShowModal = mrOk then
    begin
      Result := True;
      Selected := ListBoxForm.ListBox1.ItemIndex;
    end
    else
      Result := False;
  finally
    ListBoxForm.Free;
  end;
end;

// form methods

procedure TMdListBoxForm.ListBox1DblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure Register;
begin
  RegisterComponents('Md', [TMdListDialog]);
end;

end.

