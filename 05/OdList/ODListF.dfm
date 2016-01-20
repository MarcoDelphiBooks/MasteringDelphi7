object ODListForm: TODListForm
  Left = 242
  Top = 121
  Width = 423
  Height = 442
  Caption = 'Owner-draw Listbox'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ListBox1: TListBox
    Left = 0
    Top = 0
    Width = 415
    Height = 415
    Style = lbOwnerDrawFixed
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -32
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ItemHeight = 16
    ParentFont = False
    Sorted = True
    TabOrder = 0
    OnDblClick = ListBox1DblClick
    OnDrawItem = ListBox1DrawItem
  end
  object ColorDialog1: TColorDialog
    Ctl3D = True
    Left = 72
    Top = 48
  end
end
