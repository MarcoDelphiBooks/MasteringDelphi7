object Form1: TForm1
  Left = 192
  Top = 107
  Width = 696
  Height = 480
  Caption = 'NameValues'
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
  object Label1: TLabel
    Left = 40
    Top = 8
    Width = 76
    Height = 13
    HelpType = htKeyword
    Caption = 'Value List Editor'
  end
  object Label2: TLabel
    Left = 40
    Top = 224
    Width = 55
    Height = 13
    HelpType = htKeyword
    Caption = 'Plain Memo'
  end
  object ValueListEditor1: TValueListEditor
    Left = 40
    Top = 32
    Width = 561
    Height = 169
    Strings.Strings = (
      'one=1'
      'two=2'
      'three=3')
    TabOrder = 0
    OnEditButtonClick = ValueListEditor1EditButtonClick
    OnStringsChange = ValueListEditor1StringsChange
    ColWidths = (
      150
      405)
  end
  object Memo1: TMemo
    Left = 40
    Top = 248
    Width = 561
    Height = 169
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object btnUp: TButton
    Left = 248
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Copy Up'
    TabOrder = 2
    OnClick = btnUpClick
  end
  object btnDown: TButton
    Left = 336
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Copy Down'
    TabOrder = 3
    OnClick = btnDownClick
  end
end
