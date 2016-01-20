object Form1: TForm1
  Left = 325
  Top = 104
  Width = 368
  Height = 280
  Caption = 'FrameClock'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    360
    253)
  PixelsPerInch = 96
  TextHeight = 13
  object MdFramedClock1: TMdFramedClock
    Left = 72
    Top = 32
    Width = 215
    Height = 83
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    SubLabel.Left = 0
    SubLabel.Top = 0
    SubLabel.Width = 215
    SubLabel.Height = 83
    SubLabel.Align = alClient
    SubLabel.Alignment = taCenter
    SubLabel.Caption = '3:19:30 PM'
    SubLabel.Font.Charset = DEFAULT_CHARSET
    SubLabel.Font.Color = clWindowText
    SubLabel.Font.Height = -19
    SubLabel.Font.Name = 'Arial'
    SubLabel.Font.Style = [fsBold]
    SubLabel.ParentFont = False
    SubLabel.Layout = tlCenter
    SubLabel.WordWrap = True
    SubTimer.Left = 24
    SubTimer.Top = 16
  end
  object MdFramedClock2: TMdFramedClock
    Left = 72
    Top = 120
    Width = 217
    Height = 81
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Modern'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    SubLabel.Left = 0
    SubLabel.Top = 0
    SubLabel.Width = 217
    SubLabel.Height = 81
    SubLabel.Align = alClient
    SubLabel.Alignment = taCenter
    SubLabel.Caption = '3:19:30 PM'
    SubLabel.Font.Charset = DEFAULT_CHARSET
    SubLabel.Font.Color = clWindowText
    SubLabel.Font.Height = -19
    SubLabel.Font.Name = 'Arial Narrow'
    SubLabel.Font.Style = [fsBold]
    SubLabel.ParentFont = False
    SubLabel.Layout = tlCenter
    SubLabel.WordWrap = True
    SubTimer.Left = 24
    SubTimer.Top = 16
  end
end
