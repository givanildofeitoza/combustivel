program MVPCombustivelProjetoTests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  TestUAbastecimentoSerivo in 'TestUAbastecimentoSerivo.pas',
  UAbastecimentoSerivo in '..\APLICACAO\UAbastecimentoSerivo.pas',
  UAbastecimentoRepositorio in '..\REPOSITORIO\UAbastecimentoRepositorio.pas',
  UBombaRepositorio in '..\REPOSITORIO\UBombaRepositorio.pas',
  UTanqueRepositorio in '..\REPOSITORIO\UTanqueRepositorio.pas',
  abastecimento in '..\DOMINIO\abastecimento.pas',
  bomba in '..\DOMINIO\bomba.pas',
  tanque in '..\DOMINIO\tanque.pas',
  UDACquery in '..\REPOSITORIO\ConexoesAdapter\UDACquery.pas',
  UDBXquery in '..\REPOSITORIO\ConexoesAdapter\UDBXquery.pas',
  UISQLquery in '..\REPOSITORIO\Interface\UISQLquery.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

