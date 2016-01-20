object Form1: TForm1
  Left = 195
  Top = 108
  Width = 414
  Height = 250
  Caption = 'Euro Conversion'
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
    Left = 8
    Top = 196
    Width = 30
    Height = 13
    Caption = 'Value:'
  end
  object Label2: TLabel
    Left = 214
    Top = 196
    Width = 33
    Height = 13
    Caption = 'Result:'
  end
  object Button1: TButton
    Left = 168
    Top = 8
    Width = 75
    Height = 177
    Caption = 'Convert'
    TabOrder = 0
    OnClick = Button1Click
  end
  object EditValue: TEdit
    Left = 40
    Top = 192
    Width = 145
    Height = 21
    TabOrder = 1
    Text = '120'
  end
  object EditResult: TEdit
    Left = 256
    Top = 192
    Width = 145
    Height = 21
    TabOrder = 2
  end
  object ListTypes: TListBox
    Left = 8
    Top = 8
    Width = 153
    Height = 177
    ItemHeight = 13
    TabOrder = 3
  end
  object ListTypes2: TListBox
    Left = 248
    Top = 5
    Width = 153
    Height = 180
    ItemHeight = 13
    TabOrder = 4
  end
end
