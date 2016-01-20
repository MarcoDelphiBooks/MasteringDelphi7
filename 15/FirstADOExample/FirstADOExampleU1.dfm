object Form1: TForm1
  Left = 192
  Top = 125
  Width = 555
  Height = 302
  Caption = 'First ADO Example'
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
    Width = 547
    Height = 275
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -10
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object ADOTable1: TADOTable
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Program Files\Co' +
      'mmon Files\Borland Shared\Data\dbdemos.mdb;Persist Security Info' +
      '=False'
    CursorType = ctStatic
    TableName = 'customer'
    Left = 176
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 72
    Top = 24
  end
end
