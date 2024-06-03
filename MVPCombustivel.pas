unit MVPCombustivel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Data.DbxSqlite, Vcl.StdCtrls, Vcl.Buttons, UBombaRepositorio,
  UTanqueRepositorio, UAbastecimentoRepositorio, UBombaServico, UTanqueServico,
  UAbastecimentoSerivo, Datasnap.DBClient, Datasnap.Provider;

type
  TForm2 = class(TForm)
    qrPadrao: TSQLQuery;
    ConexaoSQLITE: TSQLConnection;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    FBombaRepositorio : TbombaRepositorio;
    FTanquRepositorio : TTanqueRepositorio;
    FAbastecimentoRepositorio : TAbastecimentoRepositorio;
    FBombaServico : TbombaServico;
    FTanquServico : TTanqueServico;
    FAbastecimentoServico : TAbastecimentoServico;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses
  bomba, FrmTanque, FrmBomba, FrmAbastecimento, UAbastecimentoRelatorio;

{$R *.dfm}

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
   _FrmBomba:=T_FrmBomba.Create(Self,FBombaServico,FTanquServico);
   _FrmBomba.ShowModal();
   _FrmBomba.Release;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
   _FrmTanque := T_FrmTanque.Create(Self,FTanquServico);
   _FrmTanque.ShowModal();
   _FrmTanque.Release;
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
    _FrmAbastecimento := T_FrmAbastecimento.Create(Self,FAbastecimentoServico,FTanquServico, FBombaServico);
    _FrmAbastecimento.ShowModal();
    _FrmAbastecimento.Release;
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
var
  qtdLitrosTotal,somaTotal,totalDisel,totalGasolina : double;
begin
   _FrmRelatorio := T_FrmRelatorio.Create(Self);
   Application.CreateForm(T_FrmRelatorio, _FrmRelatorio);

   _FrmRelatorio.SQLDataSet1.SQLConnection := ConexaoSQLITE;
   _FrmRelatorio.SQLQuery1.SQL.Clear;
   _FrmRelatorio.SQLDataSet1.CommandText:=' SELECT A.ID,A.DATA,A.VALOR,A.IMPOSTO,A.LITROS,'
        +' B.NOMEBOMBA,T.COMBUSTIVEL'
        +' FROM ABASTECIMENTO AS A, BOMBA AS B, TANQUE AS T '
        +' WHERE B.ID = A.IDBOMBA AND B.IDTANQUE = T.ID '
        +' AND DATA BETWEEN "2024-06-01" AND "2024-06-30" ORDER BY A.ID,A.IDBOMBA';
   _FrmRelatorio.SQLDataSet1.Open;
   _FrmRelatorio.ClientDataSet1.OPEN;
   _FrmRelatorio.ClientDataSet1.Refresh;
   _FrmRelatorio.labelData1.Caption :='01/06/2024';
   _FrmRelatorio.labelData2.Caption :='30/06/2024';

   qtdLitrosTotal:= 0;
   somaTotal     := 0;
   totalGasolina := 0;
   totalDisel    := 0;
   _FrmRelatorio.ClientDataSet1.First;
   while not _FrmRelatorio.ClientDataSet1.Eof do
   begin
       qtdLitrosTotal := qtdLitrosTotal + _FrmRelatorio.ClientDataSet1LITROS.AsFloat;
       somaTotal:= somaTotal +  _FrmRelatorio.ClientDataSet1VALOR.AsFloat;
       if _FrmRelatorio.ClientDataSet1COMBUSTIVEL.AsString = 'GASOLINA' then
         totalGasolina := totalGasolina + _FrmRelatorio.ClientDataSet1LITROS.AsFloat
       else
         totalDisel := totalDisel + _FrmRelatorio.ClientDataSet1LITROS.AsFloat;

      _FrmRelatorio.ClientDataSet1.Next;
   end;
   _FrmRelatorio.lblGas.Caption :=FormatFloat('###,##0.00',totalGasolina);
   _FrmRelatorio.lblDisel.Caption :=FormatFloat('###,##0.00',totalDisel);
   _FrmRelatorio.lblQtdTotal.Caption :=FormatFloat('###,##0.00',qtdLitrosTotal);
   _FrmRelatorio.LblSomaToal.Caption :=FormatFloat('###,##0.00',somaTotal);
   _FrmRelatorio.RLReport1.Preview();
end;

procedure TForm2.FormShow(Sender: TObject);
begin
    FBombaRepositorio := TbombaRepositorio.Create(qrPadrao);
    FTanquRepositorio := TTanqueRepositorio.Create(qrPadrao);
    FAbastecimentoRepositorio := TAbastecimentoRepositorio.Create(qrPadrao);

    FBombaServico := TbombaServico.Create(FBombaRepositorio);
    FTanquServico := TTanqueServico.Create(FTanquRepositorio);
    FAbastecimentoServico := TAbastecimentoServico.Create(FBombaRepositorio,
                                                        FTanquRepositorio,
                                                        FAbastecimentoRepositorio);
end;

end.
