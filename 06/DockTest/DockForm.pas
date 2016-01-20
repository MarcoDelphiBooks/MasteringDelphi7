unit DockForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus;

type
  TForm1 = class(TForm)
    PopupMenu1: TPopupMenu;
    menuToggleFloating: TMenuItem;
    Panel1: TPanel;
    Memo1: TMemo;
    Panel2: TPanel;
    Button2: TButton;
    Button3: TButton;
    ListBox1: TListBox;
    N1: TMenuItem;
    menuFloatPanel: TMenuItem;
    menuFloatMemo: TMenuItem;
    menuFloatListBox: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Panel1DockDrop(Sender: TObject; Source: TDragDockObject; X,
      Y: Integer);
    procedure ControlStartDock(Sender: TObject;
      var DragObject: TDragDockObject);
    procedure Panel1DockOver(Sender: TObject; Source: TDragDockObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure menuToggleFloatingClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure menuFloatPanelClick(Sender: TObject);
    procedure menuFloatMemoClick(Sender: TObject);
    procedure menuFloatListBoxClick(Sender: TObject);
  private
    DockFileName: string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{uses
  DockHost;}

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
  FileStr: TFileStream;
  i: Integer;
  aRect: TRect;
  aCtrl: TControl;
begin
  // just in case...
  if not Assigned (Panel1.DockManager) then
    raise Exception.Create ('No Dock Manager');
    // or create one!
    // Panel1.DockManager := DefaultDockTreeClass.Create (Panel1);

  Panel1.DockOrientation := doHorizontal;
  // dock memo
  Memo1.Dock(Panel1, Rect (0, 0, 100, 100));
  Panel1.DockManager.InsertControl(Memo1, alTop, Panel1);
  // dock listbox
  ListBox1.Dock(Panel1, Rect (0, 100, 100, 100));
  Panel1.DockManager.InsertControl(ListBox1, alLeft, Panel1);
  // dock panel2
  Panel2.Dock(Panel1, Rect (100, 0, 100, 100));
  Panel1.DockManager.InsertControl(Panel2, alBottom, Panel1);

  // it is very hard to make this work properly!
  // Memo1.FloatingDockSiteClass := TForm2;

  // relaod the settings
  DockFileName := ExtractFilePath (Application.Exename) + 'dock.dck';
  if FileExists (DockFileName) then
  begin
    FileStr := TFileStream.Create (DockFileName, fmOpenRead);
    try
      Panel1.DockManager.LoadFromStream (FileStr);
    finally
      FileStr.Free;
    end;
  end;
  Panel1.DockManager.ResetBounds (True);
  // fix up the floating panels
  for i := Panel1.DockClientCount - 1 downto 0 do
  begin
    // test the status
    // ShowMessage (Panel1.DockClients[i].ClassName);
    // ShowMessage (Panel1.DockClients[i].Parent.ClassName);
    aCtrl := Panel1.DockClients[i];
    Panel1.DockManager.GetControlBounds(aCtrl, aRect);
    {ShowMessage ('Left.Top=' +
      IntToStr (aRect.Left) + '.' +
      IntToStr (aRect.Top) + ' - Right.Bottom=' +
      IntToStr (aRect.Right) + '.' +
      IntToStr (aRect.Bottom));}
    if (aRect.Bottom - aRect.Top <= 0) then
    begin
      aCtrl.ManualFloat (aCtrl.ClientRect);
      Panel1.DockManager.RemoveControl(aCtrl);
    end;
  end;
end;

procedure TForm1.Panel1DockDrop(Sender: TObject; Source: TDragDockObject;
  X, Y: Integer);
begin
  Caption := 'Docked: ' + IntToStr (DockClientCount);
end;

procedure TForm1.ControlStartDock(Sender: TObject;
  var DragObject: TDragDockObject);
begin
  Caption := 'Docking ' + (Sender as TComponent).Name;
end;

procedure TForm1.Panel1DockOver(Sender: TObject; Source: TDragDockObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Caption := 'Docking: ' + Source.Control.Name;
  Accept := True;
end;

procedure TForm1.menuToggleFloatingClick(Sender: TObject);
var
  aCtrl: TControl;
begin
  aCtrl := Sender as TControl;
  // toggle the floating status
  if aCtrl.Floating then
    aCtrl.ManualDock (Panel1, nil, alBottom)
  else
    aCtrl.ManualFloat (Rect (100, 100, 200, 300));
end;

procedure TForm1.FormDestroy(Sender: TObject);
var
  FileStr: TFileStream;
begin
  if Panel1.DockClientCount > 0 then
  begin
    FileStr := TFileStream.Create (DockFileName,
      fmCreate or fmOpenWrite);
    try
      Panel1.DockManager.SaveToStream (FileStr);
    finally
      FileStr.Free;
    end;
  end
  else
    // remove the file
    DeleteFile (DockFileName);
end;

procedure TForm1.menuFloatPanelClick(Sender: TObject);
begin
  Panel2.ManualFloat (Rect (100, 100, 200, 300));
end;

procedure TForm1.menuFloatMemoClick(Sender: TObject);
begin
  Memo1.ManualFloat (Rect (100, 100, 200, 300));
end;

procedure TForm1.menuFloatListBoxClick(Sender: TObject);
begin
  ListBox1.ManualFloat (Rect (100, 100, 200, 300));
end;

end.
