unit UTanqueRepositorio;

interface
 uses
   System.Generics.Collections, Data.SqlExpr, tanque,EnumTipoCombustivel;

 type TTanqueRepositorio=class
    private
       FSQLQuery : TSQLQuery;
    public
       procedure Adicionar(pTanque : TTanque);
       procedure Remover(pId : integer);
       function ObterPorId(pId : integer) : TTanque;
       function ObterTodas() : TObjectList<TTanque>;

       constructor Create(pSQLQuery : TSQLQuery);
 end;

implementation

uses
  System.SysUtils;

{ TTanqueRepositorio }

constructor TTanqueRepositorio.Create(pSQLQuery: TSQLQuery);
begin
    FSQLQuery := pSQLQuery;
end;

procedure TTanqueRepositorio.Adicionar(pTanque: TTanque);
begin
    pTanque.Validar;
    try
       FSQLQuery.SQL.Clear;
       FSQLQuery.SQL.Add('INSERT INTO TANQUE(NOMETANQUE,COMBUSTIVEL) VALUES (');
       FSQLQuery.SQL.Add(quotedstr(pTanque.NomeTanque)+',');
       FSQLQuery.SQL.Add(quotedstr(pTanque.Combustivel.Nome)+')');
       FSQLQuery.ExecSQL();
    except
       raise Exception.Create('Não foi possível cadastrar uma novo tanque!');
    end;
end;

function TTanqueRepositorio.ObterPorId(pId: integer): TTanque;
var
  tanque : TTanque;
begin
    FSQLQuery.SQL.Clear;
    FSQLQuery.SQL.Add('SELECT * FROM TANQUE WHERE ID ='+QuotedStr(pId.ToString()));
    FSQLQuery.Open();

    tanque    := TTanque.Create;
    tanque.Id := FSQLQuery.FieldByName('ID').AsInteger;
    tanque.NomeTanque := FSQLQuery.FieldByName('NOMETANQUE').AsString;

    if FSQLQuery.FieldByName('COMBUSTIVEL').AsString = 'GASOLINA'  then
       tanque.Combustivel := ETipoCombustivel.GASOLINA
    else if FSQLQuery.FieldByName('COMBUSTIVEL').AsString = 'DISEL'then
       tanque.Combustivel := ETipoCombustivel.DISEL;

    Result := tanque;
end;

function TTanqueRepositorio.ObterTodas: TObjectList<TTanque>;
var
  tanque : TTanque;
  tanqueLista :  TObjectList<TTanque>;
begin
    tanqueLista := TObjectList<TTanque>.Create();
    FSQLQuery.SQL.Clear;
    FSQLQuery.SQL.Add('SELECT * FROM TANQUE');
    FSQLQuery.Open();

    if FSQLQuery.FieldByName('NOMETANQUE').AsString <> string.Empty then
    begin
        FSQLQuery.First;
        while not FSQLQuery.Eof do
        begin
          tanque    := TTanque.Create;
          tanque.Id := FSQLQuery.FieldByName('ID').AsInteger;
          tanque.NomeTanque := FSQLQuery.FieldByName('NOMETANQUE').AsString;

          if FSQLQuery.FieldByName('COMBUSTIVEL').AsString = 'GASOLINA'  then
             tanque.Combustivel := ETipoCombustivel.GASOLINA
          else if FSQLQuery.FieldByName('COMBUSTIVEL').AsString = 'DISEL'then
             tanque.Combustivel := ETipoCombustivel.DISEL;

          tanqueLista.Add(tanque);

          FSQLQuery.Next;
        end;
    end;

    Result := tanqueLista;
end;

procedure TTanqueRepositorio.Remover(pId: integer);
begin
    if pId = 0 then
      raise Exception.Create('Id Não ode ser zero!');

    try
       FSQLQuery.SQL.Clear;
       FSQLQuery.SQL.Add('DELETE FROM TANQUE WHERE ID='+quotedstr(pId.ToString()));
       FSQLQuery.ExecSQL();
    except
        raise Exception.Create('Não foi possível excluir Tanque!');
    end;
end;

end.
