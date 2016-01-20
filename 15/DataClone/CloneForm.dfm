object Form1: TForm1
  Left = 192
  Top = 107
  Width = 572
  Height = 362
  Caption = 'DataClone'
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
  object Splitter1: TSplitter
    Left = 265
    Top = 29
    Height = 306
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 29
    Width = 265
    Height = 306
    Align = alLeft
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 564
    Height = 29
    ButtonHeight = 21
    ButtonWidth = 74
    Caption = 'ToolBar1'
    ShowCaptions = True
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Caption = 'Clone Dataset'
      ImageIndex = 0
      OnClick = ToolButton1Click
    end
  end
  object DBGrid2: TDBGrid
    Left = 268
    Top = 29
    Width = 296
    Height = 306
    Align = alClient
    DataSource = DataSource2
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object ADOTable1: TADOTable
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\SYSTEM\ole db\Data Links' +
      '\DBDEMOS.udl'
    TableName = 'customer'
    Left = 192
    Top = 96
  end
  object ADOTable2: TADOTable
    Left = 192
    Top = 152
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 256
    Top = 96
  end
  object DataSource2: TDataSource
    DataSet = ADOTable2
    Left = 248
    Top = 152
  end
end
