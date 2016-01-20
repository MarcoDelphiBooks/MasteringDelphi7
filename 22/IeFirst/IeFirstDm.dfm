object WebModule1: TWebModule1
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'WebActionItem1'
      PathInfo = '/default'
      Producer = InetXPageProducer1
    end>
  Left = 236
  Top = 131
  Height = 289
  Width = 339
  object XMLBroker1: TXMLBroker
    Params = <>
    ProviderName = 'DataSetProvider1'
    WebDispatch.MethodType = mtAny
    WebDispatch.PathInfo = 'XMLBroker1'
    ReconcileProducer = PageProducer1
    OnGetResponse = XMLBroker1GetResponse
    Left = 64
    Top = 144
  end
  object PageProducer1: TPageProducer
    HTMLDoc.Strings = (
      '<h1>Update Errors</h1>'
      ''
      '<p>Something went wrong in your udpate request....'
      '<p>Get back to previous page.'
      ''
      ''
      '')
    Left = 176
    Top = 40
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = ClientDataSet1
    Left = 64
    Top = 88
  end
  object InetXPageProducer1: TInetXPageProducer
    IncludePathURL = '/jssource/'
    HTMLDoc.Strings = (
      '<HTML>'
      '<HEAD>'
      '<title>IeFirst</title>'
      '</HEAD>'
      '<BODY>'
      '<h1>Internet Express First Demo (IeFirst.exe)</h1>'
      ''
      '<#INCLUDES><#STYLES><#WARNINGS><#FORMS><#SCRIPT>'
      ''
      '</BODY>'
      '</HTML>')
    Left = 64
    Top = 192
    object DataForm1: TDataForm
      object DataNavigator1: TDataNavigator
        XMLComponent = DataGrid1
        Custom = 'align="center"'
      end
      object DataGrid1: TDataGrid
        XMLBroker = XMLBroker1
        DisplayRows = 5
        TableAttributes.BgColor = 'Silver'
        TableAttributes.CellSpacing = 0
        TableAttributes.CellPadding = 2
        HeadingAttributes.BgColor = 'Aqua'
        object EmpNo: TTextColumn
          DisplayWidth = 10
          FieldName = 'EmpNo'
        end
        object LastName: TTextColumn
          DisplayWidth = 20
          FieldName = 'LastName'
        end
        object FirstName: TTextColumn
          DisplayWidth = 15
          FieldName = 'FirstName'
        end
        object PhoneExt: TTextColumn
          DisplayWidth = 4
          FieldName = 'PhoneExt'
        end
        object HireDate: TTextColumn
          DisplayWidth = 18
          FieldName = 'HireDate'
        end
        object Salary: TTextColumn
          DisplayWidth = 10
          FieldName = 'Salary'
        end
        object StatusColumn1: TStatusColumn
          Caption = '*'
        end
      end
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FileName = 'C:\Program Files\Common Files\Borland Shared\Data\employee.cds'
    Params = <>
    Left = 64
    Top = 32
  end
end
