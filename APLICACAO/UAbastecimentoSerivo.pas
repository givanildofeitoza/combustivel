unit UAbastecimentoSerivo;

interface

uses
  UBombaRepositorio, UTanqueRepositorio, UAbastecimentoRepositorio, tanque,
  bomba,System.Generics.Collections;

type

TAbastecimentoDTO = class
 private
    FId : Integer;
    FData: TDate;
    FValor: Double;
    FVunitario: Double;
    FLitros: Double;
    FAliquota: Double;
    FImposto: Double;
    FIdBomba: Integer;
    FBomba : TBomba;
    FTanque : TTanque;
  public
    property Id: integer read FId write FId;
    property Data: TDate read FData write FData;
    property Valor: Double read FValor write FValor;
    property Vunitario: Double read FVunitario write FVunitario;
    property Litros: Double read FLitros write FLitros;
    property Imposto: Double read FImposto write FImposto;
    property Aliquota: Double read FAliquota write FAliquota;
    property IdBomba: Integer read FIdBomba write FIdBomba;
    property Bomba: TBomba read FBomba write FBomba;
    property Tanque: TTanque read FTanque write FTanque;
end;

TAbastecimentoServico=class
     private
        FBombaRepositorio : TBombaRepositorio;
        FTanqueRepositorio : TTanqueRepositorio;
        FAbastecimentoRepositorio : TAbastecimentoRepositorio;
     public
        function Abastecer(pAbastecimento : TAbastecimentoDTO): TAbastecimentoDTO;
        function ObterAbastecimentoCompleto(Id : integer) : TAbastecimentoDTO;
        function ObterAbastecimentoCompletoPorData(pDataInicio,pDataFim : TDate) : TObjectList<TAbastecimentoDTO>;
        function calcularImposto(pBaseDeCalculo,pAliquota : Double):Double;
       constructor Create(pBombaRepositorio : TBombaRepositorio;
        pTanqueRepositorio : TTanqueRepositorio;
        pAbastecimentoRepositorio : TAbastecimentoRepositorio);
end;


implementation

uses
  abastecimento, System.SysUtils;

{ TAbastecimentoServico }

 constructor TAbastecimentoServico.Create(pBombaRepositorio: TBombaRepositorio;
  pTanqueRepositorio: TTanqueRepositorio;
  pAbastecimentoRepositorio: TAbastecimentoRepositorio);
begin
     FBombaRepositorio := pBombaRepositorio;
     FTanqueRepositorio := pTanqueRepositorio;
     FAbastecimentoRepositorio := pAbastecimentoRepositorio;
end;

function TAbastecimentoServico.ObterAbastecimentoCompleto(
  Id: integer): TAbastecimentoDTO;
var
  AbastecimentoDTO : TAbastecimentoDTO;
  Abastecimento :  TAbastecimento;
  bomba : TBomba;
  tanque : TTanque;
begin
   AbastecimentoDTO := TAbastecimentoDTO.Create;

   Abastecimento         := FAbastecimentoRepositorio.ObeterPorId(Id);
   AbastecimentoDTO.FId  :=  Abastecimento.Id;
   AbastecimentoDTO.Data    :=  Abastecimento.Data;
   AbastecimentoDTO.Valor   :=  Abastecimento.Valor;
   AbastecimentoDTO.Litros  := Abastecimento.Litros;
   AbastecimentoDTO.Imposto := Abastecimento.Imposto;
   AbastecimentoDTO.FBomba  :=  FBombaRepositorio.ObterPorId(Abastecimento.IdBomba);
   AbastecimentoDTO.Tanque  :=  FTanqueRepositorio.ObterPorId(AbastecimentoDTO.FBomba.IdTanque);

   Result := AbastecimentoDTO;
end;

function TAbastecimentoServico.ObterAbastecimentoCompletoPorData(pDataInicio,
  pDataFim: TDate): TObjectList<TAbastecimentoDTO>;
begin

end;

function TAbastecimentoServico.Abastecer(
  pAbastecimento: TAbastecimentoDTO): TAbastecimentoDTO;
 var
   abastecimento : TAbastecimento;
begin
     abastecimento          :=  TAbastecimento.Create;
     abastecimento.Data     :=  now;
     abastecimento.IdBomba  :=  pAbastecimento.IdBomba;
     abastecimento.Litros   :=  pAbastecimento.Litros;
     abastecimento.Vunitario:=  pAbastecimento.FVunitario;
     abastecimento.Aliquota:=   13.00;
     abastecimento.Imposto :=  calcularImposto(pAbastecimento.Valor,abastecimento.Aliquota);
     abastecimento.Valor   :=  pAbastecimento.Valor;
     abastecimento.Validar;
     try
        FAbastecimentoRepositorio.GerarAbastecimento(abastecimento);
     finally
        abastecimento.Free;
     end;

     Result := pAbastecimento;
end;

function TAbastecimentoServico.calcularImposto(pBaseDeCalculo,
  pAliquota: Double): Double;
begin
     Result :=  (pBaseDeCalculo * pAliquota) / 100;
end;



end.
