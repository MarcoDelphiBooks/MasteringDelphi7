object Form1: TForm1
  Left = 270
  Top = 204
  Width = 488
  Height = 319
  HorzScrollBar.Range = 372
  VertScrollBar.Range = 41
  ActiveControl = lbFiles
  AutoScroll = False
  Caption = 'FilesList'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  DesignSize = (
    480
    292)
  PixelsPerInch = 96
  TextHeight = 13
  object lbFiles: TListBox
    Left = 8
    Top = 56
    Width = 468
    Height = 218
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 0
  end
  object btnSource: TButton
    Left = 120
    Top = 16
    Width = 129
    Height = 25
    Caption = 'Find Source Files'
    TabOrder = 1
    OnClick = btnSourceClick
  end
  object cbRecurse: TCheckBox
    Left = 272
    Top = 16
    Width = 100
    Height = 25
    Caption = 'Recurse'
    Checked = True
    State = cbChecked
    TabOrder = 2
  end
end
