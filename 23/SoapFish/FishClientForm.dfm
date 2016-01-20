object Form1: TForm1
  Left = 192
  Top = 107
  Width = 716
  Height = 410
  Caption = 'FishClient'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 16
    Top = 184
    Width = 273
    Height = 169
  end
  object btnGetImage: TButton
    Left = 16
    Top = 16
    Width = 121
    Height = 25
    Caption = 'Get Image'
    TabOrder = 0
    OnClick = btnGetImageClick
  end
  object btnGetCds: TButton
    Left = 168
    Top = 16
    Width = 121
    Height = 25
    Caption = 'Get Cds'
    TabOrder = 1
    OnClick = btnGetCdsClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 364
    Width = 708
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object Edit1: TEdit
    Left = 16
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'any fish'
  end
  object DBImage1: TDBImage
    Left = 312
    Top = 184
    Width = 377
    Height = 169
    DataField = 'Graphic'
    DataSource = DataSource1
    Stretch = True
    TabOrder = 4
  end
  object DBGrid1: TDBGrid
    Left = 312
    Top = 16
    Width = 377
    Height = 161
    DataSource = DataSource1
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object HTTPRIO1: THTTPRIO
    URL = 'http://localhost:1024/SoapFishServer.SoapAttach/soap/ISoapFish'
    HTTPWebNode.Agent = 'Borland SOAP 1.2'
    HTTPWebNode.UseUTF8InHeader = False
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    HTTPWebNode.OnReceivingData = HTTPRIO1HTTPWebNode1ReceivingData
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 240
    Top = 192
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 96
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 256
    Top = 96
  end
end
