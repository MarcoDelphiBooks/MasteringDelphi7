unit FieldLookupF;

interface

uses
  SysUtils, Windows, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, Mask, ExtCtrls;

type
  TFormFieldLookup = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    Panel3: TPanel;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FormFieldLookup: TFormFieldLookup;

implementation

uses FLookupDm;

{$R *.dfm}

end.
