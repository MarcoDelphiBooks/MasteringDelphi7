unit MdIntfTest;

interface

uses
  Windows, Messages, SysUtils, Classes, StdCtrls;

type
  IMdViewer = interface
    ['{9766860D-8E4A-4254-9843-59B98FEE6C54}']
    procedure View (const str: string);
  end;

  TMdIntfTest = class(TComponent)
  private
    FViewer: IMdViewer;
    FText: string;
    procedure SetViewer(const Value: IMdViewer);
    procedure SetText(const Value: string);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation);      override;
  published
    property Viewer: IMdViewer read FViewer write SetViewer;
    property Text: string read FText write SetText;
  end;

  TViewerLabel = class (TLabel, IMdViewer)
  public
    procedure View(const str: String);
    function Component: TComponent;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Md', [TMdIntfTest, TViewerLabel]);
end;

{ TMdIntfTest }

procedure TMdIntfTest.Notification(AComponent: TComponent;
  Operation: TOperation);
var
  intf: IMdViewer;
begin
  inherited;
  if (Operation = opRemove) and
    (Supports (AComponent, IMdViewer, intf)) and (intf = fViewer) then
  begin
    fViewer := nil;
  end;
end;

procedure TMdIntfTest.SetText(const Value: string);
begin
  FText := Value;
  if Assigned (fViewer) then
    fViewer.View(fText);
end;

procedure TMdIntfTest.SetViewer(const Value: IMdViewer);
var
  iComp: IInterfaceComponentReference;
begin
  if FViewer <> Value then
  begin
    FViewer := Value;
    FViewer.View(fText);
    if Supports (FViewer, IInterfaceComponentReference, iComp) then
      iComp.GetComponent.FreeNotification(self);
  end;
end;

{ TViewerLabel }

function TViewerLabel.Component: TComponent;
begin
  Result := self;
end;

procedure TViewerLabel.View(const str: String);
begin
  Caption := str;
end;

end.
