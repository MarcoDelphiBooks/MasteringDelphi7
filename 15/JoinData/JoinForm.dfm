object Form1: TForm1
  Left = 192
  Top = 107
  Width = 696
  Height = 480
  Caption = 'JoinData'
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
    Left = 16
    Top = 16
    Width = 665
    Height = 425
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object ADODataSet1: TADODataSet
    Active = True
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\SYSTEM\ole db\Data Links' +
      '\DBDEMOS.udl'
    CursorType = ctStatic
    CommandText = 
      'SELECT * FROM Orders, Customer WHERE Customer.CustNo=Orders.Cust' +
      'No'
    Parameters = <>
    Left = 120
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 120
    Top = 80
  end
end
