program MVPCombustivelProjeto;

uses
  Vcl.Forms,
  MVPCombustivel in 'MVPCombustivel.pas' {Form2},
  bomba in 'DOMINIO\bomba.pas',
  tanque in 'DOMINIO\tanque.pas',
  abastecimento in 'DOMINIO\abastecimento.pas',
  EnumTipoCombustivel in 'DOMINIO\comuns\enuns\EnumTipoCombustivel.pas',
  UBombaRepositorio in 'REPOSITORIO\UBombaRepositorio.pas',
  UTanqueRepositorio in 'REPOSITORIO\UTanqueRepositorio.pas',
  UAbastecimentoRepositorio in 'REPOSITORIO\UAbastecimentoRepositorio.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
