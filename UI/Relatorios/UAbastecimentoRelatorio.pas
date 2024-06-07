unit UAbastecimentoRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data.FMTBcd, Data.DB,
  Data.SqlExpr, Datasnap.Provider, Datasnap.DBClient, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  T_FrmRelatorio = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLBand2: TRLBand;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    ClientDataSet1VALOR: TFloatField;
    ClientDataSet1IMPOSTO: TFloatField;
    ClientDataSet1LITROS: TFloatField;
    RLDBText5: TRLDBText;
    ClientDataSet1NOMEBOMBA: TWideMemoField;
    ClientDataSet1COMBUSTIVEL: TWideMemoField;
    RLDBText6: TRLDBText;
    RLBand3: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLDBText7: TRLDBText;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    labelData1: TRLLabel;
    LabelData2: TRLLabel;
    RLLabel12: TRLLabel;
    RLBand4: TRLBand;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    lblQtdTotal: TRLLabel;
    LblSomaToal: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    lblGas: TRLLabel;
    lblDisel: TRLLabel;
    RLLabel16: TRLLabel;
    ConexaoDACRel: TFDConnection;
    FDQrpadrao: TFDQuery;
    ClientDataSet1ID: TIntegerField;
    ClientDataSet1DATA: TDateField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _FrmRelatorio: T_FrmRelatorio;

implementation

{$R *.dfm}



end.
