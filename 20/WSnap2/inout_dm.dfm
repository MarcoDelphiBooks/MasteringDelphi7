object inout: Tinout
  OldCreateOrder = False
  PageProducer = AdapterPageProducer
  Left = 254
  Top = 107
  Height = 168
  Width = 227
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
      object AdapterFieldGroup1: TAdapterFieldGroup
        Adapter = Adapter1
        object FldText: TAdapterDisplayField
          FieldName = 'Text'
        end
        object FldAuto: TAdapterDisplayField
          FieldName = 'Auto'
        end
      end
      object AdapterCommandGroup1: TAdapterCommandGroup
        DisplayComponent = AdapterFieldGroup1
        object CmdPost: TAdapterActionButton
          ActionName = 'Post'
        end
        object CmdAddPlus: TAdapterActionButton
          ActionName = 'AddPlus'
        end
      end
    end
  end
  object Adapter1: TAdapter
    OnBeforeExecuteAction = Adapter1BeforeExecuteAction
    Left = 48
    Top = 72
    object TAdapterActions
      object AddPlus: TAdapterAction
        OnExecute = AddPlusExecute
      end
      object Post: TAdapterAction
        OnExecute = PostExecute
      end
    end
    object TAdapterFields
      object Text: TAdapterField
        OnGetValue = TextGetValue
      end
      object Auto: TAdapterBooleanField
        OnGetValue = AutoGetValue
      end
    end
  end
end
