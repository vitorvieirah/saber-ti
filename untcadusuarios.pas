unit untCadUsuarios;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBCtrls,
  StdCtrls, Buttons, ZDataset, untModelo, untConnection, DB;

type
  
  { TcadUsuarioF }

  TcadUsuarioF = class(TmodeloCadF)
    bitBtnEditar: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    qryCadUsuarioid: TLongintField;
    qryCadUsuarionome_completo: TStringField;
    qryCadUsuariosenha: TStringField;
    qryCadUsuariousuario: TStringField;
    RadioGroup1: TRadioGroup;
    qryCadUsuario: TZQuery;
    procedure bitBtnCancelarClick(Sender: TObject);
    procedure bitBtnEditarClick(Sender: TObject);
    procedure bitBtnExcluirClick(Sender: TObject);
    procedure bitBtnGravarClick(Sender: TObject);
    procedure bitBtnNovoClick(Sender: TObject);
    procedure bitBtnSairClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure qryCadUsuarioNewRecord(DataSet: TDataSet);
    procedure spBtnPesquisarClick(Sender: TObject);
  private

  public

  end;

var
  cadUsuarioF: TcadUsuarioF;

implementation

{$R *.lfm}

{ TcadUsuarioF }

procedure TcadUsuarioF.spBtnPesquisarClick(Sender: TObject);
begin
  if(RadioGroup1.ItemIndex = 0)then
  begin
    qryCadUsuario.Close;
    qryCadUsuario.SQL.Clear;
    qryCadUsuario.SQL.Add('select * from usuarios where id = ' + edtPesquisa1.Text);
    qryCadUsuario.Open;
  end
  else if (RadioGroup1.ItemIndex = 1) then
  begin
    qryCadUsuario.Close;
    qryCadUsuario.SQL.Clear;
    qryCadUsuario.SQL.Add('select * from usuarios where upper(usuario) like' + QuotedStr(UpperCase('%' + edtPesquisa1.Text + '%')));
    qryCadUsuario.Open;
  end
  else if (RadioGroup1.ItemIndex = 2) then
  begin
    qryCadUsuario.Close;
    qryCadUsuario.SQL.Clear;
    qryCadUsuario.SQL.Add('select * from usuarios where upper(nome_completo) like ' + QuotedStr(UpperCase('%' + edtPesquisa1.Text + '%')));
    qryCadUsuario.Open;
  end
  else if (RadioGroup1.ItemIndex = 3) then
  begin
    qryCadUsuario.Close;
    qryCadUsuario.SQL.Clear;
    qryCadUsuario.SQL.Add('select * from usuarios');
    qryCadUsuario.Open;
  end;
end;

procedure TcadUsuarioF.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  inherited;
end;

procedure TcadUsuarioF.bitBtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TcadUsuarioF.DBGrid1DblClick(Sender: TObject);
begin
  pgcModelo.ActivePage := tbsCadastro;
  qryCadUsuario.Edit;
end;

procedure TcadUsuarioF.bitBtnNovoClick(Sender: TObject);
begin
  qryCadUsuario.Insert;
  pgcModelo.ActivePage := tbsCadastro;
end;

procedure TcadUsuarioF.bitBtnGravarClick(Sender: TObject);
begin
  qryCadUsuario.Post;
  pgcModelo.ActivePage := tbsPesquisa;
end;

procedure TcadUsuarioF.bitBtnEditarClick(Sender: TObject);
begin
  qryCadUsuario.Edit;
  pgcModelo.ActivePage := tbsCadastro;
end;

procedure TcadUsuarioF.bitBtnCancelarClick(Sender: TObject);
begin
  qryCadUsuario.Cancel;
  pgcModelo.ActivePage := tbsPesquisa;
end;

procedure TcadUsuarioF.bitBtnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja excluir o registro ?', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin  
    qryCadUsuario.Delete;
    pgcModelo.ActivePage := tbsPesquisa;
  end;
end;

procedure TcadUsuarioF.FormShow(Sender: TObject);
begin
  pgcModelo.ActivePage := tbsPesquisa;
  qryCadUsuario.Active := true;
  RadioGroup1.ItemIndex := 3;
end;

procedure TcadUsuarioF.qryCadUsuarioNewRecord(DataSet: TDataSet);
begin
  DataModule1.qryGenericNextValue.Close;
  DataModule1.qryGenericNextValue.SQL.Clear;
  DataModule1.qryGenericNextValue.SQL.Add('select nextval('+QuotedStr('categoria_produto_categoriaprodutoid_seq')+')as CODIGO');
  DataModule1.qryGenericNextValue.Open;
  qryCadUsuarioid.AsInteger:= DataModule1.qryGenericNextValue.FieldByName('CODIGO').AsInteger;;
end;

end.

