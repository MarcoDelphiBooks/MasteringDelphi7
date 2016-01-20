object Form1: TForm1
  Left = 192
  Top = 125
  Width = 715
  Height = 342
  Caption = 'Batch Updates'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 707
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Button1: TButton
      Left = 7
      Top = 7
      Width = 72
      Height = 20
      Caption = 'Update Batch'
      TabOrder = 0
      OnClick = Button1Click
    end
    object CheckBox1: TCheckBox
      Left = 91
      Top = 7
      Width = 79
      Height = 13
      Caption = 'Connected'
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = CheckBox1Click
    end
    object Button2: TButton
      Left = 189
      Top = 7
      Width = 124
      Height = 20
      Caption = 'Save To Local.ADTG'
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 325
      Top = 7
      Width = 118
      Height = 20
      Caption = 'Save to Local.XML'
      TabOrder = 3
      OnClick = Button3Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 33
    Width = 707
    Height = 282
    Align = alClient
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -10
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object ADODataSet1: TADODataSet
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'SELECT * FROM CUSTOMER'
    Parameters = <>
    Left = 328
    Top = 48
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 440
    Top = 48
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\SYSTEM\ole db\Data Links' +
      '\DBDEMOS.udl'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 216
    Top = 48
  end
end
