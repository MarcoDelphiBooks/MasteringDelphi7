object Form1: TForm1
  Left = 192
  Top = 107
  Width = 450
  Height = 303
  Caption = 'Rounding'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnClassic: TButton
    Left = 24
    Top = 24
    Width = 105
    Height = 25
    Caption = 'Classic Round'
    TabOrder = 0
    OnClick = btnClassicClick
  end
  object ListBox1: TListBox
    Left = 160
    Top = 24
    Width = 233
    Height = 217
    ItemHeight = 13
    TabOrder = 1
  end
  object btnSimpleRound: TButton
    Left = 24
    Top = 64
    Width = 105
    Height = 25
    Caption = 'Simple Round'
    TabOrder = 2
    OnClick = btnSimpleRoundClick
  end
  object btnTroubles: TButton
    Left = 24
    Top = 112
    Width = 105
    Height = 25
    Caption = 'Troubles'
    TabOrder = 3
    OnClick = btnTroublesClick
  end
end
