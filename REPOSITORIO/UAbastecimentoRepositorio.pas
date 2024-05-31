unit UAbastecimentoRepositorio;

interface

uses
  System.Generics.Collections, Data.SqlExpr, abastecimento;

type TAbastecimentoRepositorio = class
  private
    FSQLQuery : TSQLQuery;
  public
    procedure GerarAbastecimento(pAbastecimento : TAbastecimento);
    function ObeterPorId(pId : integer) : TAbastecimento;
    function ObeterPorData(pDataInicial,pDataFinal : TDate) : TObjectList<TAbastecimento>;
    function ObeterPorBomda(pDataInicial,pDataFinal : TDate) : TObjectList<TAbastecimento>;

    Constructor Create(pQuery : TSQLQuery);
end;

implementation

uses
  System.SysUtils;

{ TAbastecimentoRepositorio }

constructor TAbastecimentoRepositorio.Create(pQuery : TSQLQuery);
begin
    FSQLQuery := pQuery;
end;

procedure TAbastecimentoRepositorio.GerarAbastecimento(
  pAbastecimento: TAbastecimento);
begin
   pAbastecimento.validar;
   try
      FSQLQuery.SQL.Clear;
      FSQLQuery.SQL.Add('INSERT INTO ABASTECIMENTO(ALIQUOTA,LITROS,DATA,VALOR,IMPOSTO,IDBOMBA) VALUES (');
      FSQLQuery.SQL.Add(quotedstr(FloatToStr(pAbastecimento.Aliquota))+',');
      FSQLQuery.SQL.Add(quotedstr(FloatToStr(pAbastecimento.Litros))+',');
      FSQLQuery.SQL.Add(quotedstr(FormatDateTime('yyyy-mm-dd',pAbastecimento.Data))+',');
      FSQLQuery.SQL.Add(quotedstr(FloatToStr(pAbastecimento.Valor))+',');
      FSQLQuery.SQL.Add(quotedstr(FloatToStr(pAbastecimento.Imposto))+',');
      FSQLQuery.SQL.Add(quotedstr(pAbastecimento.IdBomba.ToString())+')');
      FSQLQuery.ExecSQL();
   except
      raise Exception.Create('Não foi possível gerar novo abastecimento!');
   end;
end;

function TAbastecimentoRepositorio.ObeterPorBomda(pDataInicial,
  pDataFinal: TDate): TObjectList<TAbastecimento>;
var
  abastecimento : TAbastecimento;
  abastecimentoLista :  TObjectList<TAbastecimento>;
begin
    abastecimentoLista := TObjectList<TAbastecimento>.Create();
    FSQLQuery.SQL.Clear;
    FSQLQuery.SQL.Add('SELECT * FROM ABASTECIMENTO');
    FSQLQuery.Open();

    if not (FSQLQuery.FieldByName('IDBOMBA').AsInteger = 0) then
    begin
        FSQLQuery.First;
        while not FSQLQuery.Eof do
        begin
          abastecimento    := TAbastecimento.Create;
          abastecimento.Id := FSQLQuery.FieldByName('ID').AsInteger;
          abastecimento.Data   := FSQLQuery.FieldByName('DATA').AsDateTime;
          abastecimento.Litros := FSQLQuery.FieldByName('LITROS').AsFloat;
          abastecimento.Aliquota := FSQLQuery.FieldByName('ALIQUOTA').AsFloat;
          abastecimento.Valor    := FSQLQuery.FieldByName('VALOR').AsFloat;
          abastecimento.Imposto  := FSQLQuery.FieldByName('IMPOSTO').AsFloat;
          abastecimento.IdBomba  := FSQLQuery.FieldByName('IDBOMBA').AsInteger;
          abastecimentoLista.Add(abastecimento);

          FSQLQuery.Next;
        end;
    end;

    Result := abastecimentoLista;
end;

function TAbastecimentoRepositorio.ObeterPorData(pDataInicial,
  pDataFinal: TDate): TObjectList<TAbastecimento>;
var
  abastecimento : TAbastecimento;
  abastecimentoLista :  TObjectList<TAbastecimento>;
begin
    abastecimentoLista := TObjectList<TAbastecimento>.Create();
    FSQLQuery.SQL.Clear;
    FSQLQuery.SQL.Add('SELECT * FROM ABASTECIMENTO WHERE DATA BETWEEN "'+FormatDateTime('yyyy-mm-dd',pDataInicial)+'" AND "'
       +FormatDateTime('yyyy-mm-dd',pDataFinal)+'"');
    FSQLQuery.Open();

    if not (FSQLQuery.FieldByName('IDBOMBA').AsInteger = 0) then
    begin
        FSQLQuery.First;
        while not FSQLQuery.Eof do
        begin
          abastecimento    := TAbastecimento.Create;
          abastecimento.Id := FSQLQuery.FieldByName('ID').AsInteger;
          abastecimento.Data   := FSQLQuery.FieldByName('DATA').AsDateTime;
          abastecimento.Valor  := FSQLQuery.FieldByName('VALOR').AsFloat;
          abastecimento.Litros := FSQLQuery.FieldByName('LITROS').AsFloat;
          abastecimento.Imposto  := FSQLQuery.FieldByName('IMPOSTO').AsFloat;
          abastecimento.Aliquota := FSQLQuery.FieldByName('ALIQUOTA').AsFloat;
          abastecimento.IdBomba  := FSQLQuery.FieldByName('IDBOMBA').AsInteger;
          abastecimentoLista.Add(abastecimento);

          FSQLQuery.Next;
        end;
    end;

    Result := abastecimentoLista;
end;

function TAbastecimentoRepositorio.ObeterPorId(pId: integer): TAbastecimento;
var
  abastecimento : TAbastecimento;
begin
    FSQLQuery.SQL.Clear;
    FSQLQuery.SQL.Add('SELECT * FROM ABASTECIMENTO WHERE ID ='+QuotedStr(pId.ToString()));
    FSQLQuery.Open();

    abastecimento    := TAbastecimento.Create;
    abastecimento.Id := FSQLQuery.FieldByName('ID').AsInteger;
    abastecimento.Data   := FSQLQuery.FieldByName('DATA').AsDateTime;
    abastecimento.Valor  := FSQLQuery.FieldByName('VALOR').AsFloat;
    abastecimento.Litros := FSQLQuery.FieldByName('LITROS').AsFloat;
    abastecimento.Imposto  := FSQLQuery.FieldByName('IMPOSTO').AsFloat;
    abastecimento.Aliquota := FSQLQuery.FieldByName('ALIQUOTA').AsFloat;
    abastecimento.IdBomba  := FSQLQuery.FieldByName('IDBOMBA').AsInteger;

    Result := abastecimento;
end;

end.
