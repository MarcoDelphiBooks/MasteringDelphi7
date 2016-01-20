object Form1: TForm1
  Left = 196
  Top = 112
  Width = 492
  Height = 349
  Caption = 'StrDemo'
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
  object EditResemble1: TEdit
    Left = 64
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Cant'#249
  end
  object EditResemble2: TEdit
    Left = 296
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Cantu'
  end
  object ButtonResemble: TButton
    Left = 200
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Resembles?'
    TabOrder = 2
    OnClick = ButtonResembleClick
  end
  object ListBoxMatch: TListBox
    Left = 296
    Top = 88
    Width = 121
    Height = 113
    ItemHeight = 13
    Items.Strings = (
      'one'
      'two'
      'three'
      'four'
      'five'
      'six'
      'seven'
      'eight')
    TabOrder = 3
  end
  object EditMatch: TEdit
    Left = 64
    Top = 128
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'four'
  end
  object ButtonMatches: TButton
    Left = 200
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Matches Text'
    TabOrder = 5
    OnClick = ButtonMatchesClick
  end
  object ButtonIndex: TButton
    Left = 200
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Index Text'
    TabOrder = 6
    OnClick = ButtonIndexClick
  end
  object EditSample: TEdit
    Left = 64
    Top = 232
    Width = 121
    Height = 21
    TabOrder = 7
    Text = 'sample text'
  end
  object ButtonTriplicate: TButton
    Left = 200
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Triplicate'
    TabOrder = 8
    OnClick = ButtonTriplicateClick
  end
  object ButtonReverse: TButton
    Left = 200
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Reverse'
    TabOrder = 9
    OnClick = ButtonReverseClick
  end
  object ButtonRandom: TButton
    Left = 200
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Random'
    TabOrder = 10
    OnClick = ButtonRandomClick
  end
  object btnPos2: TButton
    Left = 320
    Top = 248
    Width = 99
    Height = 25
    Caption = 'Count with PosEx'
    TabOrder = 11
    OnClick = btnPos2Click
  end
  object bntPos1: TButton
    Left = 320
    Top = 216
    Width = 99
    Height = 25
    Caption = 'Count with Pos'
    TabOrder = 12
    OnClick = bntPos1Click
  end
end
