unit untCadOrcamentos;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, DBCtrls,
  StdCtrls, DBGrids, ExtCtrls, ZDataset, untModelo, DB, untPesqClientes,
  untConnection, untPesqProduto, untAddItem, DateUtils;

type
  
  { TcadOrcamentosF }

  TcadOrcamentosF = class(TmodeloCadF)
    bitBtnAddItem: TBitBtn;
    bitBtnDeleteItem: TBitBtn;
    bitBtnEditar: TBitBtn;
    btnPesq: TButton;
    dsPesqClientes: TDataSource;
    dbEdtValorTotal: TDBEdit;
    dsOrcItens: TDataSource;
    dbEdtId: TDBEdit;
    dbEdtIDCliente: TDBEdit;
    dbEdtData: TDBEdit;
    dbEdtDataVenc: TDBEdit;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    qryCadOrcamentos: TZQuery;
    qryCadOrcamentosclienteid: TLongintField;
    qryCadOrcamentosdt_orcamento: TDateTimeField;
    qryCadOrcamentosdt_validade_orcamento: TDateTimeField;
    qryCadOrcamentosorcamentoid: TLongintField;
    qryCadOrcamentosvl_total_orcamento: TFloatField;
    RadioGroup1: TRadioGroup;
    procedure bitBtnAddItemClick(Sender: TObject);
    procedure bitBtnCancelarClick(Sender: TObject);
    procedure bitBtnDeleteItemClick(Sender: TObject);
    procedure bitBtnEditarClick(Sender: TObject);
    procedure bitBtnExcluirClick(Sender: TObject);
    procedure bitBtnGravarClick(Sender: TObject);
    procedure bitBtnNovoClick(Sender: TObject);
    procedure bitBtnSairClick(Sender: TObject);
    procedure btnPesqClick(Sender: TObject);
    procedure dbEdtIDClienteChange(Sender: TObject);
    procedure dsOrcItensDataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure pgcModeloChange(Sender: TObject);
    procedure qryCadOrcamentosNewRecord(DataSet: TDataSet);
    procedure spBtnPesquisarClick(Sender: TObject);
  private

  public
    procedure calculoValorTotal();
  end;

var
  cadOrcamentosF: TcadOrcamentosF;

implementation

{$R *.lfm}

{ TcadOrcamentosF }

procedure TcadOrcamentosF.pgcModeloChange(Sender: TObject);
begin
  DataModule1.qryOrcItens.Close;
  DataModule1.qryOrcItens.SQL.Clear;
  DataModule1.qryOrcItens.SQL.Add('select * from orcamento_item where orcamentoid = ' + dbEdtId.Text);
  DataModule1.qryOrcItens.Open;
end;

procedure TcadOrcamentosF.qryCadOrcamentosNewRecord(DataSet: TDataSet);
begin
   DataModule1.qryGenericNextValue.Close;
   DataModule1.qryGenericNextValue.SQL.Clear;
   DataModule1.qryGenericNextValue.SQL.Add('select nextval('+QuotedStr('orcamento_orcamentoid_seq')+')as CODIGO');
   DataModule1.qryGenericNextValue.Open;
   qryCadOrcamentosorcamentoid.AsInteger:= DataModule1.qryGenericNextValue.FieldByName('CODIGO').AsInteger;                                     
end;

procedure TcadOrcamentosF.spBtnPesquisarClick(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0 : begin
      qryCadOrcamentos.Close;
      qryCadOrcamentos.SQL.Clear;
      qryCadOrcamentos.SQL.Add('select * from orcamento where orcamentoid = ' + edtPesquisa1.Text);
      qryCadOrcamentos.Open;
    end;
    1 : begin
      qryCadOrcamentos.Close;
      qryCadOrcamentos.SQL.Clear;
      qryCadOrcamentos.SQL.Add('select * from orcamento where clienteid = ' + edtPesquisa1.Text);
      qryCadOrcamentos.Open;
    end;
    2 : begin
      qryCadOrcamentos.Close;
      qryCadOrcamentos.SQL.Clear;
      qryCadOrcamentos.SQL.Add('select * from orcamento where dt_orcamento = ' + QuotedStr(edtPesquisa1.Text));
      qryCadOrcamentos.Open;;
    end;
    3 : begin
      qryCadOrcamentos.Close;
      qryCadOrcamentos.SQL.Clear;
      qryCadOrcamentos.SQL.Add('select * from orcamento where dt_validade_orcamento = ' + QuotedStr(edtPesquisa1.Text));
      qryCadOrcamentos.Open;
    end;
    4 : begin
      qryCadOrcamentos.Close;
      qryCadOrcamentos.SQL.Clear;
      qryCadOrcamentos.SQL.Add('select * from orcamento where vl_total_orcamento = ' + edtPesquisa1.Text);
      qryCadOrcamentos.Open;
    end;
    5 : begin
      qryCadOrcamentos.Close;
      qryCadOrcamentos.SQL.Clear;
      qryCadOrcamentos.SQL.Add('select * from orcamento' + edtPesquisa1.Text);
      qryCadOrcamentos.Open;
    end;
  end; 
end;

procedure TcadOrcamentosF.bitBtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TcadOrcamentosF.btnPesqClick(Sender: TObject);
begin
  pesqClientesF := TpesqClientesF.Create(Self);
  pesqClientesF.ShowModal;
end;

procedure TcadOrcamentosF.dbEdtIDClienteChange(Sender: TObject);
begin

end;

procedure TcadOrcamentosF.dsOrcItensDataChange(Sender: TObject; Field: TField);
begin

end;

procedure TcadOrcamentosF.bitBtnNovoClick(Sender: TObject);
var
  dataAtual : TDateTime;
begin
  DataModule1.qryOrcItens.Close;
  DataModule1.qryOrcItens.SQL.Clear;
  DataModule1.qryOrcItens.SQL.Add('select * from orcamento_item where orcamentoitemid = -1');
  DataModule1.qryOrcItens.Open;
  
  dataAtual:= Now;
  
  qryCadOrcamentos.Insert;
  qryCadOrcamentosdt_orcamento.AsString:= DateToStr(dataAtual);
  qryCadOrcamentosdt_validade_orcamento.AsString:= DateToStr(IncDay(dataAtual, 15));
  pgcModelo.ActivePage := tbsCadastro;
end;

procedure TcadOrcamentosF.bitBtnAddItemClick(Sender: TObject);
begin
  DataModule1.qryOrcItens.Insert;
  addItemF := TaddItemF.Create(Self);
  addItemF.ShowModal;
end;

procedure TcadOrcamentosF.bitBtnCancelarClick(Sender: TObject);
begin
  qryCadOrcamentos.Cancel;
  pgcModelo.ActivePage := tbsPesquisa;
end;

procedure TcadOrcamentosF.bitBtnDeleteItemClick(Sender: TObject);
begin
  if MessageDlg('Deseja excluir o item ?', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
     DataModule1.qryOrcItens.Delete;
     calculoValorTotal();
  end;
end;

procedure TcadOrcamentosF.bitBtnEditarClick(Sender: TObject);
begin
  qryCadOrcamentos.Edit;
  pgcModelo.ActivePage := tbsCadastro;
end;

procedure TcadOrcamentosF.bitBtnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja excluir o orçamento ?', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
       qryCadOrcamentos.Delete;
       pgcModelo.ActivePage := tbsPesquisa;
  end;
end;

procedure TcadOrcamentosF.bitBtnGravarClick(Sender: TObject);
begin
  //qryCadOrcamentosclienteid.AsString := dbEdtIDCliente.Text; 
  qryCadOrcamentos.Post;
  pgcModelo.ActivePage := tbsPesquisa;
end;

procedure TcadOrcamentosF.calculoValorTotal();
var
  soma : Double;
begin
  
  soma := 0.0;
  
  DBGrid2.DataSource.DataSet.First;
  while not DBGrid2.DataSource.DataSet.EOF do
  begin
    soma := soma + DBGrid2.DataSource.DataSet.FieldByName('vl_total').AsFloat;
    DBGrid2.DataSource.DataSet.Next;
  end;
  
  dbEdtValorTotal.Text:= FloatToStr(soma);
end;


procedure TcadOrcamentosF.FormClose(Sender: TObject; 
  var CloseAction: TCloseAction);
begin
  inherited;
end;

procedure TcadOrcamentosF.FormShow(Sender: TObject);
begin
   pgcModelo.ActivePage := tbsPesquisa;
   DataModule1.qryOrcItens.Active:= true;
   qryCadOrcamentos.Active:= true;
   RadioGroup1.ItemIndex:= 5;
end;

end.

