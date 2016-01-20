unit TabForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Frame2u, Frame3u, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Tab: TTabControl;
    procedure TabChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ShowFrame (FrameName: string);
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

type
  TFrameClass = class of TFrame;

procedure TForm1.ShowFrame(FrameName: string);
var
  Frame: TFrame;
  FrameClass: TFrameClass;
begin
  Frame := FindComponent (FrameName + '1') as TFrame;
  if not Assigned (Frame) then
  begin
    FrameClass := TFrameClass (FindClass ('T' + FrameName));
    Frame := FrameClass.Create (Self);
    Frame.Parent := Tab;
    Frame.Visible := True;
    Frame.Name := FrameName + '1';
  end;
  Frame.BringToFront;
end;

procedure TForm1.TabChange(Sender: TObject);
begin
  ShowFrame (Tab.Tabs [Tab.TabIndex]);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ShowFrame (Tab.Tabs [Tab.TabIndex]);
end;

end.
 