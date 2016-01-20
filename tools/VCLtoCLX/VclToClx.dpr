program VclToClx;

(**************************************************************

      VCl to CLX conversion program 
      Instructions on Appendix A, Mastering Delphi 7

      Released under LGPL license, distribute but keep this
      copyright notice. Please forward bug fixes and modifications
      to the author

      Copyright 1998-2003 Marco Cantù, www.marcocantu.com

**************************************************************)


uses
  QForms,
  VclToClxForm in 'VclToClxForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
