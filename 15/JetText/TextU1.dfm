object Form1: TForm1
  Left = 196
  Top = 129
  Width = 446
  Height = 234
  Caption = 'Jet Engine Text Driver'
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
    Width = 438
    Height = 207
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object ADOTable1: TADOTable
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=E:\books\md7code\15' +
      '\JetText;Extended Properties=Text;Persist Security Info=False'
    CursorType = ctStatic
    TableName = 'NightShift#TXT'
    Left = 280
    Top = 88
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 168
    Top = 88
  end
end
