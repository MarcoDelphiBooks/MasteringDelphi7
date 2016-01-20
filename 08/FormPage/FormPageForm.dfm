object Form1: TForm1
  Left = 192
  Top = 107
  Width = 360
  Height = 273
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 352
    Height = 29
    ButtonHeight = 21
    ButtonWidth = 66
    Caption = 'ToolBar1'
    ShowCaptions = True
    TabOrder = 0
    object btnPage: TToolButton
      Left = 0
      Top = 2
      Caption = 'Create Page'
      ImageIndex = 0
      OnClick = btnPageClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 29
    Width = 352
    Height = 217
    Align = alClient
    TabOrder = 1
  end
end
