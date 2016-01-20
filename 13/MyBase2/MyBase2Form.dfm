object Form1: TForm1
  Left = 237
  Top = 107
  Width = 696
  Height = 480
  Caption = 'MyBase2'
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 688
    Height = 453
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Data'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 680
        Height = 425
        Align = alClient
        DataSource = DataSource1
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnTitleClick = DBGrid1TitleClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'XML'
      ImageIndex = 1
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 680
        Height = 425
        Align = alClient
        Lines.Strings = (
          'Memo1')
        TabOrder = 0
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = cds
    Left = 56
    Top = 32
  end
  object cds: TClientDataSet
    Aggregates = <>
    FileName = 'mybase2.cds'
    FieldDefs = <
      item
        Name = 'one'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'two'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 56
    Top = 104
  end
end
