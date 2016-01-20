object HomePage: THomePage
  OldCreateOrder = False
  PageProducer = AdapterPageProducer
  AppServices = WebAppComponents
  Left = 662
  Top = 147
  Height = 448
  Width = 329
  object AdapterPageProducer: TAdapterPageProducer
    HTMLDoc.Strings = (
      '<html>'
      '<head>'
      '</head>'
      '<body>'
      '<#STYLES><#WARNINGS><#SERVERSCRIPT>'
      '</body>'
      '</html>')
    Left = 168
    Top = 16
    object AdapterForm1: TAdapterForm
      Custom = 
        'Border="1" CellSpacing="0" CellPadding="10" BgColor="Silver" ali' +
        'gn="center"'
      object AdapterCommandGroup1: TAdapterCommandGroup
        DisplayComponent = AdapterFieldGroup1
        Custom = 'Align="Center"'
        object CmdFirstRow: TAdapterActionButton
          ActionName = 'FirstRow'
          Caption = '   First   '
        end
        object CmdPrevRow: TAdapterActionButton
          ActionName = 'PrevRow'
          Caption = ' Previous '
        end
        object CmdNextRow: TAdapterActionButton
          ActionName = 'NextRow'
          Caption = '   Next   '
        end
        object CmdLastRow: TAdapterActionButton
          ActionName = 'LastRow'
          Caption = '   Last   '
        end
      end
      object AdapterFieldGroup1: TAdapterFieldGroup
        Custom = 'BgColor="Silver" '
        Adapter = WDataMod.dsaDepartment
        AdapterMode = 'Browse'
        object FldDEPARTMENT: TAdapterDisplayField
          DisplayWidth = 25
          FieldName = 'DEPARTMENT'
        end
        object FldDEPT_NO: TAdapterDisplayField
          DisplayWidth = 3
          FieldName = 'DEPT_NO'
        end
        object FldHEAD_DEPT: TAdapterDisplayField
          DisplayWidth = 3
          FieldName = 'HEAD_DEPT'
        end
        object FldLOCATION: TAdapterDisplayField
          DisplayWidth = 15
          FieldName = 'LOCATION'
        end
        object FldBUDGET: TAdapterDisplayField
          DisplayWidth = 16
          FieldName = 'BUDGET'
        end
      end
      object AdapterGrid1: TAdapterGrid
        TableAttributes.BgColor = 'Silver'
        TableAttributes.CellSpacing = 0
        TableAttributes.CellPadding = 3
        HeadingAttributes.BgColor = 'Gray'
        Adapter = WDataMod.dsaEmployee
        AdapterMode = 'Browse'
        object ColEMP_NO: TAdapterDisplayColumn
          FieldName = 'EMP_NO'
          HideOptions = []
        end
        object ColFIRST_NAME: TAdapterDisplayColumn
          FieldName = 'FIRST_NAME'
          HideOptions = []
        end
        object ColLAST_NAME: TAdapterDisplayColumn
          FieldName = 'LAST_NAME'
          HideOptions = []
        end
        object ColDEPT_NO: TAdapterDisplayColumn
          FieldName = 'DEPT_NO'
          HideOptions = []
        end
        object ColJOB_CODE: TAdapterDisplayColumn
          FieldName = 'JOB_CODE'
          HideOptions = []
        end
        object ColJOB_COUNTRY: TAdapterDisplayColumn
          FieldName = 'JOB_COUNTRY'
          HideOptions = []
        end
        object ColSALARY: TAdapterDisplayColumn
          FieldName = 'SALARY'
          HideOptions = []
        end
      end
    end
  end
  object WebAppComponents: TWebAppComponents
    PageDispatcher = PageDispatcher
    AdapterDispatcher = AdapterDispatcher
    ApplicationAdapter = ApplicationAdapter
    Left = 48
    Top = 16
  end
  object ApplicationAdapter: TApplicationAdapter
    ApplicationTitle = 'WSnap Master/Detail'
    Left = 48
    Top = 64
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
    end
  end
  object PageDispatcher: TPageDispatcher
    DefaultPage = 'HomePage'
    Left = 48
    Top = 112
  end
  object AdapterDispatcher: TAdapterDispatcher
    Left = 48
    Top = 160
  end
end
