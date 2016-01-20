unit RavePrintForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RpDefine, RpRave, StdCtrls, RpRender, RpRenderPDF, RpBase,
  RpSystem, RpFiler, RpRenderHTML;

type
  TFormRave = class(TForm)
    RvProject1: TRvProject;
    btnPrint: TButton;
    RvSystem1: TRvSystem;
    btnPdf: TButton;
    RvNDRWriter1: TRvNDRWriter;
    RvRenderPDF1: TRvRenderPDF;
    RvRenderHTML1: TRvRenderHTML;
    procedure btnPrintClick(Sender: TObject);
    procedure btnPdfClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRave: TFormRave;

implementation

{$R *.dfm}

procedure TFormRave.btnPrintClick(Sender: TObject);
begin
  RvProject1.Engine := nil;
  RvProject1.Execute;
end;

procedure TFormRave.btnPdfClick(Sender: TObject);
begin
  RvSystem1.DefaultDest := rdFile;
  RvSystem1.DoNativeOutput := False;
  RvSystem1.RenderObject := RvRenderPDF1;
  RvSystem1.OutputFileName := 'Simple2.pdf';
  RvSystem1.SystemSetups :=
    RvSystem1.SystemSetups - [ssAllowSetup];
  RvProject1.Engine := RvSystem1;
  RvProject1.Execute;
end;

end.
