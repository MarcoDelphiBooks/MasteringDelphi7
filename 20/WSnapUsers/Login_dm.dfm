object loginform: Tloginform
  OldCreateOrder = False
  PageProducer = AdapterPageProducer
  Left = 479
  Top = 148
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
      object AdapterFieldGroup1: TAdapterFieldGroup
        Adapter = LoginFormAdapter1
      end
      object AdapterCommandGroup1: TAdapterCommandGroup
        DisplayComponent = AdapterFieldGroup1
        Custom = 'align=center'
      end
    end
  end
  object LoginFormAdapter1: TLoginFormAdapter
    Left = 48
    Top = 56
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
    end
  end
end
