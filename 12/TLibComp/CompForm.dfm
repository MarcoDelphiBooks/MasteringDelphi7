object Form1: TForm1
  Left = 493
  Top = 122
  Width = 338
  Height = 144
  Caption = 'TLibComp'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 72
    Top = 40
    Width = 75
    Height = 25
    Caption = 'New Color'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 160
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Increase'
    TabOrder = 1
    OnClick = Button2Click
  end
  object FirstServer1: TFirstServer
    AutoConnect = False
    ConnectKind = ckRunningInstance
    Left = 32
    Top = 16
  end
end
