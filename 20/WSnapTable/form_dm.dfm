object formview: Tformview
  OldCreateOrder = False
  PageProducer = AdapterPageProducer
  Left = 297
  Top = 213
  Height = 150
  Width = 215
  object AdapterPageProducer: TAdapterPageProducer
    HTMLDoc.Strings = (
      '<html>'
      '<head>'
      '</head>'
      '<body>'
      '<#STYLES><#WARNINGS><#SERVERSCRIPT>'
      '</body>'
      '</html>')
    Left = 48
    Top = 8
    object AdapterForm1: TAdapterForm
      object AdapterErrorList1: TAdapterErrorList
        Adapter = table.DataSetAdapter1
      end
      object AdapterCommandGroup1: TAdapterCommandGroup
        DisplayComponent = AdapterFieldGroup1
        object CmdApply: TAdapterActionButton
          ActionName = 'Apply'
          PageName = 'table'
        end
        object CmdCancel: TAdapterActionButton
          ActionName = 'Cancel'
          PageName = 'table'
        end
        object CmdDeleteRow: TAdapterActionButton
          ActionName = 'DeleteRow'
          Caption = 'Delete'
          PageName = 'table'
        end
      end
      object AdapterFieldGroup1: TAdapterFieldGroup
        Adapter = table.DataSetAdapter1
        AdapterMode = 'Edit'
        object FldCUST_NO: TAdapterDisplayField
          DisplayWidth = 10
          FieldName = 'CUST_NO'
        end
        object FldCUSTOMER: TAdapterDisplayField
          DisplayWidth = 27
          FieldName = 'CUSTOMER'
        end
        object FldADDRESS_LINE1: TAdapterDisplayField
          DisplayWidth = 32
          FieldName = 'ADDRESS_LINE1'
        end
        object FldCITY: TAdapterDisplayField
          DisplayWidth = 27
          FieldName = 'CITY'
        end
        object FldSTATE_PROVINCE: TAdapterDisplayField
          DisplayWidth = 17
          FieldName = 'STATE_PROVINCE'
        end
        object FldCOUNTRY: TAdapterDisplayField
          DisplayWidth = 17
          FieldName = 'COUNTRY'
        end
      end
    end
  end
end
