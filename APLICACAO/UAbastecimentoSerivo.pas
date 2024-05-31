unit UAbastecimentoSerivo;

interface

uses
  UBombaRepositorio, UTanqueRepositorio, UAbastecimentoRepositorio, tanque,
  bomba;

type

TAbastecimentoDTO = class
 private
    FData: TDate;
    FValor: Double;
    FLitros: Double;
    FImposto: Double;
    FIdBomba: Integer;
    FBomba : TBomba;
    FTanque : TTanque;
  public
    property Data: TDate read FData write FData;
    property Valor: Double read FValor write FValor;
    property Litros: Double read FLitros write FLitros;
    property Imposto: Double read FImposto write FImposto;
    property IdBomba: Integer read FIdBomba write FIdBomba;
    property Bomba: TBomba read FBomba write FBomba;
    property Tanque: TTanque read FTanque write FTanque;
end;

TAbastecimentoServico=class
     private
        FBombaRepositorio : TBombaRepositorio;
        FTanqueRepositorio : TTanqueRepositorio;
        FAbastecimentoRepositorio : TAbastecimentoRepositorio;
        function calcularImposto(pBaseDeCalculo,pAliquota : Double):Double;
     public
        function Abastecer(pAbastecimento : TAbastecimentoDTO):Boolean;

       constructor Create(pBombaRepositorio : TBombaRepositorio;
        pTanqueRepositorio : TTanqueRepositorio;
        pAbastecimentoRepositorio : TAbastecimentoRepositorio);
end;


implementation

uses
  abastecimento;

{ TAbastecimentoServico }

 constructor TAbastecimentoServico.Create(pBombaRepositorio: TBombaRepositorio;
  pTanqueRepositorio: TTanqueRepositorio;
  pAbastecimentoRepositorio: TAbastecimentoRepositorio);
begin
     FBombaRepositorio := pBombaRepositorio;
     FTanqueRepositorio := pTanqueRepositorio;
     FAbastecimentoRepositorio := pAbastecimentoRepositorio;
end;

function TAbastecimentoServico.Abastecer(
  pAbastecimento: TAbastecimentoDTO): Boolean;
 var
   bomba : TBomba;
   tanque : TTanque;
   abastecimento : TAbastecimento;
begin
     abastecimento         :=  TAbastecimento.Create;
     abastecimento.Data    :=  pAbastecimento.Data;
     abastecimento.IdBomba :=  pAbastecimento.IdBomba;
     abastecimento.Litros  :=  pAbastecimento.Litros;
     abastecimento.Aliquota:=  13.00;
     abastecimento.Imposto :=  calcularImposto(abastecimento.Valor,abastecimento.Aliquota);
     abastecimento.Valor   :=  pAbastecimento.Valor + abastecimento.Imposto;
     try
        FTanqueRepositorio.Adicionar(abastecimento);
     finally
        abastecimento.Free;
     end;
end;

function TAbastecimentoServico.calcularImposto(pBaseDeCalculo,
  pAliquota: Double): Double;
begin
     Result :=  (pBaseDeCalculo * pAliquota) / 100;
end;



end.