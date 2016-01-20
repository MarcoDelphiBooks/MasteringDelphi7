object table: Ttable
  OldCreateOrder = False
  PageProducer = AdapterPageProducer
  AppServices = WebAppComponents
  Left = 524
  Top = 183
  Height = 296
  Width = 241
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
        Adapter = DataSetAdapter1
      end
      object AdapterCommandGroup1: TAdapterCommandGroup
        DisplayComponent = AdapterGrid1
        object CmdPrevPage: TAdapterActionButton
          ActionName = 'PrevPage'
          Caption = 'Previous Page'
        end
        object CmdGotoPage: TAdapterActionButton
          ActionName = 'GotoPage'
        end
        object CmdNextPage: TAdapterActionButton
          ActionName = 'NextPage'
          Caption = 'Next Page'
        end
      end
      object AdapterGrid1: TAdapterGrid
        TableAttributes.CellSpacing = 0
        TableAttributes.CellPadding = 3
        Adapter = DataSetAdapter1
        AdapterMode = 'Browse'
        object ColCUST_NO: TAdapterDisplayColumn
          FieldName = 'CUST_NO'
        end
        object ColCUSTOMER: TAdapterDisplayColumn
          FieldName = 'CUSTOMER'
        end
        object ColADDRESS_LINE1: TAdapterDisplayColumn
          FieldName = 'ADDRESS_LINE1'
        end
        object ColCITY: TAdapterDisplayColumn
          FieldName = 'CITY'
        end
        object ColSTATE_PROVINCE: TAdapterDisplayColumn
          FieldName = 'STATE_PROVINCE'
        end
        object ColCOUNTRY: TAdapterDisplayColumn
          FieldName = 'COUNTRY'
        end
        object AdapterCommandColumn1: TAdapterCommandColumn
          Caption = 'COMMANDS'
          object CmdEditRow: TAdapterActionButton
            ActionName = 'EditRow'
            Caption = 'Edit'
            PageName = 'formview'
            DisplayType = ctAnchor
          end
          object CmdDeleteRow: TAdapterActionButton
            ActionName = 'DeleteRow'
            Caption = 'Delete'
            DisplayType = ctAnchor
          end
        end
      end
      object AdapterCommandGroup2: TAdapterCommandGroup
        DisplayComponent = AdapterGrid1
        object CmdNewRow: TAdapterActionButton
          ActionName = 'NewRow'
          Caption = 'New'
          PageName = 'formview'
        end
      end
    end
  end
  object WebAppComponents: TWebAppComponents
    PageDispatcher = PageDispatcher
    AdapterDispatcher = AdapterDispatcher
    ApplicationAdapter = ApplicationAdapter
    Left = 48
    Top = 56
  end
  object ApplicationAdapter: TApplicationAdapter
    ApplicationTitle = 'WSnapTable'
    Left = 48
    Top = 104
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
    end
  end
  object PageDispatcher: TPageDispatcher
    Left = 48
    Top = 152
  end
  object AdapterDispatcher: TAdapterDispatcher
    Left = 48
    Top = 200
  end
  object DataSetAdapter1: TDataSetAdapter
    DataSet = WebDataModule1.ClientDataSet1
    PageSize = 6
    Left = 144
    Top = 16
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
    end
  end
end
