object FormXmlTree: TFormXmlTree
  Left = 192
  Top = 107
  Width = 465
  Height = 401
  Caption = 'XmlDomTree'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object TreeView1: TTreeView
    Left = 0
    Top = 41
    Width = 457
    Height = 333
    Align = alClient
    Indent = 19
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 457
    Height = 41
    Align = alTop
    TabOrder = 1
    object btnLoad: TButton
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Load'
      TabOrder = 0
      OnClick = btnLoadClick
    end
    object Button1: TButton
      Left = 96
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Root Attr'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 180
      Top = 8
      Width = 75
      Height = 25
      Caption = 'First Author'
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 264
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Error'
      TabOrder = 3
      OnClick = Button3Click
    end
  end
  object XMLDocument1: TXMLDocument
    Left = 40
    Top = 40
    DOMVendorDesc = 'MSXML'
  end
  object OpenDialog1: TOpenDialog
    Left = 40
    Top = 96
  end
end
