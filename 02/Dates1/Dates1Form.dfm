object Form1: TForm1
  Left = 192
  Top = 107
  Width = 291
  Height = 186
  Caption = 'Dates1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 72
    Top = 88
    Width = 25
    Height = 13
    Caption = 'Year:'
  end
  object Button1: TButton
    Left = 72
    Top = 48
    Width = 130
    Height = 25
    Caption = 'Leap Year?'
    TabOrder = 0
    OnClick = Button1Click
  end
  object EditYear: TEdit
    Left = 104
    Top = 84
    Width = 98
    Height = 21
    TabOrder = 1
    Text = '2000'
  end
end
