unit TestUAbastecimentoSerivo;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, bomba, UTanqueRepositorio, System.Generics.Collections, tanque,abastecimento,
  UBombaRepositorio, UAbastecimentoSerivo, UAbastecimentoRepositorio;

type
  // Test methods for class TAbastecimentoServico

 TMockBombaRepositorio = class(TBombaRepositorio)
 public
    // Implemente outros m�todos necess�rios para o MOC
 end;

 TMockTanqueRepositorio = class(TTanqueRepositorio)
 public
    // Implemente outros m�todos necess�rios para o MOC
 end;

TMockAbastecimentoRepositorio = class(TAbastecimentoRepositorio)
  public
    procedure GerarAbastecimento(pAbastecimento : TAbastecimento); override;
  end;


  TestTAbastecimentoServico = class(TTestCase)
  strict private
    FAbastecimentoServico: TAbastecimentoServico;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestcalcularImposto;
    procedure TestAbastecer;
    procedure TestCalcularValorAbastecido;
  end;

implementation

uses
  Data.SqlExpr, System.SysUtils, UISQLquery, UDACquery,
  UDBXquery;


{ TMockAbastecimentoRepositorio }

procedure TMockAbastecimentoRepositorio.GerarAbastecimento(pAbastecimento: TAbastecimento);
begin
  TAbastecimento.Create;
end;

procedure TestTAbastecimentoServico.SetUp;
var
  Query : ISQLquery;
begin
   Query := TDBXquery.Create(TSQLQuery.Create(nil));
  FAbastecimentoServico := TAbastecimentoServico.Create(TMockBombaRepositorio.Create(Query),
                                                        TMockTanqueRepositorio.Create(Query),
                                                        TMockAbastecimentoRepositorio.Create(Query));
end;

{ TestTAbastecimentoServico }

procedure TestTAbastecimentoServico.TearDown;
begin
  FAbastecimentoServico.Free;
  FAbastecimentoServico := nil;
end;

procedure TestTAbastecimentoServico.TestcalcularImposto;
var
  ReturnValue: Double;
  pAliquota: Double;
  pBaseDeCalculo: Double;
begin
  // TODO: Setup method call parameters
  pBaseDeCalculo := 120;
  pAliquota := 10;

  // TODO: Validate method results
  ReturnValue := FAbastecimentoServico.calcularImposto(pBaseDeCalculo, pAliquota);
end;

procedure TestTAbastecimentoServico.TestCalcularValorAbastecido;
var
  ReturnValue: Double;
  pQtdLitros,
  pVunitario: double;
begin
    pVunitario := 5.2;
    pQtdLitros := 2;
    ReturnValue := FAbastecimentoServico.CalcularValorAbastecido(pQtdLitros,pVunitario);
    CheckEquals(FormatCurr('###,##0.00',10.40),FormatCurr('###,##0.00',ReturnValue),'C�lculo do valor abastecido est� incorreto');
end;

procedure TestTAbastecimentoServico.TestAbastecer;
var
  ReturnValue: TAbastecimentoDTO;
  pAbastecimento: TAbastecimentoDTO;
begin
  // TODO: Setup method call parameters
   pAbastecimento:= TAbastecimentoDTO.Create;
   pAbastecimento.Valor := 120;
   pAbastecimento.Data  := now;
   pAbastecimento.Litros := 20;
   pAbastecimento.Aliquota := 13;
   pAbastecimento.Imposto:= 15.60;
   pAbastecimento.IdBomba := 1;
   pAbastecimento.Vunitario := 2.8;

   // TODO: Validate method results
   FAbastecimentoServico.Abastecer(pAbastecimento);
   CheckEquals(FormatCurr('###,##0.00',pAbastecimento.Imposto),FormatCurr('###,##0.00',FAbastecimentoServico.calcularImposto(120, 13)) ,'C�lculo do imposto diverge da al�quota de 13%');
   pAbastecimento.Free;
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTAbastecimentoServico.Suite);
end.

