unit untCadProduto;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBCtrls,
  StdCtrls, Buttons, DBGrids, ZDataset, untModelo, DB, Types, untConnection;

type
  
  { TcadProdutoF }

  TcadProdutoF = class(TmodeloCadF)
    bitBtnEditar: TBitBtn;
    dsIDCategoria: TDataSource;
    DBComboBox1: TDBComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBGrid2: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    qryCadProd: TZQuery;
    qryCadProdcategoriaprodutoid: TLongintField;
    qryCadProdds_produto: TStringField;
    qryCadProddt_cadastro_produto: TDateTimeField;
    qryCadProdobs_produto: TStringField;
    qryCadProdprodutoid: TLongintField;
    qryCadProdstatus_produto: TStringField;
    qryCadProdvl_venda_produto: TFloatField;
    RadioGroup1: TRadioGroup;
    qryIDCategoria: TZQuery;
    procedure bitBtnCancelarClick(Sender: TObject);
    procedure bitBtnEditarClick(Sender: TObject);
    procedure bitBtnExcluirClick(Sender: TObject);
    procedure bitBtnGravarClick(Sender: TObject);
    procedure bitBtnNovoClick(Sender: TObject);
    procedure bitBtnSairClick(Sender: TObject);
    procedure DBComboBox2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryCadProdNewRecord(DataSet: TDataSet);
    procedure spBtnPesquisarClick(Sender: TObject);
    procedure tbsPesquisaContextPopup(Sender: TObject; MousePos: TPoint; 
      var Handled: Boolean);
  private

  public

  end;

var
  cadProdutoF: TcadProdutoF;

implementation

{$R *.lfm}

{ TcadProdutoF }

procedure TcadProdutoF.spBtnPesquisarClick(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0 : begin
      qryCadProd.Close;
      qryCadProd.SQL.Clear;
      qryCadProd.SQL.Add('select * from produto where produtoid = ' + edtPesquisa1.Text);
      qryCadProd.Open;
    end;
    1 : begin
      qryCadProd.Close;
      qryCadProd.SQL.Clear;
      qryCadProd.SQL.Add('select * from produto where categoriaprodutoid =' + edtPesquisa1.Text);
      qryCadProd.Open;
    end;
    2 : begin
      qryCadProd.Close;
      qryCadProd.SQL.Clear;
      qryCadProd.SQL.Add('select * from produto where vl_venda_produto <= ' + edtPesquisa1.Text);
      qryCadProd.Open;
    end;
    3 : begin
      qryCadProd.Close;
      qryCadProd.SQL.Clear;
      qryCadProd.SQL.Add('select * from produto where vl_venda_produto >= ' + edtPesquisa1.Text);
      qryCadProd.Open;
    end;
    4 : begin
      qryCadProd.Close;
      qryCadProd.SQL.Clear;
      qryCadProd.SQL.Add('select * from produto where dt_cadastro_produto = ' + QuotedStr(edtPesquisa1.Text));
      qryCadProd.Open;
    end;
    5 : begin
      qryCadProd.Close;
      qryCadProd.SQL.Clear;
      qryCadProd.SQL.Add('select * from produto where status_produto = ' + QuotedStr(edtPesquisa1.Text));
      qryCadProd.Open;
    end;
    6 : begin
      qryCadProd.Close;
      qryCadProd.SQL.Clear;
      qryCadProd.SQL.Add('select * from produto');
      qryCadProd.Open;
    end;
  end;
  
end;

procedure TcadProdutoF.tbsPesquisaContextPopup(Sender: TObject; 
  MousePos: TPoint; var Handled: Boolean);
begin

end;

procedure TcadProdutoF.bitBtnNovoClick(Sender: TObject);
begin
   qryCadProd.Insert;
   pgcModelo.ActivePage := tbsCadastro;
   DBEdit6.Text := DateToStr(Date);
end;

procedure TcadProdutoF.bitBtnGravarClick(Sender: TObject);
begin
  qryCadProd.Post;
  pgcModelo.ActivePage := tbsPesquisa;
end;

procedure TcadProdutoF.bitBtnCancelarClick(Sender: TObject);
begin
  qryCadProd.Cancel;
  pgcModelo.ActivePage := tbsPesquisa;
end;

procedure TcadProdutoF.bitBtnEditarClick(Sender: TObject);
begin
  qryCadProd.Edit;
  pgcModelo.ActivePage := tbsCadastro;
end;

procedure TcadProdutoF.bitBtnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja excluir o registro ?', mtWarning, [mbYes, mbNo], 0) = mrYes then 
  begin
    qryCadProd.Delete;
    pgcModelo.ActivePage := tbsPesquisa;
  end;
end;

procedure TcadProdutoF.bitBtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TcadProdutoF.DBComboBox2Click(Sender: TObject);
begin
  qryCadProd.Close;
  qryCadProd.SQL.Clear;
  qryCadProd.SQL.Add('select * from categoria_produto');
  qryCadProd.Open;
end;

procedure TcadProdutoF.DBGrid1DblClick(Sender: TObject);
begin
  pgcModelo.ActivePage := tbsCadastro;
  qryCadProd.Edit;
end;

procedure TcadProdutoF.FormShow(Sender: TObject);
begin
  qryCadProd.Active:= true;
  pgcModelo.ActivePage := tbsPesquisa;
  RadioGroup1.ItemIndex:= 6;
end;

procedure TcadProdutoF.qryCadProdNewRecord(DataSet: TDataSet);
begin
  DataModule1.qryGenericNextValue.Close;
  DataModule1.qryGenericNextValue.SQL.Clear;
  DataModule1.qryGenericNextValue.SQL.Add('select nextval('+QuotedStr('categoria_produto_categoriaprodutoid_seq')+')as CODIGO');
  DataModule1.qryGenericNextValue.Open;
  qryCadProdprodutoid.AsInteger:= DataModule1.qryGenericNextValue.FieldByName('CODIGO').AsInteger;
end;

end.

