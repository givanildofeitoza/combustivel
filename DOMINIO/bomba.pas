unit bomba;

interface

type
  TBomba = class
  private
    FId: Integer;
    FNomeBomba: string;
    FIdTanque: Integer;
  public
    property Id: Integer read FId write FId;
    property NomeBomba: string read FNomeBomba write FNomeBomba;
    property IdTanque: Integer read FIdTanque write FIdTanque;

    procedure validar;
  end;

implementation

uses
  System.SysUtils;

{ TBomba }

procedure TBomba.validar;
begin
    if FNomeBomba = string.empty then
       raise Exception.Create('Nome da bomba não pode ser vazio!');

    if FIdTanque = 0 then
       raise Exception.Create('Id do tanque não pode ser zero!');
end;

end.
