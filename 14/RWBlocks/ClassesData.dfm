object DmClasses: TDmClasses
  OldCreateOrder = False
  Left = 336
  Top = 148
  Height = 404
  Width = 598
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = DmMain.IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 272
    Top = 32
  end
  object IBClassReg: TIBDataSet
    Database = DmMain.IBDatabase1
    Transaction = IBTransaction1
    AfterInsert = IBClassRegAfterInsert
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CLASSES_REG'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into CLASSES_REG'
      '  (ID, ID_CLASS, ID_COMPANY, NOTES)'
      'values'
      '  (:ID, :ID_CLASS, :ID_COMPANY, :NOTES)')
    RefreshSQL.Strings = (
      'select reg.ID, reg.ID_CLASS, reg.ID_COMPANY, reg.NOTES, c.Name '
      'from CLASSES_REG reg'
      'join COMPANIES c on reg.ID_COMPANY = c.id'
      'where id = :id')
    SelectSQL.Strings = (
      'select reg.ID, reg.ID_CLASS, reg.ID_COMPANY, reg.NOTES, c.Name '
      'from CLASSES_REG reg'
      'join COMPANIES c on reg.ID_COMPANY = c.id'
      'where id_class = :id')
    ModifySQL.Strings = (
      'update CLASSES_REG'
      'set'
      '  ID = :ID,'
      '  ID_CLASS = :ID_CLASS,'
      '  ID_COMPANY = :ID_COMPANY,'
      '  NOTES = :NOTES'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'G_MASTER'
    DataSource = dsClasses
    Left = 32
    Top = 88
  end
  object dsClasses: TDataSource
    DataSet = IBClasses
    Left = 80
    Top = 32
  end
  object IBClasses: TIBDataSet
    Database = DmMain.IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CLASSES'
      'where'
      '  ID = :OLD_ID and'
      '  STARTS_ON = :OLD_STARTS_ON')
    InsertSQL.Strings = (
      'insert into CLASSES'
      '  (ID, DESCRIPTION, STARTS_ON)'
      'values'
      '  (:ID, :DESCRIPTION, :STARTS_ON)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  DESCRIPTION,'
      '  STARTS_ON'
      'from CLASSES '
      'where'
      '  ID = :ID and'
      '  STARTS_ON = :STARTS_ON')
    SelectSQL.Strings = (
      'select ID, DESCRIPTION, STARTS_ON from CLASSES'
      'where STARTS_ON > '#39'NOW'#39)
    ModifySQL.Strings = (
      'update CLASSES'
      'set'
      '  ID = :ID,'
      '  DESCRIPTION = :DESCRIPTION,'
      '  STARTS_ON = :STARTS_ON'
      'where'
      '  ID = :OLD_ID and'
      '  STARTS_ON = :OLD_STARTS_ON')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'G_MASTER'
    Left = 32
    Top = 32
  end
  object IBPeopleReg: TIBDataSet
    Database = DmMain.IBDatabase1
    Transaction = IBTransaction1
    AfterInsert = IBPeopleRegAfterInsert
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PEOPLE_REG'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into PEOPLE_REG'
      '  (ID, ID_CLASSES_REG, ID_PERSON, AMOUNT)'
      'values'
      '  (:ID, :ID_CLASSES_REG, :ID_PERSON, :AMOUNT)')
    RefreshSQL.Strings = (
      
        'select preg.ID, preg.ID_CLASSES_REG, preg.ID_PERSON,   preg.AMOU' +
        'NT, p.Name '
      'from PEOPLE_REG preg'
      'join People p on p.id = preg.id_person'
      'where ID = :ID')
    SelectSQL.Strings = (
      
        'select preg.ID, preg.ID_CLASSES_REG, preg.ID_PERSON,   preg.AMOU' +
        'NT, p.Name '
      'from PEOPLE_REG preg'
      'join People p on p.id = preg.id_person'
      'where preg.id_classes_reg = :id')
    ModifySQL.Strings = (
      'update PEOPLE_REG'
      'set'
      '  ID = :ID,'
      '  ID_CLASSES_REG = :ID_CLASSES_REG,'
      '  ID_PERSON = :ID_PERSON,'
      '  AMOUNT = :AMOUNT'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'G_MASTER'
    DataSource = dsReg
    Left = 32
    Top = 144
  end
  object dsReg: TDataSource
    DataSet = IBClassReg
    Left = 80
    Top = 88
  end
end
