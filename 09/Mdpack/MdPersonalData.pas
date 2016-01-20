unit MdPersonalData;

interface

uses
  SysUtils, Classes, Controls, StdCtrls;

type
  TMdPersonalData = class(TComponent)
  private
    FAge: Integer;
    FLastName: string;
    FFirstName: string;
    fLabel: TLabel;
    function GetDescription: string;
    procedure SetAge(const Value: Integer);
    procedure SetFirstName(const Value: string);
    procedure SetLastName(const Value: string);
    procedure SetLabel(const Value: TLabel);
    procedure UpdateLabel;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation);
      override;
  published
    property FirstName: string read FFirstName write SetFirstName;
    property LastName: string read FLastName write SetLastName;
    property Age: Integer read FAge write SetAge;
    property Description: string read GetDescription;
    property OutLabel: TLabel read fLabel write SetLabel;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Md', [TMdPersonalData]);
end;

{ TMdPersonalData }

function TMdPersonalData.GetDescription: string;
begin
  Result := FFirstName + ' ' + FLastName +
    ' (' + IntToStr (fAge) + ')';
end;

procedure TMdPersonalData.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  // remove reference when external component is destroyed
  if (AComponent = fLabel) and (Operation = opRemove) then
    fLabel := nil;
end;

procedure TMdPersonalData.SetAge(const Value: Integer);
begin
  if FAge <> Value then
  begin
    FAge := Value;
    UpdateLabel;
  end;
end;

procedure TMdPersonalData.SetFirstName(const Value: string);
begin
  if FFirstName <> Value then
  begin
    FFirstName := Value;
    UpdateLabel;
  end;
end;

procedure TMdPersonalData.SetLabel(const Value: TLabel);
begin
  if fLabel <> Value then
  begin
    fLabel := Value;
    if fLabel <> nil then
    begin
      UpdateLabel;
      fLabel.FreeNotification (Self);
    end;
  end;
end;

procedure TMdPersonalData.SetLastName(const Value: string);
begin
  if FLastName <> Value then
  begin
    FLastName := Value;
    UpdateLabel;
  end;
end;

procedure TMdPersonalData.UpdateLabel;
begin
  if Assigned (fLabel) then
    fLabel.Caption := Description;
end;

end.
 