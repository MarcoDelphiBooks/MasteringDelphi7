object MdFramedClock: TMdFramedClock
  Left = 0
  Top = 0
  Width = 207
  Height = 65
  TabOrder = 0
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 207
    Height = 65
    Align = alClient
    Alignment = taCenter
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
    WordWrap = True
  end
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 207
    Height = 65
    Align = alClient
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 24
    Top = 16
  end
end
