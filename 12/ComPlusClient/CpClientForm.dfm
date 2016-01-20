object Form1: TForm1
  Left = 192
  Top = 107
  Width = 350
  Height = 212
  Caption = 'ComPlusClient'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 72
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Use Object'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 167
    Top = 57
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object Button2: TButton
    Left = 72
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Keep Calling'
    TabOrder = 2
    OnClick = Button2Click
  end
end
