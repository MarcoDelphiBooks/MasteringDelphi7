object WebModule1: TWebModule1
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'WebActionItem1'
      PathInfo = '/sites'
      OnAction = WebModule1WebActionItem1Action
    end
    item
      Name = 'WebActionItem2'
      PathInfo = '/source'
      OnAction = WebModule1WebActionItem2Action
    end>
  Left = 234
  Top = 107
  Height = 373
  Width = 443
  object DataSetTableProducer1: TDataSetTableProducer
    Columns = <
      item
        BgColor = 'Gray'
        Custom = 'width="20"'
        FieldName = 'Index'
      end
      item
        FieldName = 'Address'
      end
      item
        FieldName = 'Description'
      end>
    MaxRows = -1
    DataSet = cds
    TableAttributes.Border = 1
    TableAttributes.CellSpacing = 0
    TableAttributes.CellPadding = 2
    OnFormatCell = DataSetTableProducer1FormatCell
    Left = 88
    Top = 56
  end
  object cds: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Index'
        DataType = ftInteger
      end
      item
        Name = 'Address'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'Description'
        DataType = ftString
        Size = 200
      end>
    IndexDefs = <
      item
        Name = 'cdsIndexAddress'
        Fields = 'Address'
      end>
    IndexFieldNames = 'Address'
    Params = <>
    StoreDefs = True
    Left = 176
    Top = 56
  end
  object IdHTTP1: TIdHTTP
    MaxLineAction = maException
    ReadTimeout = 0
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = 0
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 264
    Top = 64
  end
end
