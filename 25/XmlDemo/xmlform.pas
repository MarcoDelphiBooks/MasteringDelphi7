unit xmlform;

interface

uses
  System.Drawing,
  Borland.Delphi.SysUtils,
  System.Windows.Forms,
  System.Xml,
  System.ComponentModel;

type
  TMyForm = class (Form)
  public
    constructor Create;
  protected
    procedure OnButtonClick(Sender: TObject; e: EventArgs);
    procedure OnButtonClick2(Sender: TObject; e: EventArgs);
  private
    MyMemo: TextBox;
    MyButton: Button;
    MyDoc: XmlDocument;
  end;

implementation

constructor TMyForm.Create;
begin
  inherited Create;
  Text := 'XmlDemo';
  Height := 400;

  MyMemo := TextBox.Create;
  MyMemo.Location := Point.Create (10, 50);
  MyMemo.Size := Size.Create (Width - 30, Height - 70);
  MyMemo.Multiline := True;
  Controls.Add (MyMemo);

  MyButton := Button.Create;
  MyButton.Location := Point.Create (
    Width div 2 - MyButton.Width div 2, 2);
  MyButton.Text := 'Load';
  MyButton.add_Click (OnButtonClick);
  MyButton.add_click (OnButtonClick2);
  Controls.Add (MyButton);
end;

procedure TMyForm.OnButtonClick(Sender: TObject; e: EventArgs);
begin
  MyDoc := XmlDocument.Create;
  MyDoc.PreserveWhiteSpace := True;
  MyDoc.Load ('sample.xml');
  MyMemo.Text := MyDoc.InnerXml;
end;

procedure TMyForm.OnButtonClick2(Sender: TObject; e: EventArgs);
begin
  Text := 'nuovo handler';
end;

end.
