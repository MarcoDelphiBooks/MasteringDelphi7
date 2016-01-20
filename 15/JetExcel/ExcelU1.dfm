object Form1: TForm1
  Left = 192
  Top = 107
  Width = 491
  Height = 214
  Caption = 'Accessing An Excel Spreadsheet Using Jet'
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
    Left = 0
    Top = 0
    Width = 483
    Height = 187
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object ADODataSet1: TADODataSet
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=abccompany.xls;Exte' +
      'nded Properties=Excel 8.0;Persist Security Info=False'
    CursorType = ctStatic
    CommandText = 'Employees$'
    CommandType = cmdTableDirect
    Parameters = <>
    Left = 112
    Top = 104
    object ADODataSet1FirstName: TWideStringField
      DisplayWidth = 20
      FieldName = 'FirstName'
      Size = 255
    end
    object ADODataSet1LastName: TWideStringField
      DisplayWidth = 20
      FieldName = 'LastName'
      Size = 255
    end
    object ADODataSet1Phone: TWideStringField
      DisplayWidth = 20
      FieldName = 'Phone'
      Size = 255
    end
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 200
    Top = 104
  end
end
