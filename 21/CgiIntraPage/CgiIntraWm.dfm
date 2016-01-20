object WebModule1: TWebModule1
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'WebActionItem1'
      PathInfo = '/show'
      OnAction = WebModule1WebActionItem1Action
    end
    item
      Name = 'WebActionItem2'
      PathInfo = '/iwdemo'
      Producer = IWPageProducer1
    end>
  Left = 199
  Top = 112
  Height = 215
  Width = 314
  object IWModuleController1: TIWModuleController
    Left = 72
    Top = 32
  end
  object IWPageProducer1: TIWPageProducer
    OnGetForm = IWPageProducer1GetForm
    Left = 72
    Top = 88
  end
end
