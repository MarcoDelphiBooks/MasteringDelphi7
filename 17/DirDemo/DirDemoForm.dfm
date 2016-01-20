object Form1: TForm1
  Left = 214
  Top = 262
  Width = 735
  Height = 243
  Caption = 'DirDataSet Demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 185
    Top = 0
    Width = 542
    Height = 216
    Align = alClient
    DataSource = DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'FileName'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TimeStamp'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Size'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Attributes'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Folder'
        Visible = True
      end>
  end
  object ShellTreeView1: TShellTreeView
    Left = 0
    Top = 0
    Width = 185
    Height = 216
    ObjectTypes = [otFolders]
    Root = 'c:\'
    UseShellImages = True
    Align = alLeft
    AutoRefresh = False
    Indent = 19
    ParentColor = False
    RightClickSelect = True
    ShowRoot = False
    TabOrder = 1
    OnChange = ShellTreeView1Change
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = MdDirDataset1
    Left = 224
    Top = 40
  end
  object MdDirDataset1: TMdDirDataset
    Active = True
    Directory = 'c:\*.*'
    Left = 224
    Top = 80
    object MdDirDataset1FileName: TStringField
      FieldName = 'FileName'
      Required = True
      Size = 40
    end
    object MdDirDataset1TimeStamp: TDateTimeField
      FieldName = 'TimeStamp'
    end
    object MdDirDataset1Size: TIntegerField
      FieldName = 'Size'
      DisplayFormat = '#,###'
    end
    object MdDirDataset1Attributes: TStringField
      FieldName = 'Attributes'
      Size = 3
    end
    object MdDirDataset1Folder: TBooleanField
      FieldName = 'Folder'
    end
  end
end
