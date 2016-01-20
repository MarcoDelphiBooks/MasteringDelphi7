unit ServerController;
{PUBDIST}

interface

uses
  Classes,
  IWScrollDataModule,
  IWServerControllerBase, IWAppForm, IWApplication,
  SysUtils;

type
  TIWServerController = class(TIWServerControllerBase)
    procedure IWServerControllerBaseNewSession(ASession: TIWApplication;
      var VMainForm: TIWAppForm);
  private
  public
  end;

  // This is a class which you can add variables to that are specific to the user. Add variables
  // to this class instead of creating global variables. This object can references by using:
  //   UserSession
  // So if a variable named UserName of type string is added, it can be referenced by using:
  //   UserSession.UserName
  // Such variables are similar to globals in a normal application, however these variables are
  // specific to each user.
  //
  // See the IntraWeb Manual for more details.
  TUserSession = class(TComponent)
  public
    DataModule1: TDataModule1;
    //
    constructor Create(AOwner: TComponent); override;
  end;

// Procs
  function UserSession: TUserSession;

implementation
{$R *.dfm}

uses
  IWInit;

function UserSession: TUserSession;
begin
  Result := TUserSession(RWebApplication.Data);
end;

{ TUserSession }

constructor TUserSession.Create(AOwner: TComponent);
begin
  inherited;
  Datamodule1 := TDatamodule1.Create(AOwner);
end;

procedure TIWServerController.IWServerControllerBaseNewSession(
  ASession: TIWApplication; var VMainForm: TIWAppForm);
begin
  ASession.Data := TUserSession.Create(ASession);
end;

end.
