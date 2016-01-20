object IWServerController: TIWServerController
  OldCreateOrder = False
  AppName = 'MyIWApp'
  ComInitialization = ciNone
  SessionTrackingMethod = tmURL
  Description = 'My Intraweb Application'
  DestinationDevice = ddWeb
  ExceptionDisplayMode = smAlert
  ExecCmd = 'EXEC'
  HistoryEnabled = False
  Port = 8080
  RestrictIPs = False
  ShowResyncWarning = True
  SessionTimeout = 10
  SSLPort = 0
  SupportedBrowsers = [brIE, brNetscape6]
  OnNewSession = IWServerControllerBaseNewSession
  Left = 485
  Top = 206
  Height = 310
  Width = 342
end
