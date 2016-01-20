object Form1: TForm1
  Left = 192
  Top = 107
  Width = 742
  Height = 292
  HorzScrollBar.Range = 721
  VertScrollBar.Range = 245
  ActiveControl = DBEdit1
  AutoScroll = False
  Caption = 'Null Dates'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = 11
  Font.Name = 'MS Sans Serif'
  Font.Pitch = fpVariable
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 48
    Width = 40
    Height = 13
    Caption = 'OrderNo'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 48
    Top = 88
    Width = 35
    Height = 13
    Caption = 'CustNo'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 48
    Top = 128
    Width = 44
    Height = 13
    Caption = 'SaleDate'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 48
    Top = 168
    Width = 44
    Height = 13
    Caption = 'ShipDate'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 48
    Top = 208
    Width = 35
    Height = 13
    Caption = 'EmpNo'
    FocusControl = DBEdit5
  end
  object DBEdit1: TDBEdit
    Left = 48
    Top = 64
    Width = 64
    Height = 21
    DataField = 'OrderNo'
    DataSource = DataSource1
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 48
    Top = 104
    Width = 64
    Height = 21
    DataField = 'CustNo'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 48
    Top = 144
    Width = 169
    Height = 21
    DataField = 'SaleDate'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 48
    Top = 184
    Width = 169
    Height = 21
    DataField = 'ShipDate'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 48
    Top = 224
    Width = 64
    Height = 21
    DataField = 'EmpNo'
    DataSource = DataSource1
    TabOrder = 4
  end
  object DBNavigator1: TDBNavigator
    Left = 16
    Top = 16
    Width = 240
    Height = 25
    DataSource = DataSource1
    TabOrder = 5
  end
  object DBGrid1: TDBGrid
    Left = 272
    Top = 16
    Width = 449
    Height = 225
    DataSource = DataSource1
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = 11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Pitch = fpVariable
    TitleFont.Style = []
  end
  object cds: TClientDataSet
    Aggregates = <>
    FileName = 'c:\program files\common files\borland shared\data\orders.cds'
    Params = <>
    Left = 200
    Top = 56
    object Table1OrderNo: TFloatField
      FieldName = 'OrderNo'
      DisplayFormat = #39'#'#39'0000'
    end
    object Table1CustNo: TFloatField
      Alignment = taLeftJustify
      CustomConstraint = 'CustNo IS NOT NULL'
      ConstraintErrorMessage = 'CustNo cannot be blank'
      FieldName = 'CustNo'
      Required = True
      DisplayFormat = 'CN 0000'
      MaxValue = 9999.000000000000000000
      MinValue = 1000.000000000000000000
    end
    object Table1SaleDate: TDateTimeField
      FieldName = 'SaleDate'
    end
    object Table1ShipDate: TDateTimeField
      FieldName = 'ShipDate'
      OnGetText = Table1ShipDateGetText
      OnSetText = Table1ShipDateSetText
    end
    object Table1EmpNo: TIntegerField
      CustomConstraint = 'Value > 0'
      ConstraintErrorMessage = 'EmpNo cannot be 0 or negative'
      FieldName = 'EmpNo'
      Required = True
      DisplayFormat = 'Emp'#39'#'#39' 0000'
      MaxValue = 9999
      MinValue = 1
    end
    object Table1ShipToContact: TStringField
      FieldName = 'ShipToContact'
    end
    object Table1ShipToAddr1: TStringField
      FieldName = 'ShipToAddr1'
      Size = 30
    end
    object Table1ShipToAddr2: TStringField
      FieldName = 'ShipToAddr2'
      Size = 30
    end
    object Table1ShipToCity: TStringField
      FieldName = 'ShipToCity'
      Size = 15
    end
    object Table1ShipToState: TStringField
      FieldName = 'ShipToState'
    end
    object Table1ShipToZip: TStringField
      FieldName = 'ShipToZip'
      Size = 10
    end
    object Table1ShipToCountry: TStringField
      FieldName = 'ShipToCountry'
    end
    object Table1ShipToPhone: TStringField
      FieldName = 'ShipToPhone'
      Size = 15
    end
    object Table1ShipVIA: TStringField
      FieldName = 'ShipVIA'
      Size = 7
    end
    object Table1PO: TStringField
      FieldName = 'PO'
      Size = 15
    end
    object Table1Terms: TStringField
      FieldName = 'Terms'
      Size = 6
    end
    object Table1PaymentMethod: TStringField
      FieldName = 'PaymentMethod'
      Size = 7
    end
    object Table1ItemsTotal: TCurrencyField
      FieldName = 'ItemsTotal'
    end
    object Table1TaxRate: TFloatField
      FieldName = 'TaxRate'
      DisplayFormat = '0.00%'
      MaxValue = 100.000000000000000000
    end
    object Table1Freight: TCurrencyField
      FieldName = 'Freight'
    end
    object Table1AmountPaid: TCurrencyField
      FieldName = 'AmountPaid'
    end
  end
  object DataSource1: TDataSource
    DataSet = cds
    Left = 128
    Top = 56
  end
end
