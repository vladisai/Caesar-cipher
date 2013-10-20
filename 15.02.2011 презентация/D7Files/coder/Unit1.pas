unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
var a,b,c,d,i,j,d1,g,v: longint;
g1: array [1..1000] of longint;
s,s1: ansistring;
const
alph: string='абвгдежзийклмнопрстуфхцчшщьыъэюя';
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  g:=0;
  if Edit1.Text=''then begin
    showmessage('Введите в поле число сдвига символов!');
    g:=1;
  end;
  if Memo1.Lines.Text='' then begin
    g:=1;
    showmessage('Введите текст, который нужно расшифровывать!');
  end;
  if g=0 then begin
  d:=strtoint(Edit1.Text) mod 32;
  s:=ansilowercase(Memo1.Lines.Text);
  s1:=ansilowercase(Memo1.Lines.Text);
  for i:=1 to length(s) do begin
    if pos(s[i],alph)>0 then begin
    d1:=d;
      if  (pos(s[i],alph)+d1) mod 32=0 then
      s1[i]:=alph[length(alph)]
      else
      s1[i]:=alph[(pos(s[i],alph)+d1) mod 32];
    end;
  end;
  Memo2.Lines.Text:=s1;
  end;


end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  s:=Edit1.Text;
  v:=length(s);
  i:=1;
  while i<=Length(s) do begin
  b:=0;
    if not  (s[i] in ['0'..'9']) then begin
      delete(s,i,1);
      i:=1;
      b:=1;
  end;
    if b=0 then
    i:=i+1;
  end;
  Edit1.Text:=s;


end;

end.
