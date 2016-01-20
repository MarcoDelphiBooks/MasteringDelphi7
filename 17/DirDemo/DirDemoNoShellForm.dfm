object Form1: TForm1
  Left = 220
  Top = 235
  Caption = 'DirDataSet Demo'
  ClientHeight = 205
  ClientWidth = 719
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
  object DBGrid1: TDBGrid
    Left = 145
    Top = 0
    Width = 574
    Height = 205
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
  object DirectoryListBox1: TDirectoryListBox
    Left = 0
    Top = 0
    Width = 145
    Height = 205
    Align = alLeft
    TabOrder = 1
    OnChange = DirectoryListBox1Change
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = MdDirDataset1
    Left = 224
    Top = 40
  end
  object MdDirDataset1: TMdDirDataset
    Directory = 'c:\*.*'
    Left = 224
    Top = 80
    object MdDirDataset1FileName: TWideStringField
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
