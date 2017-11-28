unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Bde.DBTables, AdvGlowButton,
  cefvcl, Vcl.StdCtrls, Vcl.ExtCtrls, AdvFocusHelper, ceflib;

type
  TForm1 = class(TForm)
    Panel_CPF: TPanel;
    GroupBoxDados: TGroupBox;
    Label3: TLabel;
    Label12: TLabel;
    RzLabel1: TLabel;
    RzLabel2: TLabel;
    RzLabel3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    EditRazaoSocial: TEdit;
    EditSituacao: TEdit;
    EdtDigitoVerificador: TEdit;
    EdtEmissao: TEdit;
    EdtCodCtrlControle: TEdit;
    EdtDataNasc: TEdit;
    EdtCPF: TEdit;
    GroupBoxChromium: TGroupBox;
    ChromiumCPF: TChromium;
    BitBtnSair: TButton;
    BitBtnConfirma: TButton;
    BtnNovaConsulta: TButton;
    procedure FormShow(Sender: TObject);
    procedure ChromiumCPFAddressChange(Sender: TObject;
      const browser: ICefBrowser; const frame: ICefFrame; const url: ustring);
    procedure ChromiumCPFBeforeResourceLoad(Sender: TObject;
      const browser: ICefBrowser; const frame: ICefFrame;
      const request: ICefRequest; const callback: ICefRequestCallback;
      out Result: TCefReturnValue);
    procedure ChromiumCPFConsoleMessage(Sender: TObject;
      const browser: ICefBrowser; const message, source: ustring; line: Integer;
      out Result: Boolean);
    procedure BitBtnSairClick(Sender: TObject);
    procedure BtnNovaConsultaClick(Sender: TObject);
  private
    { Private declarations }
    procedure NovaConsultaCPF;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

var
  Link: String;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.BitBtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TForm1.BtnNovaConsultaClick(Sender: TObject);
begin
   BitBtnConfirma.Enabled := false;
   GroupBoxChromium.Height := 620;
   Self.Height := 688;
   Panel_CPF.Height := 605;
   GroupBoxDados.Align := alBottom;
   BitBtnConfirma.top := 616;
   BitBtnSair.top := 616;
   BtnNovaConsulta.top := 616;
   NovaConsultaCPF;
end;

procedure TForm1.ChromiumCPFAddressChange(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame; const url: ustring);
begin
  if url = 'http://cpf.receita.fazenda.gov.br/situacao/default.asp' then
  begin
     if ChromiumCPF.Browser <> nil then
     begin
        ChromiumCPF.Browser.MainFrame.ExecuteJavaScript(
          'Javascript:document.getElementById(''txtCPF'').value  = '+QuotedStr(EdtCPF.Text)+';','about:blank', 0);
     end;
     BitBtnConfirma.Enabled := false;
     GroupBoxChromium.Height := 620;
     Self.Height := 688;
  end
  else if url = 'http://cpf.receita.fazenda.gov.br/situacao/ConsultaSituacao.asp' then
  begin
     if ChromiumCPF.Browser <> nil then
     begin
       ChromiumCPF.Browser.MainFrame.ExecuteJavaScript(
           'Javascript:console.log(document.getElementById(''idCnt04'').innerText);', 'about:blank', 0);

       ChromiumCPF.Browser.MainFrame.ExecuteJavaScript(
           'Javascript:console.log(document.getElementById(''idCnt05'').innerText);', 'about:blank', 0);

       ChromiumCPF.Browser.MainFrame.ExecuteJavaScript(
           'Javascript:console.log(document.getElementById(''idCnt13'').innerText);', 'about:blank', 0);

       ChromiumCPF.Browser.MainFrame.ExecuteJavaScript(
           'Javascript:console.log(document.getElementById(''idCnt06'').innerText);', 'about:blank', 0);

       ChromiumCPF.Browser.MainFrame.ExecuteJavaScript(
           'Javascript:console.log(document.getElementById(''idCnt07'').innerText);', 'about:blank', 0);

       ChromiumCPF.Browser.MainFrame.ExecuteJavaScript(
           'Javascript:console.log(document.getElementById(''idCnt09'').innerText);', 'about:blank', 0);

       ChromiumCPF.Browser.MainFrame.ExecuteJavaScript(
           'Javascript:console.log(document.getElementById(''idCnt08'').innerText);', 'about:blank', 0);
       BitBtnConfirma.Enabled := true;
       GroupBoxChromium.Height  := 0;
       Panel_CPF.Height := 290;
       Self.Height := 310;
       GroupBoxDados.Align := alTop;
       BitBtnConfirma.top := 220;
       BitBtnSair.top := 220;
       BtnNovaConsulta.top := 220;
     end;
  end;
end;

procedure TForm1.ChromiumCPFBeforeResourceLoad(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame;
  const request: ICefRequest; const callback: ICefRequestCallback;
  out Result: TCefReturnValue);
Var
  map: ICefStringMultimap;
begin
    map := TCefStringMultimapOwn.Create;
    request.GetHeaderMap(map);
    map.Append('Accept','text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8');
    map.Append('Accept-Encoding','gzip, deflate');
    map.Append('Accept-Language','pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7');
    map.Append('Cache-Control','max-age=0');
    map.Append('Connection','keep-alive');
    map.Append('Cookie','ASPSESSIONIDSARCBQDB=EJDIEDOBELOBAHMKBNAEMBAA');
    map.Append('Pragma','no-cache');
    map.Append('Referer','https://www.google.com.br/');
    map.Append('Upgrade-Insecure-Requests:','1');
    map.Append('User-Agent','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36');
    request.SetHeaderMap(map);
    callback.Cont(true);
end;

procedure TForm1.ChromiumCPFConsoleMessage(Sender: TObject;
  const browser: ICefBrowser; const message, source: ustring; line: Integer;
  out Result: Boolean);
begin
   if pos('N� do CPF', message) > 0 then
      EdtCPF.Text := copy(message,11,length(message));

   if pos('Nome', message) > 0 then
      EditRazaoSocial.Text := copy(message,7,length(message));

   if pos('Data Nascimento', message) > 0 then
      EdtDataNasc.Text := copy(message,18,length(message));

   if pos('Situa��o Cadastral', message) > 0 then
      EditSituacao.Text := copy(message,21,length(message));

   if pos('D�gito Verificador', message) > 0 then
      EdtDigitoVerificador.Text := copy(message,21,length(message));

   if  pos('C�digo de controle do comprovante', message) > 0 then
      EdtCodCtrlControle.Text := copy(message,36,length(message));

   if  pos('Comprovante emitido �s', message) > 0 then
      EdtEmissao.Text := copy(message,25,length(message));
end;

procedure TForm1.FormShow(Sender: TObject);
begin
   Form1.Caption := 'Sincronizar Cadastro com Receita Federal - Pessoa F�sica';
   NovaConsultaCPF;
end;

procedure TForm1.NovaConsultaCPF;
begin
   Link := 'http://cpf.receita.fazenda.gov.br/situacao/default.asp';
   ChromiumCPF.Load(Link);
end;

end.
