unit abastecimento;

interface

uses
  System.SysUtils;

type
  TAbastecimento = class
  private
    FId: Integer;
    FData: TDate;
    FValor: Double;
    FLitros: Double;
    FVunitario: Double;
    FImposto: Double;
    FAliquota: Double;
    FIdBomba: Integer;
  public
    property Id: Integer read FId write FId;
    property Data: TDate read FData write FData;
    property Valor: Double read FValor write FValor;
    property Litros: Double read FLitros write FLitros;
    property Vunitario: Double read FVunitario write FVunitario;
    property Imposto: Double read FImposto write FImposto;
    property Aliquota: Double read FAliquota write FAliquota;
    property IdBomba: Integer read FIdBomba write FIdBomba;

    procedure Validar;
  end;

implementation

{ TAbastecimentos }

procedure TAbastecimento.Validar;
begin
    if not (FValor > 0) then
      raise Exception.Create('Valor deve ser maior que zero!');

    if not (FAliquota = 13) then
      raise Exception.Create('Aliquota deve ser 13%!');

    if FIdBomba = 0 then
      raise Exception.Create('Informe o Id da bomba!');
end;

end.
