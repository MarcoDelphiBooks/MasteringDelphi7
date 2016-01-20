object multiple: Tmultiple
  OldCreateOrder = False
  OnActivate = WebPageModuleActivate
  PageProducer = AdapterPageProducer
  Left = 361
  Top = 101
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
      object AdapterGrid1: TAdapterGrid
        TableAttributes.CellSpacing = 0
        TableAttributes.CellPadding = 3
        Adapter = PagedAdapter1
        object ColNumber: TAdapterDisplayColumn
          FieldName = 'Number'
        end
        object ColSquare: TAdapterDisplayColumn
          FieldName = 'Square'
        end
      end
      object AdapterCommandGroup1: TAdapterCommandGroup
        DisplayComponent = AdapterGrid1
        object CmdPrevPage: TAdapterActionButton
          ActionName = 'PrevPage'
        end
        object CmdGotoPage: TAdapterActionButton
          ActionName = 'GotoPage'
          Caption = '1'
        end
        object CmdNextPage: TAdapterActionButton
          ActionName = 'NextPage'
        end
      end
    end
  end
  object PagedAdapter1: TPagedAdapter
    OnGetRecordIndex = PagedAdapter1GetRecordIndex
    OnGetRecordCount = PagedAdapter1GetRecordCount
    OnGetEOF = PagedAdapter1GetEOF
    OnGetFirstRecord = PagedAdapter1GetFirstRecord
    OnGetNextRecord = PagedAdapter1GetNextRecord
    PageSize = 20
    Left = 48
    Top = 64
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
      object Number: TAdapterMultiValueField
        OnGetValues = NumberGetValues
        OnGetValueCount = NumberGetValueCount
      end
      object Square: TAdapterMultiValueField
        OnGetValues = SquareGetValues
        OnGetValueCount = NumberGetValueCount
      end
      object AdapterField: TAdapterField
        OnGetValue = AdapterFieldGetValue
      end
    end
  end
  object NumbersList: TStringsValuesList
    Left = 128
    Top = 64
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
    end
  end
end
