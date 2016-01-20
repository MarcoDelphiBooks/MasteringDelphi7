object Form1: TForm1
  Left = 192
  Top = 107
  Width = 454
  Height = 282
  Caption = 'CMNTest'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 104
    Top = 136
    Width = 273
    Height = 89
  end
  object Label1: TLabel
    Left = 160
    Top = 152
    Width = 51
    Height = 13
    Caption = 'Shortcuts: '
  end
  object Label2: TLabel
    Left = 104
    Top = 24
    Width = 23
    Height = 13
    Caption = '&One:'
    FocusControl = Edit1
  end
  object Label3: TLabel
    Left = 104
    Top = 64
    Width = 21
    Height = 13
    Caption = '&Two'
    FocusControl = Edit2
  end
  object Label4: TLabel
    Left = 104
    Top = 104
    Width = 28
    Height = 13
    Caption = 'Th&ree'
    FocusControl = Edit3
  end
  object Label5: TLabel
    Left = 160
    Top = 184
    Width = 29
    Height = 13
    Caption = 'Focus'
  end
  object Edit1: TEdit
    Left = 160
    Top = 24
    Width = 121
    Height = 21
    Color = clWindow
    TabOrder = 0
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 160
    Top = 64
    Width = 121
    Height = 21
    Color = clWindow
    TabOrder = 1
    Text = 'Edit2'
  end
  object Edit3: TEdit
    Left = 160
    Top = 104
    Width = 121
    Height = 21
    Color = clWindow
    TabOrder = 2
    Text = 'Edit3'
  end
end
