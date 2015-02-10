unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button10Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}



{ TForm1 }

procedure mTo(x:integer; y:integer);
begin
  Form1.Image1.Canvas.MoveTo(x, y);
end;
procedure zmaz();
begin
  Form1.Image1.Canvas.Pen.Color:= clWhite;
  Form1.Image1.Canvas.Brush.Color:= clWhite;
  Form1.Image1.Canvas.Rectangle(Form1.Image1.ClientRect);
  Form1.Image1.Canvas.Pen.Color:= clBlack;
  Form1.Image1.Canvas.Brush.Color:= clBlack;
end;
procedure lTo(x:integer; y:integer);
begin
  Form1.Image1.Canvas.LineTo(x, y);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  zmaz();
end;

procedure setWidth(x:integer);
begin
  Form1.Image1.Canvas.Pen.Width:= x;
end;

procedure setColour();
begin
  Form1.Image1.Canvas.Pen.Color:= random(256*256*256);
end;

procedure setBrush();
begin
  Form1.Image1.Canvas.Brush.Color:= random(256*256*256);
end;

procedure rekt(x1:integer; y1:integer; x2:integer; y2:integer);
begin
    Form1.Image1.Canvas.Rectangle(x1, y1, x2, y2);
end;

procedure elips(x1:integer; y1:integer; x2:integer; y2:integer);
begin
    Form1.Image1.Canvas.Ellipse(x1, y1, x2, y2);
end;

//////////////////////////////////////////////////////////////////

procedure TForm1.Button1Click(Sender: TObject);
var x,y:integer;
begin
  x:= strtointdef(Form1.Edit1.Text, 0);
  y:= strtointdef(Form1.Edit2.Text, 0);
  mTo(x,y);
end;

procedure TForm1.Button10Click(Sender: TObject);
var sx,sy,r,xmin,xmax,ymin,ymax:integer;
begin
  Randomize;
  Form1.Image1.Canvas.Pen.Color:= clWhite;
  r:= 20+random(40);
  xmin:= r;
  ymin:= r;
  xmax:= Form1.Image1.Width - r;
  ymax:= Form1.Image1.Height - r;
  sx:= xmin + random(xmax -xmin +1);
  sy:= ymin + random(ymax -ymin +1);
  elips(sx-r, sy-r, sx+r, sy+r);
end;

procedure TForm1.Button2Click(Sender: TObject);
var x,y:integer;
begin
  x:= strtointdef(Form1.Edit1.Text, 0);
  y:= strtointdef(Form1.Edit2.Text, 0);
  lTo(x,y);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  zmaz();
end;

procedure TForm1.Button4Click(Sender: TObject);
var x,y:integer;
begin
  x:= random(Form1.Image1.Width);
  y:= random(Form1.Image1.Height);
  lTo(x,y);
end;

procedure TForm1.Button5Click(Sender: TObject);
var x:integer;
begin
  x:= random(StrToIntDef(Form1.Edit3.Text, 0));
  setWidth(x);
end;

procedure TForm1.Button6Click(Sender: TObject);
var i,x,y:integer;
begin
  Randomize;
  for i:=0 to 20 do
  begin
    x:= random(Form1.Image1.Width);
    y:= random(Form1.Image1.Height);
    setWidth(random(20)+1);
    setColour();
    lTo(x,y);
  end;
end;

procedure TForm1.Button7Click(Sender: TObject);
var i, x1, y1, x2, y2:integer;
begin
  Randomize;
  for i:= 0 to 20 do
  begin
    setWidth(random(10)+1);
    setBrush();
    setColour();
    x1:= random(Form1.Image1.Width);
    y1:= random(Form1.Image1.Height);
    x2:= random(Form1.Image1.Width);
    y2:= random(Form1.Image1.Height);
    rekt(x1, y1, x2, y2);
  end;
end;

procedure TForm1.Button8Click(Sender: TObject);
var i, x1, y1, x2, y2:integer;
begin
  Randomize;
  for i:= 0 to 20 do
  begin
    setWidth(random(10)+1);
    setBrush();
    setColour();
    x1:= random(Form1.Image1.Width);
    y1:= random(Form1.Image1.Height);
    x2:= random(Form1.Image1.Width);
    y2:= random(Form1.Image1.Height);
    elips(x1, y1, x2, y2);
  end;
end;

procedure TForm1.Button9Click(Sender: TObject);
var i, x1, y1, x2, y2:integer;
begin
  x1:= 100;
  y1:= 100;
  x2:= 150;
  y2:= 150;
  for i:= 0 to 5 do
  begin
    rekt(x1,y1,x2,y2);
    x1 += 50;
    x2 += 50;
  end;
end;

end.

