object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 239
  Top = 180
  Height = 238
  Width = 406
  object cds: TClientDataSet
    Aggregates = <>
    FileName = 'c:\program files\common files\borland shared\data\orders.cds'
    Params = <>
    Left = 32
    Top = 16
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
    object Table1Employee: TStringField
      FieldKind = fkLookup
      FieldName = 'Employee'
      LookupDataSet = cds2
      LookupKeyFields = 'EmpNo'
      LookupResultField = 'LastName'
      KeyFields = 'EmpNo'
      Size = 30
      Lookup = True
    end
    object Table1SaleDate: TDateTimeField
      FieldName = 'SaleDate'
    end
    object Table1ShipDate: TDateTimeField
      FieldName = 'ShipDate'
    end
    object Table1EmpNo: TIntegerField
      CustomConstraint = 'Value > 0'
      ConstraintErrorMessage = 'EmpNo cannot be 0 or negative'
      FieldName = 'EmpNo'
      Required = True
      Visible = False
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
  object cds2: TClientDataSet
    Aggregates = <>
    FileName = 'c:\program files\common files\borland shared\data\employee.cds'
    IndexFieldNames = 'LastName'
    Params = <>
    Left = 32
    Top = 72
  end
  object DataSource1: TDataSource
    DataSet = cds
    Left = 88
    Top = 16
  end
  object DataSource2: TDataSource
    DataSet = cds2
    Left = 88
    Top = 64
  end
end
