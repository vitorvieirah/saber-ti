unit untLogin;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  Buttons, ZDataset, untmenuprincipal;

type
  
  { TloginF }

  TloginF = class(TForm)
    BitBtn1: TBitBtn;
    dsUsuarios: TDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    qryUsuarios: TZQuery;
    qryUsuariosid: TLongintField;
    qryUsuariosnome_completo: TStringField;
    qryUsuariossenha: TStringField;
    qryUsuariosusuario: TStringField;
    procedure BitBtn1Click(Sender: TObject);
  private

  public

  end;

var
  loginF: TloginF;

implementation

{$R *.lfm}

{ TloginF }

procedure TloginF.BitBtn1Click(Sender: TObject);
begin
  qryUsuarios.Close;
  qryUsuarios.SQL.Clear;
  qryUsuarios.SQL.Add('select * from usuarios where usuario = ' + QuotedStr(UpperCase(Edit1.Text))
                               + 'and senha = ' + QuotedStr(UpperCase(Edit2.Text)));
  qryUsuarios.Open;
  
  if not (qryUsuariosusuario.AsString <> '') and (qryUsuariossenha.AsString <> '') then
  begin
     menuPrincipalF := TmenuPrincipalF.Create(Self);
     menuPrincipalF.ShowModal;
  end;
end;

end.

