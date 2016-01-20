object Form1: TForm1
  Left = 205
  Top = 115
  Width = 344
  Height = 218
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
  object btnEqual: TButton
    Left = 184
    Top = 48
    Width = 113
    Height = 25
    Caption = 'Equal Null, 0'
    TabOrder = 0
    OnClick = btnEqualClick
  end
  object btnCompare: TButton
    Left = 184
    Top = 80
    Width = 113
    Height = 25
    Caption = 'Compare Null, 5'
    TabOrder = 1
    OnClick = btnCompareClick
  end
  object radRules: TRadioGroup
    Left = 24
    Top = 40
    Width = 137
    Height = 105
    Caption = 'Comparison Rules'
    ItemIndex = 0
    Items.Strings = (
      'Loose'
      'Strict'
      'Error')
    TabOrder = 2
    OnClick = radRulesClick
  end
  object btnCompare2: TButton
    Left = 184
    Top = 112
    Width = 113
    Height = 25
    Caption = 'Compare Null, -5'
    TabOrder = 3
    OnClick = btnCompare2Click
  end
end
