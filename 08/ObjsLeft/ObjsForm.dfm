object Form1: TForm1
  Left = 227
  Top = 122
  Width = 331
  Height = 191
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblCount: TLabel
    Left = 192
    Top = 48
    Width = 28
    Height = 13
    Caption = 'Count'
  end
  object btnCount: TButton
    Left = 88
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Count'
    TabOrder = 0
    OnClick = btnCountClick
  end
  object btnLeak: TButton
    Left = 88
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Leak'
    TabOrder = 1
    OnClick = btnLeakClick
  end
end
