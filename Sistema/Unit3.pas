unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, StdCtrls, ExtCtrls;

type
  TForm3 = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm3.FormShow(Sender: TObject);
var i : Integer;
begin
  ComboBox1.Items.Clear;
  for i := 0 to Form1.Cds.FieldCount-1 do begin
    ComboBox1.Items.Add( Form1.Cds.Fields[i].FieldName );
  end;
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
  Form1.Cds.First;
  Form1.Cds.Locate( ComboBox1.Text, Edit1.Text, [loPartialKey, loCaseInsensitive] );
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  Form1.Cds.FindNext;
end;

end.
