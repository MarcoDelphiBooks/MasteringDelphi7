�
 TFORM1 0�  TPF0TForm1Form1LeftNTop� WidthEHeight�CaptionIndyDbClientColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	OnCreate
FormCreatePixelsPerInch`
TextHeight TBevelBevel1LeftTopHWidthQHeight9  TLabelServerLeftTopWidthHeightCaptionServer  TLabelLabel1Left Top� Width,HeightCaptionCompanyFocusControlDBEdit1  TLabelLabel2Left Top� Width&HeightCaptionCompID  TLabelLabel3Left Top� Width&HeightCaptionAddressFocusControlDBEdit3  TLabelLabel4Left Top� WidthHeightCaptionStateFocusControlDBEdit4  TLabelLabel5Left`Top� Width$HeightCaptionCountryFocusControlDBEdit5  TLabelLabel6Left Top WidthHeightCaptionEmailFocusControlDBEdit6  TLabelLabel7Left TopHWidth%HeightCaptionContactFocusControlDBEdit7  TDBTextDBText1LeftPTop� WidthAHeight	DataFieldCompID
DataSourceDataSource1  TLabelLabel8LeftpTopxWidthHeightCaptionLog:  TEdit
EditServerLeft8TopWidthyHeightTabOrder Text	127.0.0.1  TDBEditDBEdit1Left Top� Width0Height	DataFieldCompany
DataSourceDataSource1TabOrder  TDBEditDBEdit3Left Top� Width1Height	DataFieldAddress
DataSourceDataSource1TabOrder  TDBEditDBEdit4Left Top Width1Height	DataFieldState
DataSourceDataSource1TabOrder  TDBEditDBEdit5Left`Top Width� Height	DataFieldCountry
DataSourceDataSource1TabOrder  TDBEditDBEdit6Left Top0Width1Height	DataFieldEmail
DataSourceDataSource1TabOrder  TDBEditDBEdit7Left TopXWidth1Height	DataFieldContact
DataSourceDataSource1TabOrder  TDBNavigatorDBNavigator1Left(TopXWidth� Height
DataSourceDataSource1TabOrder  TListBoxlbLogLeftpTop� Width� Height� 
ItemHeightTabOrder  TButton	btnDeleteLeft�TopWidthiHeightCaption&Delete All SentTabOrder	OnClickbtnDeleteClick  TButtonbtnSendLeft�Top0WidthiHeightCaptionSend All (&Thread)TabOrder
OnClickbtnSendClick  TClientDataSetcds
Aggregates FileNameclientdb.cds	FieldDefsNameCompanyDataTypeftStringSize2 NameCompIDDataTypeftFloat NameAddressDataTypeftStringSized NameStateDataTypeftStringSize NameCountryDataTypeftStringSize NameEmailDataTypeftStringSize( NameContactDataTypeftStringSize(  	IndexDefs Params 	StoreDefs	Left� Top( TStringField
cdsCompany	FieldNameCompanySize2  TFloatField	cdsCompID	FieldNameCompID  TStringField
cdsAddress	FieldNameAddressSized  TStringFieldcdsState	FieldNameStateSize  TStringField
cdsCountry	FieldNameCountry  TStringFieldcdsEmail	FieldNameEmailSize(  TStringField
cdsContact	FieldNameContactSize(   TDataSourceDataSource1DataSetcdsLeft`Top#   