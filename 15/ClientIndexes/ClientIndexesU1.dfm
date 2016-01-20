object Form1: TForm1
  Left = 192
  Top = 125
  Width = 560
  Height = 283
  Caption = 
    'Client Indexes (Sorting Data In A Grid) - Click on a column titl' +
    'e'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 552
    Height = 256
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -10
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnTitleClick = DBGrid1TitleClick
  end
  object ADODataSet1: TADODataSet
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\SYSTEM\ole db\Data Links' +
      '\DBDEMOS.udl'
    CursorType = ctStatic
    CommandText = 'SELECT * FROM CUSTOMER'
    Parameters = <>
    Left = 232
    Top = 72
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 336
    Top = 72
  end
end
