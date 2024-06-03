unit UBombaRepositorio;

interface

uses
  bomba, System.Generics.Collections, Data.SqlExpr;

type TBombaRepositorio = class
  private
    FSQLQuery : TSQLQuery;
  public
    procedure Adicionar(pBomba : TBomba);
    procedure Remover(pId : integer);
    function ObterPorId(pId : integer) : TBomba; virtual;
    function ObterTodas() : TObjectList<TBomba>;

    constructor Create(pSQLQuery : TSQLQuery);
end;

implementation

uses
  System.SysUtils;

{ TBombaRepositorio }

constructor TBombaRepositorio.Create(pSQLQuery: TSQLQuery);
begin
  FSQLQuery := pSQLQuery;
end;

procedure TBombaRepositorio.Adicionar(pBomba: TBomba);
begin
   pBomba.validar;
   try
      FSQLQuery.SQL.Clear;
      FSQLQuery.SQL.Add('INSERT INTO BOMBA(NOMEBOMBA,IDTANQUE) VALUES (');
      FSQLQuery.SQL.Add(quotedstr(pBomba.NomeBomba)+',');
      FSQLQuery.SQL.Add(quotedstr(pBomba.IdTanque.ToString())+')');
      FSQLQuery.ExecSQL();
   except
      raise Exception.Create('N�o foi poss�vel cadastrar uma nova bomba!');
   end;
end;

function TBombaRepositorio.ObterPorId(pId: integer): TBomba;
var
  bomba : TBomba;
begin
    FSQLQuery.SQL.Clear;
    FSQLQuery.SQL.Add('SELECT * FROM BOMBA WHERE ID='+quotedstr(pId.ToString()));
    FSQLQuery.Open();

    bomba    := Tbomba.Create;
    bomba.Id := FSQLQuery.FieldByName('ID').AsInteger;
    bomba.NomeBomba := FSQLQuery.FieldByName('NOMEBOMBA').AsString;
    bomba.IdTanque  := FSQLQuery.FieldByName('IDTANQUE').AsInteger;

    Result := bomba;
end;

function TBombaRepositorio.ObterTodas: TObjectList<TBomba>;
var
  bomba : TBomba;
  bombaLista :  TObjectList<TBomba>;
begin
    bombaLista := TObjectList<TBomba>.Create();
    FSQLQuery.SQL.Clear;
    FSQLQuery.SQL.Add('SELECT * FROM BOMBA');
    FSQLQuery.Open();

    if FSQLQuery.FieldByName('NOMEBOMBA').AsString <> string.Empty then
    begin
        FSQLQuery.First;
        while not FSQLQuery.Eof do
        begin
          bomba    := TBomba.Create;
          bomba.Id := FSQLQuery.FieldByName('ID').AsInteger;
          bomba.NomeBomba := FSQLQuery.FieldByName('NOMEBOMBA').AsString;
          bomba.IdTanque  := FSQLQuery.FieldByName('IDTANQUE').AsInteger;
          bombaLista.Add(bomba);

          FSQLQuery.Next;
        end;
    end;

    Result := bombaLista;
end;

procedure TBombaRepositorio.Remover(pId: integer);
begin
    if pId = 0 then
      raise Exception.Create('Id N�o ode ser zero!');

    try
       FSQLQuery.SQL.Clear;
       FSQLQuery.SQL.Add('DELETE FROM BOMBA WHERE ID='+quotedstr(pId.ToString()));
       FSQLQuery.ExecSQL();
    except
        raise Exception.Create('N�o foi poss�vel excluir bomba!');
    end;
end;

end.
