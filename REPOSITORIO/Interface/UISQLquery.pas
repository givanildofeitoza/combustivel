unit UISQLquery;

interface

type
ISQLquery=interface
   function SQL(): ISQLquery;
   function FieldByName(pValor : string): ISQLquery;
   function Eof : Boolean;

   function AsString: string;
   function AsInteger: Integer;
   function AsFloat: Double;

   procedure First;
   procedure Next;
   procedure Clear();
   procedure Add(pcnValor : string);
   procedure ExecSQL();
   function Open() : TObject;
end;

implementation

end.
