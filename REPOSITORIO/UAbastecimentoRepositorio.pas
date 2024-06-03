unit UAbastecimentoRepositorio;

interface

uses
  System.Generics.Collections, Data.SqlExpr, abastecimento;

type TAbastecimentoRepositorio = class
  private
    FSQLQuery : TSQLQuery;
  public
    function ObeterPorId(pId : integer) : TAbastecimento;
    function ObeterPorData(pDataInicial,pDataFinal : TDate) : TObjectList<TAbastecimento>;
    function ObeterPorBomda(pDataInicial,pDataFinal : TDate) : TObjectList<TAbastecimento>;
    procedure GerarAbastecimento(pAbastecimento : TAbastecimento); virtual;
    function FormatarDataBanco(pData:String):TDate;

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

function TAbastecimentoRepositorio.FormatarDataBanco(pData: String): TDate;
var
  DataFormatada: TDate;
  fmt: TFormatSettings;
begin
  fmt := TFormatSettings.Create;
  fmt.ShortDateFormat := 'yyyy-mm-dd';
  fmt.DateSeparator := '-';
  DataFormatada := StrToDate(pData, fmt);

     Result :=  StrToDate(formatdateTime('dd/mm/yyyy',DataFormatada));
end;

procedure TAbastecimentoRepositorio.GerarAbastecimento(pAbastecimento: TAbastecimento);
begin
   pAbastecimento.validar;
   try
      FSQLQuery.SQL.Clear;
      FSQLQuery.SQL.Add('INSERT INTO ABASTECIMENTO(VUNITARIO,ALIQUOTA,LITROS,DATA,VALOR,IMPOSTO,IDBOMBA) VALUES (');
      FSQLQuery.SQL.Add(quotedstr(FloatToStr(pAbastecimento.Vunitario))+',');
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
          abastecimento.Data   := FormatarDataBanco(FSQLQuery.FieldByName('DATA').AsString);
          abastecimento.Litros := FSQLQuery.FieldByName('LITROS').AsFloat;
          abastecimento.Aliquota  := FSQLQuery.FieldByName('ALIQUOTA').AsFloat;
          abastecimento.Vunitario := FSQLQuery.FieldByName('VUNITARIO').AsFloat;
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
       +FormatDateTime('yyyy-mm-dd',pDataFinal)+'" ORDER BY IDBOMBA,ID');
    FSQLQuery.Open();

    if not (FSQLQuery.FieldByName('IDBOMBA').AsInteger = 0) then
    begin
        FSQLQuery.First;
        while not FSQLQuery.Eof do
        begin
          abastecimento    := TAbastecimento.Create;
          abastecimento.Id := FSQLQuery.FieldByName('ID').AsInteger;
          abastecimento.Data   := FormatarDataBanco(FSQLQuery.FieldByName('DATA').Asstring);
          abastecimento.Valor  := FSQLQuery.FieldByName('VALOR').AsFloat;
          abastecimento.Litros := FSQLQuery.FieldByName('LITROS').AsFloat;
          abastecimento.Imposto   := FSQLQuery.FieldByName('IMPOSTO').AsFloat;
          abastecimento.Vunitario := FSQLQuery.FieldByName('VUNITARIO').AsFloat;
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
    abastecimento.Data   := FormatarDataBanco(FSQLQuery.FieldByName('DATA').AsString);
    abastecimento.Valor  := FSQLQuery.FieldByName('VALOR').AsFloat;
    abastecimento.Vunitario := FSQLQuery.FieldByName('VUNITARIO').AsFloat;
    abastecimento.Litros    := FSQLQuery.FieldByName('LITROS').AsFloat;
    abastecimento.Imposto  := FSQLQuery.FieldByName('IMPOSTO').AsFloat;
    abastecimento.Aliquota := FSQLQuery.FieldByName('ALIQUOTA').AsFloat;
    abastecimento.IdBomba  := FSQLQuery.FieldByName('IDBOMBA').AsInteger;

    Result := abastecimento;
end;

end.
