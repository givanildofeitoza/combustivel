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
  UAbastecimentoRepositorio in 'REPOSITORIO\UAbastecimentoRepositorio.pas',
  UAbastecimentoSerivo in 'APLICACAO\UAbastecimentoSerivo.pas',
  FrmBomba in 'UI\FrmBomba.pas' {_FrmBomba},
  FrmTanque in 'UI\FrmTanque.pas' {_FrmTanque},
  FrmAbastecimento in 'UI\FrmAbastecimento.pas' {_FrmAbastecimento},
  UTanqueServico in 'APLICACAO\UTanqueServico.pas',
  UBombaServico in 'APLICACAO\UBombaServico.pas',
  UAbastecimentoRelatorio in 'UI\Relatorios\UAbastecimentoRelatorio.pas' {_FrmRelatorio},
  UISQLquery in 'REPOSITORIO\Interface\UISQLquery.pas',
  UDACquery in 'REPOSITORIO\ConexoesAdapter\UDACquery.pas',
  UDBXquery in 'REPOSITORIO\ConexoesAdapter\UDBXquery.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(T_FrmRelatorio, _FrmRelatorio);
  Application.Run;
end.
