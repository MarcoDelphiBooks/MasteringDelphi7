object DmCompanies: TDmCompanies
  OldCreateOrder = False
  Left = 304
  Top = 161
  Height = 370
  Width = 417
  object DataCompanies: TIBDataSet
    Database = DmMain.IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from COMPANIES'
      'where'
      '  ID = :OLD_ID and'
      '  NAME = :OLD_NAME and'
      '  TAX_CODE = :OLD_TAX_CODE')
    InsertSQL.Strings = (
      'insert into COMPANIES'
      '  (ID, NAME, TAX_CODE)'
      'values'
      '  (:ID, :NAME, :TAX_CODE)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  NAME,'
      '  TAX_CODE,'
      '  NAME_UPPER'
      'from COMPANIES '
      'where'
      '  ID = :ID and'
      '  NAME = :NAME and'
      '  TAX_CODE = :TAX_CODE')
    SelectSQL.Strings = (
      'select c.id, c.name, c.tax_code from companies c')
    ModifySQL.Strings = (
      'update COMPANIES'
      'set'
      '  ID = :ID,'
      '  NAME = :NAME,'
      '  TAX_CODE = :TAX_CODE'
      'where'
      '  ID = :OLD_ID and'
      '  NAME = :OLD_NAME and'
      '  TAX_CODE = :OLD_TAX_CODE')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'G_MASTER'
    Left = 48
    Top = 40
    object DataCompaniesID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object DataCompaniesNAME: TIBStringField
      FieldName = 'NAME'
      Size = 50
    end
    object DataCompaniesTAX_CODE: TIBStringField
      FieldName = 'TAX_CODE'
      Size = 16
    end
  end
  object DataLocations: TIBDataSet
    Database = DmMain.IBDatabase1
    Transaction = IBTransaction1
    AfterInsert = DataLocationsAfterInsert
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from LOCATIONS'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into LOCATIONS'
      '  (ID, ID_COMPANY, ADDRESS, FAX, PHONE, STATE, TOWN, ZIP)'
      'values'
      
        '  (:ID, :ID_COMPANY, :ADDRESS, :FAX, :PHONE, :STATE, :TOWN, :ZIP' +
        ')')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  ID_COMPANY,'
      '  ADDRESS,'
      '  TOWN,'
      '  ZIP,'
      '  STATE,'
      '  PHONE,'
      '  FAX'
      'from LOCATIONS '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select ID, ID_COMPANY,  ADDRESS, FAX, '
      '  PHONE, STATE, TOWN, ZIP '
      'from LOCATIONS'
      'where ID_COMPANY = :id')
    ModifySQL.Strings = (
      'update LOCATIONS'
      'set'
      '  ID = :ID,'
      '  ID_COMPANY = :ID_COMPANY,'
      '  ADDRESS = :ADDRESS,'
      '  FAX = :FAX,'
      '  PHONE = :PHONE,'
      '  STATE = :STATE,'
      '  TOWN = :TOWN,'
      '  ZIP = :ZIP'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'G_MASTER'
    DataSource = dsCompanies
    Left = 48
    Top = 104
    object DataLocationsID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object DataLocationsID_COMPANY: TIntegerField
      FieldName = 'ID_COMPANY'
      Required = True
    end
    object DataLocationsADDRESS: TIBStringField
      FieldName = 'ADDRESS'
      Size = 40
    end
    object DataLocationsFAX: TIBStringField
      FieldName = 'FAX'
      Size = 15
    end
    object DataLocationsPHONE: TIBStringField
      FieldName = 'PHONE'
      Size = 15
    end
    object DataLocationsSTATE: TIBStringField
      FieldName = 'STATE'
      Size = 4
    end
    object DataLocationsTOWN: TIBStringField
      FieldName = 'TOWN'
      Size = 30
    end
    object DataLocationsZIP: TIBStringField
      FieldName = 'ZIP'
      Size = 10
    end
  end
  object DataPeople: TIBDataSet
    Database = DmMain.IBDatabase1
    Transaction = IBTransaction1
    AfterInsert = DataPeopleAfterInsert
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PEOPLE'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into PEOPLE'
      
        '  (ID, ID_COMPANY, ID_LOCATION, KEY_CONTACT, NAME, EMAIL, FAX, P' +
        'HONE)'
      'values'
      
        '  (:ID, :ID_COMPANY, :ID_LOCATION, :KEY_CONTACT, :NAME, :EMAIL, ' +
        ':FAX, :PHONE)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  ID_COMPANY,'
      '  ID_LOCATION,'
      '  NAME,'
      '  PHONE,'
      '  FAX,'
      '  EMAIL,'
      '  KEY_CONTACT'
      'from PEOPLE '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      
        'select ID, ID_COMPANY, ID_LOCATION, KEY_CONTACT, NAME, EMAIL, FA' +
        'X, PHONE'
      'from PEOPLE'
      'where ID_COMPANY = :id')
    ModifySQL.Strings = (
      'update PEOPLE'
      'set'
      '  ID = :ID,'
      '  ID_COMPANY = :ID_COMPANY,'
      '  ID_LOCATION = :ID_LOCATION,'
      '  KEY_CONTACT = :KEY_CONTACT,'
      '  NAME = :NAME,'
      '  EMAIL = :EMAIL,'
      '  FAX = :FAX,'
      '  PHONE = :PHONE'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'G_MASTER'
    DataSource = dsCompanies
    Left = 48
    Top = 168
    object DataPeopleID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object DataPeopleID_COMPANY: TIntegerField
      FieldName = 'ID_COMPANY'
      Required = True
    end
    object DataPeopleID_LOCATION: TIntegerField
      FieldName = 'ID_LOCATION'
      Required = True
    end
    object DataPeopleKEY_CONTACT: TIBStringField
      FieldName = 'KEY_CONTACT'
      Required = True
      Size = 1
    end
    object DataPeopleNAME: TIBStringField
      FieldName = 'NAME'
      Required = True
      Size = 50
    end
    object DataPeopleEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object DataPeopleFAX: TIBStringField
      FieldName = 'FAX'
      Size = 15
    end
    object DataPeoplePHONE: TIBStringField
      FieldName = 'PHONE'
      Size = 15
    end
  end
  object dsCompanies: TDataSource
    DataSet = DataCompanies
    Left = 120
    Top = 40
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = DmMain.IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 120
    Top = 104
  end
end
