unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, DateUtils, Grids, Placemnt;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    edArquivo: TEdit;
    btGetArquivo: TButton;
    OPD: TOpenDialog;
    btCarregar: TButton;
    Cds: TClientDataSet;
    CdsMATR_EXTERNA: TIntegerField;
    CdsDIGITO_VERIF: TIntegerField;
    CdsNOME: TStringField;
    CdsANO: TIntegerField;
    CdsMES: TIntegerField;
    CdsCPF: TStringField;
    CdsPIS: TStringField;
    CdsMAE: TStringField;
    CdsSEXO: TStringField;
    CdsDTNASC: TDateField;
    CdsESTADOCIVIL: TStringField;
    CdsESCOLARIDADE: TStringField;
    CdsHABILITACAO: TStringField;
    CdsPOSGRADUACAO: TStringField;
    CdsNACIONALIDADE: TStringField;
    CdsNATURALIDADE: TStringField;
    CdsPAIS: TStringField;
    CdsANOCHEGADA: TIntegerField;
    CdsDEP_IR: TIntegerField;
    CdsDEP_SF: TIntegerField;
    CdsDT_PRIM_EMP: TDateField;
    CdsID_ORIGEM: TIntegerField;
    CdsLOGRADOURO: TStringField;
    CdsNUMERO: TStringField;
    CdsCOMPLEMENTO: TStringField;
    CdsBAIRRO: TStringField;
    CdsMUNICIPIO: TStringField;
    CdsCEP: TStringField;
    CdsUF: TStringField;
    CdsRGNUM: TStringField;
    CdsRGORGAO: TStringField;
    CdsRGEXPEDICAO: TDateField;
    CdsRGUF: TStringField;
    CdsTITULO: TStringField;
    btSalvar: TButton;
    btImportar: TButton;
    Label2: TLabel;
    edAno: TEdit;
    Label3: TLabel;
    edMes: TComboBox;
    sg_Campos: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    Label4: TLabel;
    lbLinha: TLabel;
    Label5: TLabel;
    lbUltCampo: TLabel;
    CG: TClientDataSet;
    CGCAMPO: TStringField;
    CGINICIO: TStringField;
    CGTAMANHO: TStringField;
    CGTIPO: TStringField;
    Label6: TLabel;
    Button3: TButton;
    Button4: TButton;
    procedure btGetArquivoClick(Sender: TObject);
    procedure btImportarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btCarregarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2, Unit3;

{$R *.dfm}

procedure TForm1.btGetArquivoClick(Sender: TObject);
begin
  if OPD.Execute then
    edArquivo.Text := OPD.FileName;
end;

procedure TForm1.btImportarClick(Sender: TObject);
var
  F : TextFile;
  Linha : String;
  i, lin : integer;
begin
  frLog.Memo1.Lines.Text := 'CARGA INICIADA - '+TimeToStr(Now);
  if not cds.Active then
    cds.CreateDataSet;
  AssignFile(F,edArquivo.Text);
  Reset(F);
  lin := 0;
  while not Eof(F) do begin
    Readln(F, Linha);
    lin := lin + 1;
    lbLinha.Caption := IntToStr(lin);
    Application.ProcessMessages;
    LABEL6.Caption := '1';
    if Copy(Linha,18,1) <> '1' then
      Continue;
    LABEL6.Caption := '2';
    Cds.Append;
    LABEL6.Caption := '3';
    CdsANO.AsString := edAno.Text;
    LABEL6.Caption := '4';
    CdsMES.AsInteger := edMes.ItemIndex+1;
    LABEL6.Caption := '5';
    for i := 1 to sg_Campos.RowCount-1 do begin
      if sg_Campos.Cells[3,i] = 'P' then
        Continue;
      lbUltCampo.Caption := sg_Campos.Cells[0,i];
      LABEL6.Caption := '5.'+IntToStr(i);
      Application.ProcessMessages;
      try
        if sg_Campos.Cells[3,i] = 'D' then begin
          if Copy(Linha,StrToInt(sg_Campos.Cells[1,i]),2)+'/'+Copy(Linha,StrToInt(sg_Campos.Cells[1,i])+2,2)+'/'+Copy(Linha,StrToInt(sg_Campos.Cells[1,i])+4,4) <> '00/00/0000' then
            Cds.FieldByName(sg_Campos.Cells[0,i]).AsString := Copy(Linha,StrToInt(sg_Campos.Cells[1,i]),2)+'/'+Copy(Linha,StrToInt(sg_Campos.Cells[1,i])+2,2)+'/'+Copy(Linha,StrToInt(sg_Campos.Cells[1,i])+4,4);
        end
        else
          Cds.FieldByName(sg_Campos.Cells[0,i]).AsString := Copy(Linha,StrToInt(sg_Campos.Cells[1,i]), StrToInt(sg_Campos.Cells[2,i]) );
      except
        on E:Exception do begin
          frLog.Memo1.Lines.Add( '************ Erro ***************' );
          frLog.Memo1.Lines.Add( 'Linha do Erro: '+lbLinha.Caption+' -  Campo Referente ao Erro: '+lbUltCampo.Caption+'  -  Posição Inicial: '+sg_Campos.Cells[1,i] );
          frLog.Memo1.Lines.Add( 'Mensagem do Erro: '+E.Message );
          frLog.Memo1.Lines.Add( '' );
        end;
      end;
    end;
    LABEL6.Caption := '6';
    Cds.Post;
    LABEL6.Caption := '7';
  end;
  CloseFile(F);
end;

procedure TForm1.FormCreate(Sender: TObject);
var i : Integer;
begin
  edAno.Text := IntToStr( YearOf( Now ) );
  edMes.ItemIndex := MonthOf( Now ) - 1 ;
  sg_Campos.RowCount := CDS.FieldCount+1;
  sg_Campos.Cells[0,0] := 'Campo';
  sg_Campos.Cells[1,0] := 'Início';
  sg_Campos.Cells[2,0] := 'Tamanho';
  sg_Campos.Cells[3,0] := 'Tipo';
  for i := 0 to CDS.FieldCount-1 do begin
    sg_Campos.Cells[0,i+1] := CDS.Fields[i].FieldName;
    if (CDS.Fields[i] is TDateTimeField) or (CDS.Fields[i] is TDateField) then
      sg_Campos.Cells[3,i+1] := 'D'
    else
      sg_Campos.Cells[3,i+1] := 'C';
  end;
end;

procedure TForm1.btSalvarClick(Sender: TObject);
begin
  Cds.SaveToFile('C:\SIAPECARGA.CDS');
  ShowMessage('Dados Gravados!');
end;

procedure TForm1.btCarregarClick(Sender: TObject);
begin
  Cds.LoadFromFile('C:\SIAPECARGA.CDS');
  ShowMessage('Dados Carregados!');
end;

procedure TForm1.Button1Click(Sender: TObject);
var i : Integer;
begin
  CG.CreateDataSet;
  for i := 1 to sg_Campos.RowCount-1 do begin
    CG.Append;
    CGCAMPO.AsString := sg_Campos.Cells[0,i];
    CGINICIO.AsString := sg_Campos.Cells[1,i];
    CGTAMANHO.AsString := sg_Campos.Cells[2,i];
    CGTIPO.AsString := sg_Campos.Cells[3,i];
    CG.Post;
  end;
  CG.SaveToFile('C:\CFGL.TXT');
  CG.Close;
end;

procedure TForm1.Button2Click(Sender: TObject);
var i : integer;
begin
  CG.LoadFromFile('C:\CFGL.TXT');
  i := 0;
  while not CG.Eof do begin
    i := i + 1;
    sg_Campos.Cells[0,i] := CGCAMPO.AsString;
    sg_Campos.Cells[1,i] := CGINICIO.AsString;
    sg_Campos.Cells[2,i] := CGTAMANHO.AsString;
    sg_Campos.Cells[3,i] := CGTIPO.AsString;
    CG.Next;
  end;
  CG.Close;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  frLog.ShowModal;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Form3.Show;
end;

end.
