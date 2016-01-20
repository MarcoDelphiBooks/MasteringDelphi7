object Form1: TForm1
  Left = 209
  Top = 144
  Width = 518
  Height = 319
  Caption = 'Form1'
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
    Left = 192
    Top = 112
    Width = 32
    Height = 13
    Caption = 'Label1'
    FocusControl = Edit1
  end
  object Edit1: TEdit
    Left = 184
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object ListBox1: TListBox
    Left = 288
    Top = 104
    Width = 121
    Height = 97
    ItemHeight = 13
    PopupMenu = PopupMenu1
    TabOrder = 1
  end
  object PopupMenu1: TPopupMenu
    Left = 88
    Top = 136
    object one1: TMenuItem
      Caption = 'one'
    end
    object two1: TMenuItem
      Caption = 'two'
    end
  end
end
