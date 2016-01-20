unit ListObj;

interface

uses
  ComObj, ActiveX, StdVCL, Classes, Graphics, ListServ_TLB;

type
  TListServer = class(TAutoObject, IListServer)
  private
    fItems: TStrings;
    fFont: TFont;
  protected
    function Get_Font: IFontDisp; safecall;
    function Get_Items: IStrings; safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_Items(const Value: IStrings); safecall;
  public
    destructor Destroy; override;
    procedure Initialize; override;
  end;

implementation

uses
  ComServ, ListForm, AxCtrls;

procedure TListServer.Initialize;
begin
  inherited Initialize;
  fItems := TStringList.Create;
  fFont := TFont.Create;
end;

destructor TListServer.Destroy;
begin
  fItems.Free;
  fFont.Free;
  inherited Destroy;
end;

function TListServer.Get_Font: IFontDisp;
begin
  // get the form of the form
  fFont.Assign (ListServForm.Font);
  // convert it
  GetOleFont (fFont, Result);
end;

procedure TListServer.Set_Font(const Value: IFontDisp);
begin
  // convert the font passed as parameter
  SetOleFont (fFont, Value);
  // apply it to the form
  ListServForm.Font.Assign (fFont);
  // force a refresh of the list box
  ListServForm.Listbox1.Invalidate;
end;

function TListServer.Get_Items: IStrings;
begin
  // get the listbox items, converting them
  GetOleStrings (ListServForm.Listbox1.Items, Result);
end;

procedure TListServer.Set_Items(const Value: IStrings);
begin
  // convert the strings received as parameter
  SetOleStrings (ListServForm.Listbox1.Items, Value);
end;

initialization
  TAutoObjectFactory.Create(ComServer, TListServer,
    CLASS_CoListServ, ciMultiInstance, tmSingle);
end.
