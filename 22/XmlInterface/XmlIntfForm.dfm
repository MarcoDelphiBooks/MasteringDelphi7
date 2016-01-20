object Form1: TForm1
  Left = 192
  Top = 107
  Width = 580
  Height = 428
  Caption = 'XmlInterface'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    572
    401)
  PixelsPerInch = 96
  TextHeight = 13
  object btnTitle: TButton
    Left = 200
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Title'
    TabOrder = 0
    OnClick = btnTitleClick
  end
  object Memo1: TMemo
    Left = 24
    Top = 56
    Width = 524
    Height = 324
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
  end
  object btnMemo: TButton
    Left = 112
    Top = 16
    Width = 75
    Height = 25
    Caption = 'To Memo'
    TabOrder = 2
    OnClick = btnMemoClick
  end
  object btnLoad: TButton
    Left = 24
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Load'
    TabOrder = 3
    OnClick = btnLoadClick
  end
  object btnAttr: TButton
    Left = 288
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Attribute'
    TabOrder = 4
    OnClick = btnAttrClick
  end
  object btnAllTitles: TButton
    Left = 376
    Top = 16
    Width = 75
    Height = 25
    Caption = 'All Titles'
    TabOrder = 5
    OnClick = btnAllTitlesClick
  end
  object XMLDocument1: TXMLDocument
    NodeIndentStr = '      '
    Options = [doNodeAutoCreate, doNodeAutoIndent, doAttrNull, doAutoPrefix, doNamespaceDecl]
    Left = 176
    Top = 112
    DOMVendorDesc = 'MSXML'
  end
end
