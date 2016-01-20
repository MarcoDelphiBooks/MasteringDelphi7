object FormFreeQuery: TFormFreeQuery
  Left = 226
  Top = 158
  Width = 696
  Height = 480
  Caption = 'Free Query'
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
    Left = 0
    Top = 122
    Width = 688
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object MemoSql: TMemo
    Left = 0
    Top = 33
    Width = 688
    Height = 89
    Align = alTop
    Lines.Strings = (
      'select * from classes')
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 125
    Width = 688
    Height = 328
    Align = alClient
    DataSource = dsQueryFree
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 33
    Align = alTop
    TabOrder = 2
    object ButtonRun: TButton
      Left = 174
      Top = 5
      Width = 75
      Height = 25
      Caption = '&Run'
      TabOrder = 0
      OnClick = ButtonRunClick
    end
    object DBNavigator1: TDBNavigator
      Left = 255
      Top = 4
      Width = 240
      Height = 25
      DataSource = dsQueryFree
      TabOrder = 1
    end
    object ComboTables: TComboBox
      Left = 8
      Top = 8
      Width = 153
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnChange = ComboTablesChange
    end
  end
  object dsQueryFree: TDataSource
    DataSet = QueryFree
    Left = 32
    Top = 216
  end
  object QueryFree: TIBQuery
    Database = DmMain.IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from v_fatture_non_pagate')
    Left = 32
    Top = 168
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = DmMain.IBDatabase1
    Params.Strings = (
      'concurrency'
      'nowait')
    Left = 96
    Top = 168
  end
end
