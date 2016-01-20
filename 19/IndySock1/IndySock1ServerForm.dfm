object FormServer: TFormServer
  Left = 451
  Top = 158
  Width = 342
  Height = 259
  Caption = 'IndySock1Server'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    334
    232)
  PixelsPerInch = 96
  TextHeight = 13
  object lbLog: TListBox
    Left = 8
    Top = 8
    Width = 321
    Height = 217
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 0
  end
  object IdTCPServer1: TIdTCPServer
    Bindings = <>
    CommandHandlers = <
      item
        CmdDelimiter = ' '
        Command = 'test'
        Disconnect = False
        Name = 'TIdCommandHandler0'
        ParamDelimiter = ' '
        ParseParams = False
        ReplyExceptionCode = 0
        ReplyNormal.NumericCode = 100
        ReplyNormal.Text.Strings = (
          'Hello from your Indy Server')
        ReplyNormal.TextCode = '100'
        Tag = 0
      end
      item
        CmdDelimiter = ' '
        Command = 'execute'
        Disconnect = False
        Name = 'TIdCommandHandler1'
        OnCommand = IdTCPServer1TIdCommandHandler1Command
        ParamDelimiter = ' '
        ParseParams = False
        ReplyExceptionCode = 0
        ReplyNormal.NumericCode = 0
        Tag = 0
      end
      item
        CmdDelimiter = ' '
        Command = 'getfile'
        Disconnect = False
        Name = 'TIdCommandHandler2'
        OnCommand = IdTCPServer1TIdCommandHandler2Command
        ParamDelimiter = ' '
        ReplyExceptionCode = 0
        ReplyNormal.NumericCode = 0
        Tag = 0
      end>
    DefaultPort = 1050
    Greeting.NumericCode = 0
    MaxConnectionReply.NumericCode = 0
    OnConnect = IdTCPServer1Connect
    OnDisconnect = IdTCPServer1Disconnect
    ReplyExceptionCode = 0
    ReplyTexts = <>
    ReplyUnknownCommand.NumericCode = 0
    Left = 56
    Top = 24
  end
end
