object Form1: TForm1
  Left = 192
  Top = 125
  Width = 557
  Height = 236
  Caption = 'Pessimistic Locking'
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
    Width = 549
    Height = 209
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -10
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 272
    Top = 64
  end
  object ADODataSet1: TADODataSet
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\SYSTEM\ole db\Data Links' +
      '\DBDEMOS.udl'
    CursorLocation = clUseServer
    LockType = ltPessimistic
    CommandText = 'customer'
    CommandType = cmdTable
    Parameters = <>
    Left = 144
    Top = 64
  end
end
