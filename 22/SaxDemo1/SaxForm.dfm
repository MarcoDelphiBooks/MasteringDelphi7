object Form1: TForm1
  Left = 192
  Top = 107
  Width = 487
  Height = 480
  Caption = 'SaxDemo1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    479
    453)
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 32
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Parse Base'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 144
    Top = 32
    Width = 288
    Height = 385
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Button2: TButton
    Left = 32
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Parse List'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 32
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Parse Titles'
    TabOrder = 3
    OnClick = Button3Click
  end
end
