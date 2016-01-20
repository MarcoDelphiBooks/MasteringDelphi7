object Form1: TForm1
  Left = 195
  Top = 105
  Width = 216
  Height = 146
  Caption = 'WinVersion'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnVersion: TButton
    Left = 32
    Top = 24
    Width = 129
    Height = 25
    Caption = 'Windows version'
    TabOrder = 0
    OnClick = btnVersionClick
  end
  object btnPlatform: TButton
    Left = 32
    Top = 64
    Width = 129
    Height = 25
    Caption = 'Platform'
    TabOrder = 1
    OnClick = btnPlatformClick
  end
end
