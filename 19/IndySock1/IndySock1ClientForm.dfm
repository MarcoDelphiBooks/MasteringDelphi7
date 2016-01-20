object FormClient: TFormClient
  Left = 461
  Top = 208
  Width = 465
  Height = 371
  Caption = 'IndySock1Client'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 152
    Top = 112
    Width = 281
    Height = 217
  end
  object Bevel1: TBevel
    Left = 152
    Top = 16
    Width = 281
    Height = 89
  end
  object Image1: TImage
    Left = 168
    Top = 160
    Width = 241
    Height = 153
    Stretch = True
  end
  object btnTest: TButton
    Left = 248
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Test'
    TabOrder = 0
    OnClick = btnTestClick
  end
  object btnExecute: TButton
    Left = 248
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Execute'
    TabOrder = 1
    OnClick = btnExecuteClick
  end
  object btnConnect: TButton
    Left = 40
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Connect'
    TabOrder = 2
    OnClick = btnConnectClick
  end
  object btnDisconnect: TButton
    Left = 40
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Disconnect'
    TabOrder = 3
    OnClick = btnDisconnectClick
  end
  object btnGetFile: TButton
    Left = 168
    Top = 128
    Width = 89
    Height = 25
    Caption = 'Get Bitmap File'
    TabOrder = 4
    OnClick = btnGetFileClick
  end
  object edFileName: TEdit
    Left = 259
    Top = 129
    Width = 148
    Height = 21
    TabOrder = 5
    Text = 'c:\windows\tiles.bmp'
  end
  object IdTCPClient1: TIdTCPClient
    MaxLineAction = maException
    ReadTimeout = 0
    Host = 'localhost'
    Port = 1050
    Left = 64
    Top = 104
  end
end
