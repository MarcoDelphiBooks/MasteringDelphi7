object CalcForm: TCalcForm
  Left = 257
  Top = 235
  Width = 664
  Height = 236
  VertScrollBar.Range = 24
  AutoScroll = False
  Caption = 'Calculated Field'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 656
    Height = 24
    Align = alTop
    TabOrder = 0
    object Panel2: TPanel
      Left = 555
      Top = 1
      Width = 100
      Height = 22
      Align = alRight
      BevelOuter = bvNone
      Caption = 'Panel2'
      TabOrder = 0
      object DBNavigator: TDBNavigator
        Left = 13
        Top = 4
        Width = 80
        Height = 18
        DataSource = DataSource1
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 0
      end
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 24
    Width = 656
    Height = 185
    Align = alClient
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnEditButtonClick = DBGrid1EditButtonClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Name'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Capital'
        Visible = True
      end
      item
        DropDownRows = 3
        Expanded = False
        FieldName = 'Continent'
        PickList.Strings = (
          'North America'
          'South America')
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Population'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Area'
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'PopulationDensity'
        ReadOnly = True
        Width = 98
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = cds
    Left = 77
    Top = 21
  end
  object cds: TClientDataSet
    Aggregates = <>
    FileName = 'C:\Program Files\Common Files\Borland Shared\Data\country.cds'
    Params = <>
    OnCalcFields = cdsCalcFields
    Left = 80
    Top = 88
    object cdsName: TStringField
      FieldName = 'Name'
      Size = 24
    end
    object cdsCapital: TStringField
      FieldName = 'Capital'
      Size = 24
    end
    object cdsContinent: TStringField
      FieldName = 'Continent'
      Size = 24
    end
    object cdsArea: TFloatField
      FieldName = 'Area'
      DisplayFormat = '#,###'
      EditFormat = '####'
    end
    object cdsPopulation: TFloatField
      FieldName = 'Population'
      DisplayFormat = '#,###'
      EditFormat = '####'
    end
    object cdsPopulationDensity: TFloatField
      DisplayLabel = 'Population Density'
      FieldKind = fkCalculated
      FieldName = 'PopulationDensity'
      DisplayFormat = '#,###.##'
      Calculated = True
    end
  end
end
