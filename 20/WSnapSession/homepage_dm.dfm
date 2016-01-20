object SessionDemo: TSessionDemo
  OldCreateOrder = False
  OnBeforeDispatchPage = WebAppPageModuleBeforeDispatchPage
  PageProducer = PageProducer1
  AppServices = WebAppComponents
  Left = 254
  Top = 107
  Height = 344
  Width = 215
  object WebAppComponents: TWebAppComponents
    Sessions = SessionsService
    PageDispatcher = PageDispatcher
    AdapterDispatcher = AdapterDispatcher
    ApplicationAdapter = ApplicationAdapter
    Left = 48
    Top = 56
  end
  object ApplicationAdapter: TApplicationAdapter
    ApplicationTitle = 'WSnapSession'
    Left = 48
    Top = 104
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
      object Hits: TAdapterField
        OnGetValue = HitsGetValue
      end
      object SessionHits: TAdapterField
        OnGetValue = SessionHitsGetValue
      end
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
  object SessionsService: TSessionsService
    Left = 48
    Top = 248
  end
  object PageProducer1: TPageProducer
    OnHTMLTag = PageProducerHTMLTag
    ScriptEngine = 'JScript'
    Left = 48
    Top = 16
  end
end
