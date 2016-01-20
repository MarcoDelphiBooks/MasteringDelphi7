object Form1: TForm1
  Left = 192
  Top = 107
  Width = 350
  Height = 210
  Caption = 'LibComp'
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
    Left = 56
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 40
    Top = 32
    Width = 105
    Height = 21
    TabOrder = 1
    Text = 'my name'
  end
  object ListBox1: TListBox
    Left = 176
    Top = 32
    Width = 121
    Height = 129
    ItemHeight = 13
    Items.Strings = (
      'marco'
      'john'
      'helen')
    TabOrder = 2
  end
end
