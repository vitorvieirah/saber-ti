unit untCadCategoria;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  ExtCtrls, Buttons, ZDataset, untModelo, DB, untConnection;

type
  
  { TcadCategoriaF }

  TcadCategoriaF = class(TmodeloCadF)
    bitBtnEditar: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    qryCadCategoria: TZQuery;
    qryCadCategoriacategoriaprodutoid: TLongintField;
    qryCadCategoriads_categoria_produto: TStringField;
    RadioGroup1: TRadioGroup;
    procedure bitBtnCancelarClick(Sender: TObject);
    procedure bitBtnEditarClick(Sender: TObject);
    procedure bitBtnExcluirClick(Sender: TObject);
    procedure bitBtnGravarClick(Sender: TObject);
    procedure bitBtnNovoClick(Sender: TObject);
    procedure bitBtnSairClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject) ;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure qryCadCategoriaNewRecord(DataSet: TDataSet);
    procedure spBtnPesquisarClick(Sender: TObject);
  private

  public

  end;

var
  cadCategoriaF: TcadCategoriaF;

implementation

{$R *.lfm}

{ TcadCategoriaF }

procedure TcadCategoriaF.bitBtnNovoClick(Sender: TObject);
begin
  qryCadCategoria.Insert;
  pgcModelo.ActivePage:= tbsCadastro;
end;

procedure TcadCategoriaF.bitBtnGravarClick(Sender: TObject);
begin
  qryCadCategoria.Post;
  pgcModelo.ActivePage:= tbsPesquisa;
end;
procedure TcadCategoriaF.bitBtnCancelarClick(Sender: TObject);
begin
  qryCadCategoria.Cancel;
  pgcModelo.ActivePage := tbsPesquisa;
end;

procedure TcadCategoriaF.bitBtnEditarClick(Sender: TObject);
begin
  qryCadCategoria.Edit;
  pgcModelo.ActivePage := tbsCadastro; 
end;

procedure TcadCategoriaF.bitBtnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja excluir o registro ?', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    qryCadCategoria.Delete;
    pgcModelo.ActivePage := tbsPesquisa;
  end;  
end;

procedure TcadCategoriaF.bitBtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TcadCategoriaF.DBGrid1DblClick(Sender: TObject);
begin
  pgcModelo.ActivePage := tbsCadastro;
  qryCadCategoria.Edit;
end;

procedure TcadCategoriaF.FormClose(Sender: TObject; 
  var CloseAction: TCloseAction);
begin
  inherited;
end;

procedure TcadCategoriaF.FormShow(Sender: TObject);
begin
  pgcModelo.ActivePage := tbsPesquisa;
  RadioGroup1.ItemIndex := 2;
  qryCadCategoria.Active:= true;
end;

procedure TcadCategoriaF.qryCadCategoriaNewRecord(DataSet: TDataSet);
begin
  DataModule1.qryGenericNextValue.Close;
  DataModule1.qryGenericNextValue.SQL.Clear;
  DataModule1.qryGenericNextValue.SQL.Add('select nextval('+QuotedStr('categoria_produto_categoriaprodutoid_seq')+')as CODIGO');
  DataModule1.qryGenericNextValue.Open;           
  
  qryCadCategoriacategoriaprodutoid.AsInteger:= DataModule1.qryGenericNextValue.FieldByName('CODIGO').AsInteger;;
end;

procedure TcadCategoriaF.spBtnPesquisarClick(Sender: TObject);
begin
  
  if (RadioGroup1.ItemIndex = 0) then
  begin
        qryCadCategoria.Close;
        qryCadCategoria.SQL.Clear;
        qryCadCategoria.SQL.Add('select * from categoria_produto where categoriaprodutoid = ' + edtPesquisa1.Text);
        qryCadCategoria.Open;
  end
  else if (RadioGroup1.ItemIndex = 1) then
  begin
        qryCadCategoria.Close;
        qryCadCategoria.SQL.Clear;
        qryCadCategoria.SQL.Add('select * from categoria_produto where upper(ds_categoria_produto) like ' 
                                        + QuotedStr(UpperCase('%' + edtPesquisa1.Text + '%')));
        qryCadCategoria.Open; 
  end
  else if (RadioGroup1.ItemIndex = 2) then
  begin
        qryCadCategoria.Close;
        qryCadCategoria.SQL.Clear;
        qryCadCategoria.SQL.Add('select * from categoria_produto');
        qryCadCategoria.Open;
  end;
end;

end.

