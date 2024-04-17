unit untCadCliente;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  ExtCtrls, Buttons, ZDataset, untModelo, Types, DB, untConnection;

type
  
  { TcadClienteF }

  TcadClienteF = class(TmodeloCadF)
    bitBtnEditar: TBitBtn;
    dbCbTipoCliente: TDBComboBox;
    dbEdtID: TDBEdit;
    dbEdtCpfCnpj: TDBEdit;
    dbEdtNome: TDBEdit;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    qryCadCliente: TZQuery;
    qryCadClienteclienteid: TLongintField;
    qryCadClientecpf_cnpj_cliente: TStringField;
    qryCadClientenome_cliente: TStringField;
    qryCadClientetipo_cliente: TStringField;
    RadioGroup1: TRadioGroup;
    procedure bitBtnCancelarClick(Sender: TObject);
    procedure bitBtnEditarClick(Sender: TObject);
    procedure bitBtnExcluirClick(Sender: TObject);
    procedure bitBtnGravarClick(Sender: TObject);
    procedure bitBtnNovoClick(Sender: TObject);
    procedure bitBtnSairClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure pgcModeloChange(Sender: TObject);
    procedure qryCadClienteNewRecord(DataSet: TDataSet);
    procedure spBtnPesquisarClick(Sender: TObject);
    procedure tbsCadastroContextPopup(Sender: TObject; MousePos: TPoint; 
      var Handled: Boolean);
  private

  public

  end;

var
  cadClienteF: TcadClienteF;

implementation

{$R *.lfm}

{ TcadClienteF }

procedure TcadClienteF.DBGrid1DblClick(Sender: TObject);
begin
  pgcModelo.ActivePage := tbsCadastro;
  qryCadCliente.Edit;
end;

procedure TcadClienteF.bitBtnNovoClick(Sender: TObject);
begin
  qryCadCliente.Insert;
  pgcModelo.ActivePage := tbsCadastro;
end;

procedure TcadClienteF.bitBtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TcadClienteF.bitBtnGravarClick(Sender: TObject);
begin
  qryCadCliente.Post;
  pgcModelo.ActivePage := tbsPesquisa;
end;

procedure TcadClienteF.bitBtnEditarClick(Sender: TObject);
begin
  qryCadCliente.Edit;
  pgcModelo.ActivePage := tbsCadastro;
end;

procedure TcadClienteF.bitBtnCancelarClick(Sender: TObject);
begin
   qryCadCliente.Cancel;
   pgcModelo.ActivePage := tbsPesquisa;
end;

procedure TcadClienteF.bitBtnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja excluir o registro ?', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
     qryCadCliente.Delete;
     pgcModelo.ActivePage := tbsPesquisa;
  end;
end;

procedure TcadClienteF.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  inherited;
end;

procedure TcadClienteF.FormShow(Sender: TObject);
begin
  pgcModelo.ActivePage := tbsPesquisa;
  RadioGroup1.ItemIndex:= 4;
  qryCadCliente.Active:= true;
end;

procedure TcadClienteF.pgcModeloChange(Sender: TObject);
begin

end;

procedure TcadClienteF.qryCadClienteNewRecord(DataSet: TDataSet);
begin
   DataModule1.qryGenericNextValue.Close;
   DataModule1.qryGenericNextValue.SQL.Clear;
   DataModule1.qryGenericNextValue.SQL.Add('select nextval('+QuotedStr('cliente_clienteid')+')as CODIGO');
   DataModule1.qryGenericNextValue.Open;           
   
   qryCadClienteclienteid.AsInteger:= DataModule1.qryGenericNextValue.FieldByName('CODIGO').AsInteger;
end;

procedure TcadClienteF.spBtnPesquisarClick(Sender: TObject);
begin
  if (RadioGroup1.ItemIndex = 0) then
  begin
     qryCadCliente.Close;
     qryCadCliente.SQL.Clear;
     qryCadCliente.SQL.Add('select * from cliente where clienteid = ' + edtPesquisa1.Text);
     qryCadCliente.Open;
  end
  else if (RadioGroup1.ItemIndex = 1) then
  begin
        qryCadCliente.Close;
        qryCadCliente.SQL.Clear;
        qryCadCliente.SQL.Add('select * from cliente where upper(cpf_cnpj_cliente) like ' + QuotedStr(UpperCase('%' + edtPesquisa1.Text + '%')));
        qryCadCliente.Open;
  end
  else if (RadioGroup1.ItemIndex = 2) then
  begin
        qryCadCliente.Close;
        qryCadCliente.SQL.Clear;
        qryCadCliente.SQL.Add('select * from cliente where upper(nome_cliente) like ' + QuotedStr(UpperCase('%' + edtPesquisa1.Text + '%')));
        qryCadCliente.Open;
  end
  else if (RadioGroup1.ItemIndex = 3) then
  begin
        qryCadCliente.Close;
        qryCadCliente.SQL.Clear;
        qryCadCliente.SQL.Add('select * from cliente where upper(tipo_cliente) like ' + QuotedStr(UpperCase('%' + edtPesquisa1.Text + '%')));
        qryCadCliente.Open;
  end
  else if (RadioGroup1.ItemIndex = 4) then
  begin
        qryCadCliente.Close;
        qryCadCliente.SQL.Clear;
        qryCadCliente.SQL.Add('select * from cliente');
        qryCadCliente.Open;
  end;
end;

procedure TcadClienteF.tbsCadastroContextPopup(Sender: TObject; 
  MousePos: TPoint; var Handled: Boolean);
begin

end;

end.

