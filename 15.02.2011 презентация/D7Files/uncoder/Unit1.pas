unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
type arr=array [1..32] of longint;
type ary=array [1..32] of extended;
const alph:string='абвгдежзийклмнопрстуфхцчшщьыъэюя';
const std:array [1..32] of extended=(8.66, 1.51, 4.19, 1.41,2.56,8.10,0.78,1.81,7.45,1.31,3.47,4.32,3.29,6.35,9.28,3.35,5.53,5.45,6.30,2.90,0.4,0.92,0.52,1.27,0.77,0.49,1.90,2.11,0.04,0.17,1.03,2.22);
function code(s: ansistring;
 n: longint):ansistring;
 var i,d1:longint;
 s1: string;
begin
  s1:=s;
      for i:=1 to length(s) do begin
         if pos(s[i],alph)>0 then begin
          d1:=n;
      if  (pos(s[i],alph)+d1) mod 32=0 then
      s1[i]:=alph[length(alph)]
      else
      s1[i]:=alph[(pos(s[i],alph)+d1) mod 32];
    end;
  end;
  code:=s1;
end;
function sums(s: ansistring):longint;
var i,d:longint;
begin
  d:=0;
  for i:=1 to length(s) do begin
    if (s[i]>='а') and (s[i]<='я') then
        d:=d+1;
    end;
  sums:=d;
end;
function perc(s: ansistring):ary;
var i: longint;
k:ary;
begin
  for i:=1 to 32 do begin
    k[i]:=0;
  end;
  for i:=1 to length(s) do begin
    if pos(s[i],alph) <> 0 then
    k[pos(s[i],alph)]:=k[pos(s[i],alph)]+1;
  end;
  for i:=1 to 32 do begin
    k[i]:=100*(k[i] / sums(s));
  end;
  perc:=k;
end;
function dif(a: ary):extended;
var i:longint;
k:extended;
begin
  k:=0;
  for i:=1 to 32 do begin
    k:=k+abs(std[i]-a[i]);
  end;
  dif:=k;
end;
  {$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var i,mini,g:longint;
s1: ansistring;
min: extended;
h:array [0..32] of extended;
str: array [1..32] of ansistring;
begin
  g:=0;
  if Memo1.Lines.text='' then begin
    showmessage('Введите текст, который нужно расшифровать');
    g:=1;
  end;
  if g=0 then begin
  for i:=0 to 31 do begin
    s1:=code(ansilowercase(Memo1.Lines.Text),i);
    str[i]:=s1;
    h[i]:=dif(perc(s1));
  end;
  min:=h[0];
  mini:=0;
  for i:=0 to 31 do begin
    if h[i]<min then begin
      min:=h[i];
      mini:=i;
    end;
  end;
  Memo2.Lines.Text:=str[mini];
end;
end;

end.
