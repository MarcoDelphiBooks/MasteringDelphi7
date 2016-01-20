object Form1: TForm1
  Left = 242
  Top = 107
  Width = 696
  Height = 480
  Caption = 'JetParadox'
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
    Left = 24
    Top = 24
    Width = 657
    Height = 417
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=c:\program files\co' +
      'mmon files\borland shared\data;Extended Properties=Paradox 7.x;P' +
      'ersist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 72
    Top = 48
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 240
    Top = 48
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    TableName = 'customer'
    Left = 160
    Top = 56
  end
end
