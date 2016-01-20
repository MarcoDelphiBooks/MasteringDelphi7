unit XmlEditForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, xmldom, XMLIntf, msxmldom, XMLDoc, ComCtrls, ToolWin, OleCtrls,
  SHDocVw;

type
  TFormXmlEdit = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    MemoXml: TMemo;
    ToolBar1: TToolBar;
    btnLoad: TToolButton;
    TabSheet5: TTabSheet;
    EditXmlFile: TEdit;
    Label1: TLabel;
    btnSave: TToolButton;
    xmlBar: TStatusBar;
    Label4: TLabel;
    EditFolder: TEdit;
    Label5: TLabel;
    EditBaseFile: TEdit;
    btnUpdate: TButton;
    cbAutoUpdate: TCheckBox;
    TabSheet7: TTabSheet;
    XmlBrowser: TWebBrowser;
    XMLDoc: TXMLDocument;
    ToolButton1: TToolButton;
    procedure btnLoadClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure MemoXmlChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure EditFolderOrFileChange(Sender: TObject);
    procedure TabSheet7Enter(Sender: TObject);
    procedure MemoXmlKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MemoXmlMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormXmlEdit: TFormXmlEdit;

implementation

{$R *.DFM}

procedure TFormXmlEdit.btnLoadClick(Sender: TObject);
begin
  // try to load the file
  MemoXml.Lines.LoadFromFile (EditXmlFile.Text);
end;

procedure TFormXmlEdit.btnSaveClick(Sender: TObject);
begin
  // save the file
  MemoXml.Lines.SaveToFile (EditXmlFile.Text);
end;

procedure TFormXmlEdit.MemoXmlChange(Sender: TObject);
var
  eParse: IDOMParseError;
begin
  XmlDoc.Active := True;
  xmlBar.Panels[1].Text := 'OK';
  xmlBar.Panels[2].Text := '';
  (XmlDoc as IXMLDocumentAccess).DOMPersist.loadxml(MemoXml.Text);
  eParse := (XmlDoc.DOMDocument as IDOMParseError);
  if eParse.errorCode <> 0 then
    with eParse do
    begin
      xmlBar.Panels[1].Text := 'Error in: ' + IntToStr (Line) +
        '.' + IntToStr (LinePos);
      xmlBar.Panels[2].Text := SrcText + ': ' + Reason;
    end;
end;

procedure TFormXmlEdit.FormCreate(Sender: TObject);
begin
  EditFolder.Text := ExtractFilePath (Application.ExeName);
  btnUpdateClick (self);
end;

procedure TFormXmlEdit.btnUpdateClick(Sender: TObject);
begin
  EditXmlFile.Text := EditFolder.Text +
    EditBaseFile.Text + '.xml';
end;

procedure TFormXmlEdit.EditFolderOrFileChange(Sender: TObject);
begin
  if cbAutoUpdate.Checked then
    btnUpdateClick (self);
end;

procedure TFormXmlEdit.TabSheet7Enter(Sender: TObject);
begin
  XmlBrowser.Navigate (EditXmlFile.Text);
end;

procedure TFormXmlEdit.MemoXmlKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  xmlBar.Panels[0].Text :=
    'Pos: ' + IntToStr (MemoXml.CaretPos.Y + 1) +
    '.' + IntToStr (MemoXml.CaretPos.X + 1);
end;

procedure TFormXmlEdit.MemoXmlMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  xmlBar.Panels[0].Text :=
    'Pos: ' + IntToStr (MemoXml.CaretPos.Y + 1) +
    '.' + IntToStr (MemoXml.CaretPos.X + 1);
end;

end.
