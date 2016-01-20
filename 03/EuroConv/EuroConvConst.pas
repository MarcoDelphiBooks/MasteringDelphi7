unit EuroConvConst;

interface

uses
  ConvUtils;

var
  // Euro Currency Conversion Units
  // basic unit of measurement is Euro
  cbEuroCurrency: TConvFamily;

  cuEUR: TConvType;
  cuDEM: TConvType; // Germany
  cuESP: TConvType; // Spain
  cuFRF: TConvType; // France
  cuIEP: TConvType; // Ireland
  cuITL: TConvType; // Italy
  cuBEF: TConvType; // Belgium
  cuNLG: TConvType; // Holland
  cuATS: TConvType; // Austria
  cuPTE: TConvType; // Portugal
  cuFIM: TConvType; // Finland
  cuGRD: TConvType; // Greece
  cuLUF: TConvType; // Luxembourg

type
  TEuroDecimals = 3..6;

function EuroConvert (const AValue: Double; const AFrom, ATo: TConvType;
  const Decimals: TEuroDecimals = 3): Double;

implementation

uses
  Math;

const
  DEMPerEuros = 1.95583;
  ESPPerEuros = 166.386;
  FRFPerEuros = 6.55957;
  IEPPerEuros =  0.787564;
  ITLPerEuros =  1936.27;
  BEFPerEuros =  40.3399;
  NLGPerEuros =  2.20371;
  ATSPerEuros =  13.7603;
  PTEPerEuros =  200.482;
  FIMPerEuros =  5.94573;
  GRDPerEuros = 340.750;
  LUFPerEuros = 40.3399;

function EuroConvert (const AValue: Double; const AFrom, ATo: TConvType;
  const Decimals: TEuroDecimals = 3): Double;
begin
  // check special case: no conversion
  if AFrom = ATo then
    Result := AValue
  else
  begin
    // convert to Euro, than round
    Result := ConvertFrom (AFrom, AValue);
    Result := RoundTo (Result, -Decimals);
    // convert to currency than round again
    Result := ConvertTo (Result, ATo);
    Result := RoundTo (Result, -Decimals);
  end;
end;


initialization
  // Euro Currency's family type
  cbEuroCurrency := RegisterConversionFamily('EuroCurrency');

  cuEUR := RegisterConversionType(cbEuroCurrency, 'Euro (€)', 1);
  cuDEM := RegisterConversionType(cbEuroCurrency, 'German Marks (DEM)', 1 / DEMPerEuros);
  cuESP := RegisterConversionType(cbEuroCurrency, 'Spanish Pesetas (ESP)', 1 / ESPPerEuros);
  cuFRF := RegisterConversionType(cbEuroCurrency, 'French Francs (FRF)', 1 / FRFPerEuros);
  cuIEP := RegisterConversionType(cbEuroCurrency, 'Irish Pounds (IEP)', 1 / IEPPerEuros);
  cuITL := RegisterConversionType(cbEuroCurrency, 'Italian Lire (ITL)', 1 / ITLPerEuros);
  cuBEF := RegisterConversionType(cbEuroCurrency, 'Belgian Francs (BEF)', 1 / BEFPerEuros);
  cuNLG := RegisterConversionType(cbEuroCurrency, 'Dutch Guilders (NLG)', 1 / NLGPerEuros);
  cuATS := RegisterConversionType(cbEuroCurrency, 'Austrian Schillings (ATS)', 1 / ATSPerEuros);
  cuPTE := RegisterConversionType(cbEuroCurrency, 'Portuguese Escudos (PTE)', 1 / PTEPerEuros);
  cuFIM := RegisterConversionType(cbEuroCurrency, 'Finnish Marks (FIM)', 1 / FIMPerEuros);
  cuGRD := RegisterConversionType(cbEuroCurrency, 'Greek Drachmas (GRD)', 1 / GRDPerEuros);
  cuLUF := RegisterConversionType(cbEuroCurrency, 'Luxembourg Francs (LUF)', 1 / LUFPerEuros);
end.
