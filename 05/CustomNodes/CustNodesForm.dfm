object Form1: TForm1
  Left = 192
  Top = 139
  Width = 497
  Height = 330
  Caption = 'CustomNodes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 272
    Width = 377
    Height = 13
    HelpType = htKeyword
    AutoSize = False
    Caption = 'Info'
  end
  object TreeView1: TTreeView
    Left = 16
    Top = 16
    Width = 377
    Height = 249
    Indent = 19
    TabOrder = 0
    OnClick = TreeView1Click
    OnCreateNodeClass = TreeView1CreateNodeClass
  end
  object Button1: TButton
    Left = 400
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Add Nodes'
    TabOrder = 1
    OnClick = Button1Click
  end
end
