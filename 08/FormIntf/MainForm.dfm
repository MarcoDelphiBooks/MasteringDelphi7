object FormMain: TFormMain
  Left = 191
  Top = 107
  Width = 405
  Height = 139
  Caption = 'Form Intf'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnLoad: TButton
    Left = 40
    Top = 32
    Width = 75
    Height = 25
    Caption = '&Load'
    TabOrder = 0
    OnClick = btnLoadClick
  end
  object btnSave: TButton
    Left = 136
    Top = 32
    Width = 75
    Height = 25
    Caption = '&Save'
    TabOrder = 1
    OnClick = btnSaveClick
  end
  object btnShow: TButton
    Left = 232
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Show &All'
    TabOrder = 2
    OnClick = btnShowClick
  end
end
