unit LCliForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ListServ_TLB;

type
  TListCliForm = class(TForm)
    btnFont: TButton;
    FontDialog1: TFontDialog;
    btnMemList: TButton;
    EditItem: TEdit;
    btnMemoTo: TButton;
    Memo1: TMemo;
    btnAdd: TButton;
    btnServer: TButton;
    procedure btnFontClick(Sender: TObject);
    procedure btnMemListClick(Sender: TObject);
    procedure btnMemoToClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnServerClick(Sender: TObject);
  private
    fInternalListServ: IListServer;
    function GetListSrv: IListServer;
  public
    property ListSrv: IListServer
      read GetListSrv;
  end;

var
  ListCliForm: TListCliForm;

implementation

{$R *.DFM}

uses
  ActiveX, AxCtrls, StdVCL;

procedure TListCliForm.btnFontClick(Sender: TObject);
var
  NewFont: IFontDisp;
begin
  // select a font and apply it
  if FontDialog1.Execute then
  begin
    GetOleFont (FontDialog1.Font, NewFont);
    ListSrv.Font := NewFont;
  end;
end;

procedure TListCliForm.btnMemListClick(Sender: TObject);
var
  TempIStrs: IStrings;
  List: TStrings;
  I: Integer;
begin
  // set a list of strings...
  List := TStringList.Create;
  try
    for I := 1 to 10 do
      List.Add ('Item ' + IntToStr (I));
    GetOleStrings (List, TempIStrs);
    ListSrv.Items := TempIStrs;
  finally
    List.Free;
  end;
end;

procedure TListCliForm.btnMemoToClick(Sender: TObject);
var
  TempIStrs: IStrings;
begin
  GetOleStrings (Memo1.Lines, TempIStrs);
  ListSrv.Items := TempIStrs;
end;

procedure TListCliForm.btnAddClick(Sender: TObject);
var
  TempIStrs: IStrings;
  List: TStrings;
begin
  // create a temporary list of strings
  List := TStringList.Create;
  try
    // get items from server
    TempIStrs := ListSrv.Items;
    // add new item
    TempIStrs.Add (EditItem.Text);
    // make local copy
    SetOleStrings (List, TempIStrs);
    // copy back to interface
    GetOleStrings (List, TempIStrs);
    // send to server
    ListSrv.Items := TempIStrs;
  finally
    List.Free;
  end;
end;

procedure TListCliForm.btnServerClick(Sender: TObject);
var
  TempIStrs: IStrings;
begin
  // get the interface and move strings to memo
  TempIStrs := ListSrv.Items;
  SetOleStrings (Memo1.Lines, TempIStrs);
end;

function TListCliForm.GetListSrv: IListServer;
begin
  // eventually create the server
  if not Assigned (fInternalListServ) then
    fInternalListServ := CoCoListServ.Create;
  Result := fInternalListServ;
end;

end.
