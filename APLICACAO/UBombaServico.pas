unit UBombaServico;

interface

uses
  UBombaRepositorio, bomba, System.Generics.Collections;

type TBombaServico=class
  private
     FBombaRepositorio : TBombaRepositorio;
  public
     procedure CadastrarNovaBomba(pBomba : TBomba);
     function ObterBombaPorId(pId : integer) : TBomba;
     function ObterTodasAsBombas : TObjectList<TBomba>;
     constructor Create(pBombaRepositorio : TBombaRepositorio);
end;

implementation

{ TBombaServico }

constructor TBombaServico.Create(pBombaRepositorio: TBombaRepositorio);
begin
   FBombaRepositorio := pBombaRepositorio;
end;

procedure TBombaServico.CadastrarNovaBomba(pBomba : TBomba);
begin
    pBomba.validar;
    FBombaRepositorio.Adicionar(pBomba);
end;

function TBombaServico.ObterBombaPorId(pId: integer): TBomba;
begin
    Result :=  FBombaRepositorio.ObterPorId(pId);
end;

function TBombaServico.ObterTodasAsBombas: TObjectList<TBomba>;
begin
    Result := FBombaRepositorio.ObterTodas;
end;

end.
