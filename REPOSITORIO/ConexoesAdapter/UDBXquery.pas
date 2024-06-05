unit UDBXquery;

interface

uses
 UISQLquery, Data.SqlExpr;


 type TDBXquery = class(TInterfacedObject,ISQLquery)
  private
     FSQLQuery : TSQLQuery;
     FCampo : string;
  public
     procedure Clear;
     procedure Add(pcnValor : string);
     procedure ExecSQL();
     procedure First;
     procedure Next;

     function FieldByName(pValor : string): ISQLquery;
     function AsString: string;
     function AsInteger: Integer;
     function Eof : Boolean;
     function AsFloat: Double;
     function SQL(): ISQLquery;
     function Open() : TObject;
     constructor Create(pSQLQuery : TSQLQuery);
 end;

implementation

uses
  System.SysUtils;

{ TDBXquery }
constructor TDBXquery.Create(pSQLQuery : TSQLQuery);
begin
    FSQLQuery := pSQLQuery;
    Clear;
end;

procedure TDBXquery.Add(pcnValor : string);
begin
   FSQLQuery.SQL.Add(pcnValor);
end;

function TDBXquery.AsFloat: Double;
begin
    Result := FSQLQuery.FieldByName(FCampo).AsFloat;
end;

function TDBXquery.AsInteger: Integer;
begin
     Result := FSQLQuery.FieldByName(FCampo).AsInteger;
end;

function TDBXquery.AsString: string;
begin
     Result := FSQLQuery.FieldByName(FCampo).AsString;
end;

procedure TDBXquery.Clear;
begin
    FSQLQuery.SQL.Clear;
end;

function TDBXquery.Eof: Boolean;
begin
   Result := FSQLQuery.Eof;
end;

procedure TDBXquery.ExecSQL;
begin
    FSQLQuery.ExecSQL();
end;

function TDBXquery.FieldByName(pValor: string): ISQLquery;
begin
    FCampo :=  pValor;
    Result := Self;
end;

procedure TDBXquery.First;
begin
    FSQLQuery.First;
end;

procedure TDBXquery.Next;
begin
    FSQLQuery.Next;
end;

function TDBXquery.Open(): TObject;
begin
    FSQLQuery.Open;
    Result := FSQLQuery;
end;

function TDBXquery.SQL: ISQLquery;
begin
    Result := Self;
end;

end.
